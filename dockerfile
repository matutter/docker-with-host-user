FROM ubuntu:bionic
ADD docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/bin/bash", "/docker-entrypoint.sh" ]
