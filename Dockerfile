FROM ubuntu:20.04
ARG port

COPY . /app/

WORKDIR /app
RUN apt update && apt install -y python3 python3-pip wget
RUN pip3 install -r requirements.txt
RUN wget --no-check-certificate https://cloud.fotoverifier.eu/namesleuth/flickr_ids
ENV PORT $port

CMD ["python3","-u","server.py"]
