FROM continuumio/miniconda3

# Установка переменной окружения для Airflow
ENV AIRFLOW_HOME=/opt/airflow

# Установка bash для активации окружения Conda и необходимых системных зависимостей
RUN apt-get update && apt-get install -y \
    bash \
    build-essential \
    default-libmysqlclient-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Установка Conda и создание нового окружения
RUN conda create -n myenv python=3.8 && \
    echo "source activate myenv" >> ~/.bashrc

# Копирование файла environment.yml
COPY environment.yml .

# Проверка наличия файла в контексте сборки
RUN ls -l

# Установка зависимостей через Conda
RUN /bin/bash -c "source activate myenv && conda env update -n myenv -f environment.yml"

# Установка Airflow в окружение myenv
RUN /bin/bash -c "source activate myenv && pip install apache-airflow==2.0.2"

# Копирование всех скриптов проекта и файла конфигурации Airflow
WORKDIR $AIRFLOW_HOME
COPY . .

# Копирование файла airflow.cfg
COPY airflow.cfg $AIRFLOW_HOME/airflow.cfg

# Копирование скрипта инициализации
COPY init_airflow.sh .

# Установка прав на исполнение скрипта
RUN chmod +x init_airflow.sh

# Запуск скрипта при запуске контейнера
CMD ["/bin/bash", "-c", "source activate myenv && ./init_airflow.sh && airflow webserver"]