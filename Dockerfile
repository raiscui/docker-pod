FROM raiscui/ssh-ubuntu:ch-SRC-aptfast
RUN apt-fast update -y && apt-fast upgrade -y
RUN apt-fast install -y git
RUN apt-fast install -y npm

RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN npm install -g pod
RUN ln -s /usr/local/lib/node_modules/pod/node_modules/pm2/bin/pm2 /usr/local/bin/pm2

VOLUME ["/.pm2","/nodeapp"]

#RUN mkdir /nodeapp
#RUN echo "/nodeapp" | pod 
RUN pod && echo "/nodeapp"

ADD podrc /.podrc
RUN rm -f /run.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 22 80 19999 
CMD ["/run.sh"]
