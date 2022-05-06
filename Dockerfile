FROM ubuntu
RUN apt-get update && apt-get install -y netcat
EXPOSE 5061

#CMD ["nc", "-l", "-p", "5061"]
CMD ["nc", "-ul", "-p", "5061"]
