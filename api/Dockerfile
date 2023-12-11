FROM ruby:3.2.2
ARG API_WORKDIR
WORKDIR ${API_WORKDIR}
ENV TZ Asia/Tokyo
RUN apt -y update && apt -y upgrade
RUN apt install -y git vim curl
RUN echo "gem: --no-document" >> ~/.gemrc
# RUN gem install rails -v 7.0.4
# RUN gem install bundler -v 2.3.14
