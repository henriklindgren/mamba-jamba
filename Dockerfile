FROM python:3.9-slim

RUN addgroup --system --gid 999 jamba && \
adduser --gid 999 --uid 999 --system --disabled-password --no-create-home mamba

RUN mkdir -p /var/opt/pypiserver/packages && \
chown mamba:jamba -R /var/opt/pypiserver

RUN pip install --upgrade pip && pip install pypiserver

USER mamba
EXPOSE 8080
CMD ["pypi-server", "-p", "8080", "/var/opt/pypiserver/packages"]
