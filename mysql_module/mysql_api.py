import os
from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import JSONResponse
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError
from pydantic import BaseModel
from basic import get_logger
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Initialize FastAPI app
app = FastAPI()

# Construct database connection URI
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_HOST = os.getenv('DB_HOST')
DB_PORT = os.getenv('DB_PORT')
DB_NAME = os.getenv('DB_NAME')

if not all([DB_USER, DB_PASSWORD, DB_HOST, DB_PORT, DB_NAME]):
    raise ValueError("One or more database environment variables are not set")

DATABASE_URI = f'mysql+mysqldb://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'
engine = create_engine(DATABASE_URI)

# Get logger instance
logger = get_logger()


class SQLQuery(BaseModel):
    sql: str


@app.post('/query')
async def execute_sql_query(query: SQLQuery, request: Request):
    """
    Endpoint to execute a SQL query and return the results.

    :param query: SQLQuery object containing the SQL statement.
    :param request: Request object for logging purposes.
    :return: JSON response with query results or error message.
    """
    logger.debug(f"Received request: {await request.json()}")
    sql_query = query.sql
    if not sql_query:
        raise HTTPException(status_code=400, detail="SQL query is required")

    try:
        # Execute SQL query
        with engine.connect() as connection:
            result = connection.execute(text(sql_query))
            rows = result.fetchall()
            columns = result.keys()
            result_dict = [dict(zip(columns, row)) for row in rows]
            return JSONResponse(content=result_dict)
    except SQLAlchemyError as e:
        logger.error(f"Database error: {e}")
        raise HTTPException(status_code=500, detail="Internal server error")


if __name__ == '__main__':
    import uvicorn

    uvicorn.run(app, host='0.0.0.0', port=8000)
