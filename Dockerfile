FROM ubuntu
RUN apt-get update && apt-get install -y netcat
EXPOSE 5060

CMD ["nc", "-l", "-p", "5060"]
