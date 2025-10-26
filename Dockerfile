FROM python:3.11.7-alpine
WORKDIR /app
COPY requirements.txt /app
COPY main.py /app
EXPOSE 5000
RUN pip install -r requirements.txt
CMD python main.py