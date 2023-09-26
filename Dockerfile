FROM python:3.9

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask uWSGI requests==2.5.1 redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh /

# EXPOSE 9090 9191
# EXPOSE 5000
# USER uwsgi
# CMD ["python", "identidock.py"]
RUN chmod +x /cmd.sh
# CMD ["/cmd.sh"]
ENTRYPOINT [ "/bin/sh", "/cmd.sh" ]
# CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "app/Identidock.py", "--callable", "app", "--stats", "0.0.0.0:9191"]