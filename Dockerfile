FROM python:3.9-slim


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# RUN python -m pip install --no-cache-dir --upgrade pip setuptools \
#     && pip install --no-cache-dir -r requirements.txt \
#     && rm requirements.txt

RUN python3 -m pip install --no-cache-dir --upgrade "pip<21.0" setuptools wheel \
    && python3 -m pip install --no-cache-dir --use-deprecated=legacy-resolver -r requirements.txt \
    && rm requirements.txt

ARG STAGE
ARG TENANT
ARG REDSHIFT_USERNAME
ARG REDSHIFT_PASSWORD
ARG REDSHIFT_HOST
ARG REDSHIFT_PORT
ARG REDSHIFT_IAM_ROLE
ARG DATA_LAKE
ARG DATA_LAKE_TYPE
ARG DATA_LAKE_ROOT_PATH
ENV STAGE=$STAGE \
    TENANT=$TENANT \
    REDSHIFT_USERNAME=$REDSHIFT_USERNAME \
    REDSHIFT_PASSWORD=$REDSHIFT_PASSWORD \
    REDSHIFT_HOST=$REDSHIFT_HOST \
    REDSHIFT_PORT=$REDSHIFT_PORT \
    REDSHIFT_IAM_ROLE=$REDSHIFT_IAM_ROLE \
    DATA_LAKE=$DATA_LAKE \
    DATA_LAKE_TYPE=$DATA_LAKE_TYPE \
    DATA_LAKE_ROOT_PATH=$DATA_LAKE_ROOT_PATH 

EXPOSE 8050
COPY main_app.py /root/content/main_app.py
COPY static/ /root/content/static/
COPY templates/ /root/content/templates/
CMD ["python3", "/root/content/main_app.py"]
