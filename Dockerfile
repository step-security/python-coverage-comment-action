FROM python:3.14-alpine@sha256:05b2b8b732ecd268fee8727a369f936f022d1321b59befd13c30ede22769dcdc

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
