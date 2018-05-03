FROM ubuntu:16.04

# Locales
RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8' DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

# Switch apt mirror:
RUN perl -pi -e"s#archive\.ubuntu\.com#mirror.yandex.ru#g" /etc/apt/sources.list

# Common packages
RUN apt-get update && apt-get install -y \
      build-essential \
      software-properties-common \
	  perl \
	  libterm-readkey-perl \
	  libterm-readline-perl-perl \
	  libterm-readline-gnu-perl \
	  cpanminus \
	  ack-grep \
      tzdata \
      psmisc \
      curl \
      git \
      wget \
      tmux \
      vim \
      exuberant-ctags \
      mosh \
      python3 \
      python3-dev \
      python3-pip
# TODO
# ML packages here

# Install Node.js LTS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Set up timezone
ENV TZ 'Asia/Krasnoyarsk'
RUN echo $TZ > /etc/timezone && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	dpkg-reconfigure -f noninteractive tzdata

# Set up dotfiles
COPY ./bash/* /root/
COPY ./vim/ /root/
COPY ./git/* /root/
COPY ./mysql/* /root/

# Set up volumes
WORKDIR /projects
VOLUME /projects
VOLUME /keys

# Enable colors
ENV TERM=xterm-256color

CMD ["tmux"]
