import os

from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago

BASE_PATH = os.path.dirname(__file__)


def run_ann_script():
    os.system(f"python {BASE_PATH}/../ann.py")


default_args = {
    "owner": "airflow",
    "start_date": days_ago(1),
}

dag = DAG(
    "ann_training_dag",
    default_args=default_args,
    schedule_interval=None,
)

run_ann = PythonOperator(
    task_id="run_ann_script",
    python_callable=run_ann_script,
    dag=dag,
)

run_ann
