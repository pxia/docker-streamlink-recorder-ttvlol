FROM python:3.13
LABEL maintainer="lauwarm@mailbox.org"

ENV streamlinkCommit=98991c1

ENV HOME "/home"
ENV PATH "${HOME}/.local/bin:${PATH}"


RUN apt-get update && apt-get install gosu && apt-get install python3-pip -y

RUN pip3 install --upgrade git+https://github.com/streamlink/streamlink.git@${streamlinkCommit}
 
ENV INSTALL_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/streamlink/plugins"
RUN mkdir -p "$INSTALL_DIR"
RUN curl -L -o "$INSTALL_DIR"/twitch.py 'https://github.com/2bc4/streamlink-ttvlol/releases/latest/download/twitch.py'

RUN  echo 'export PATH="${HOME}/.local/bin:${PATH}"'

RUN mkdir /home/download
RUN mkdir /home/script
RUN mkdir /home/plugins

COPY ./streamlink-recorder.sh /home/script/
COPY ./entrypoint.sh /home/script

RUN ["chmod", "+x", "/home/script/entrypoint.sh"]

ENTRYPOINT [ "/home/script/entrypoint.sh" ]

CMD /bin/sh ./home/script/streamlink-recorder.sh ${streamOptions} ${streamLink} ${streamQuality} ${streamName}
