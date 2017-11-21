FROM python:alpine3.6

RUN apk update && \
    apk add --virtual build-deps gcc musl-dev python3-dev libffi-dev openssl-dev

RUN pip install cryptography aws-encryption-sdk-cli

ENTRYPOINT ["aws-encryption-cli"]
