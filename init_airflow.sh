#!/bin/bash

# Инициализация базы данных Airflow
airflow db init

# Создание пользователя
airflow users create -u admin -p admin -r Admin -e admin@example.com -f Admin -l User