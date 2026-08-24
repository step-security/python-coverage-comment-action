# See Dockerfile.build for instructions on bumping this.
FROM ghcr.io/py-cov-action/python-coverage-comment-action-base:v7@sha256:b9e711e0233b04cd64a35d10fe4fb2f825a6a4f1faa399097aefd667704b8d2e

COPY coverage_comment ./coverage_comment
RUN md5sum -c pyproject.toml.md5 || pip install -e .
