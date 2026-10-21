FROM python:3.15-alpine@sha256:2699b90f4d562a22e2dd076c82f964032f64814204bff36d271a54ba4cc2c7e2

RUN apk upgrade --no-cache && \
    apk add --no-cache git-lfs

# https://github.com/actions/runner-images/issues/6775
RUN git config --system --add safe.directory '*'

WORKDIR /workdir

COPY pyproject.toml LICENSE ./
RUN md5sum pyproject.toml > pyproject.toml.md5

COPY coverage_comment ./coverage_comment
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
ENV PIP_ROOT_USER_ACTION=ignore
ENV PIP_NO_CACHE_DIR=off

RUN pip install -e .

CMD [ "coverage_comment" ]
