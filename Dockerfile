FROM ubuntu:20.04
RUN apt update -y
RUN apt install python3.8 -y
RUN apt install -y vim net-tools iputils-ping python3-pip 

RUN apt update -y 
RUN apt install -y language-pack-ko fonts-nanum fonts-nanum-coding fonts-noto-cjk
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

RUN echo 'alias python=python3.8' >> .bashrc
EXPOSE 5000
COPY ./app.py /app/
RUN python3 -V
RUN pip3 install --upgrade pip

RUN pip3 install werkzeug==2.2.2
RUN pip3 install flask==2.2.2 
CMD ["python3", "app.py"]
