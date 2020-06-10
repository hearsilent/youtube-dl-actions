FROM python:3.8-alpine
LABEL MAINTAINER="hear.silent1995@gmail.com"

RUN apk add --no-cache tzdata
RUN apk --update --no-cache add curl
RUN apk add --no-cache ca-certificates

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

WORKDIR /
COPY entrypoint.sh ./
ENTRYPOINT ["sh", "/entrypoint.sh"]