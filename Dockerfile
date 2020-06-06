FROM thehiveproject/cortex:3.0.1
RUN apt-get update && apt-get -y upgrade && rm -rf /var/lib/apt/lists/*
RUN cd /opt/Cortex-Analyzers && git pull && cd .. && for I in $(find Cortex-Analyzers -name 'requirements.txt'); do pip2 install -r $I; done && for I in $(find Cortex-Analyzers -name 'requirements.txt'); do pip3 install -r $I || true; done
RUN find /opt/Cortex-Analyzers -mindepth 1 -maxdepth 1 -exec rm -rf '{}' \;
ENV LANG=C.UTF-8
ENV JAVA_HOME=/usr/local/openjdk-8
ENV PATH=/usr/local/openjdk-8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR /opt/cortex
USER root
EXPOSE 9001
ENTRYPOINT ["/opt/cortex/entrypoint"]
CMD []
