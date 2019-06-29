FROM python:3.7.3

RUN pip install redis

COPY ./ ./

ENTRYPOINT ["python", "redis_test.py"]
