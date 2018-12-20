FROM ubuntu:18.04

# Locales
RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8' DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

# Switch apt mirror:
RUN perl -pi -e"s#archive\.ubuntu\.com#mirror.yandex.ru#g" /etc/apt/sources.list

# Common packages
RUN apt-get update && apt-get install -y \
      build-essential \
      software-properties-common sudo man-db \
	  perl perl-doc libterm-readkey-perl libterm-readline-perl-perl libterm-readline-gnu-perl cpanminus ack-grep mysql-client-core-5.7 libmysqlclient-dev libdbi-perl libdbd-mysql libdbd-mysql-perl libdbd-pg-perl libdatetime-perl libmoose-perl libdbix-class-schema-loader-perl \
      tzdata \
      psmisc \
      curl \
      git \
      wget \
      tmux \
      vim exuberant-ctags \
      mosh \
      python3 python3-dev python3-pip python3-numpy python3-pandas python3-skimage-lib \
	  ruby ruby-dev

RUN cpanm Mojolicious Mojolicious::Plugin::AccessLog Mojolicious::Plugin::Authentication Mojolicious::Plugin::CHI CHI::Driver::Memcached::libmemcached MooseX::MarkAsMethods Exporter::Easy Devel::Backtrace
# takes too long and looks like cpanm kills it (w/o output)
# in debug mode it finishes successfully
RUN cpanm --verbose Cache::Memcached::libmemcached

# w/o it it breaks on xgboost lightgbm jupyter install
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3
RUN alias pip3='/usr/local/bin/pip3'
RUN pip3 install --upgrade scikit-image scipy
RUN pip3 install xgboost lightgbm jupyter
# pytorch from https://pytorch.org/
RUN pip3 install https://download.pytorch.org/whl/cpu/torch-1.0.0-cp36-cp36m-linux_x86_64.whl
RUN pip3 install torchvision
# last, not to break pip, as in shell, where you need to restart shell to run it ok (most probably binary reference changed)
#RUN pip3 install --upgrade pip

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
RUN mkdir -p /root/.jupyter
COPY ./jupyter/* /root/.jupyter/
RUN mkdir -p /root/.ipython
COPY ./ipython/* /root/.ipython/

# Set up volumes
WORKDIR /projects
VOLUME /projects
VOLUME /keys

# Enable colors
ENV TERM=xterm-256color

CMD ["tmux"]
