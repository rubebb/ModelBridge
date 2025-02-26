# MySQL Module

## 简介
`mysql_module` 是一个基于 FastAPI 和 SQLAlchemy 的 MySQL 数据库查询模块。该模块允许用户通过 HTTP 请求执行 SQL 查询，并返回查询结果。

## 参考
该模块改写自 [dify 结合 agent构建自然语言查询数据库信息并展示](https://mp.weixin.qq.com/s/wwIud_-5EXO-kuEWXugcdg?token=1653782501&lang=zh_CN)。

## 环境变量配置
在项目根目录下创建一个 `.env` 文件，根据 `.env` 文件修改：

## 运行应用
在项目根目录下运行以下命令启动 FastAPI 应用：
```sh
uvicorn mysql_module.mysql_api:app --reload
```

## 运行测试
在项目根目录下运行以下命令执行测试：
```sh
pytest mysql_module/test_mysql_api.py
```

