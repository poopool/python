FROM applariat/pycharm-python:v1

ARG artifact_root="."

COPY $artifact_root/build.sh /build.sh
COPY $artifact_root/entrypoint.sh /entrypoint.sh
COPY supervisord.conf /supervisord.conf
COPY pycharm_helpers/ /root/.pycharm_helpers

RUN chmod +x /build.sh /entrypoint.sh && /build.sh

WORKDIR /usr/src/app

EXPOSE 8080
EXPOSE 22

CMD ["/usr/bin/supervisord"]
