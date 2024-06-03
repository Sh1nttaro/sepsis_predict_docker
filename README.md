# Sepsis Prediction Dockerized

Этот проект представляет собой пример Docker контейнера для запуска модели предсказания сепсиса, построенной с использованием библиотек TensorFlow, scikit-learn и MLflow в среде Apache Airflow.

## Установка

1. Установите Docker на вашем компьютере, если это еще не сделано.
2. Склонируйте этот репозиторий:

    ```
    git clone https://github.com/yourusername/sepsis-prediction-docker.git
    ```

3. Перейдите в каталог проекта:

    ```
    cd sepsis-prediction-docker
    ```

4. Соберите Docker контейнер:

    ```
    docker build -t sepsis_prediction .
    ```

## Использование

После успешного создания Docker контейнера, вы можете запустить его следующей командой:

docker run sepsis_prediction
