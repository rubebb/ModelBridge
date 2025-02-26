import pytest
from fastapi.testclient import TestClient
from sqlalchemy import create_engine, text

from mysql_module.mysql_api import app, DATABASE_URI

# Initialize TestClient
client = TestClient(app)


# Setup and teardown for database
@pytest.fixture(scope="module")
def setup_database():
    engine = create_engine(DATABASE_URI)
    connection = engine.connect()
    transaction = connection.begin()
    yield connection
    transaction.rollback()
    connection.close()


def test_execute_sql_query(setup_database):
    # Create a test table
    setup_database.execute(text("CREATE TABLE IF NOT EXISTS test_table (id INT PRIMARY KEY, name VARCHAR(50))"))
    setup_database.execute(text("INSERT INTO test_table (id, name) VALUES (1, 'test_name')"))
    setup_database.execute(text("COMMIT"))

    # Define the SQL query to test
    query = {
        "sql": "SELECT * FROM test_table"
    }

    # Send a POST request to the /query endpoint
    response = client.post("/query", json=query)

    # Assert the response status code and content
    assert response.status_code == 200
    assert response.json() == [{"id": 1, "name": "test_name"}]

    # Clean up the test table
    setup_database.execute(text("DROP TABLE test_table"))
