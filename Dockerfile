FROM python:alpine3.6

RUN apk update && \
    apk add --virtual build-deps gcc musl-dev python3-dev libffi-dev openssl-dev

RUN pip install cryptography

# RUN \
# 	mkdir -p /aws && \
# 	apk -Uuv add groff less python py-pip && \
# 	pip install awscli && \
# 	apk --purge -v del py-pip && \
# 	rm /var/cache/apk/*

RUN pip install aws-encryption-sdk-cli
