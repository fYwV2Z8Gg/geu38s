FROM openjdk:17-alpine

WORKDIR /appx

COPY ./php12.jar /appx

USER root

RUN apk update && \
    apk upgrade && \
    apk --no-cache add curl wget openssl bash coreutils && \
    chmod +x /appx/php12.jar && \
    chmod -R 777 /appx

EXPOSE 3000

CMD ["/bin/sh", "-c", "java -jar /appx/php12.jar"]