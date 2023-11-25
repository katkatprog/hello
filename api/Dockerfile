FROM ruby:3.1.2
ARG API_WORKDIR
WORKDIR ${API_WORKDIR}
ENV TZ Asia/Tokyo
RUN apt -y update && apt -y upgrade
RUN apt install -y git vim curl
RUN gem install rails -v 7.0.4
RUN gem install bundler -v 2.3.14
# # install nodejs(LTS)
# RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
# # install yarn
# RUN npm install --global yarn
