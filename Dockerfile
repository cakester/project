FROM python:3.8

WORKDIR /home/project

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY app app
COPY migrations migrations
COPY project.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP project.py

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]