RUN apt-get update && apt-get install -qq -y build-essential libpq-dev wget chrpath libssl-dev
RUN apt-get install -qq -y libfreetype6 libfreetype6-dev
RUN apt-get install -qq -y libfontconfig1 libfontconfig1-dev
RUN apt-get install -qq -y software-properties-common
RUN apt-get install -qq -y unzip xvfb libxi6 libgconf-2-4
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

ENV INSTALL_PATH /test2

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler:2.2.3
RUN bundle install
RUN gem install dotenv

COPY package*.json .
COPY yarn.lock .

RUN yarn install

COPY . .

ENTRYPOINT ["/usr/local/bin/bundle", "exec", "dotenv", "-f", ".env", "sidekiq", "-C"]
CMD ["config/sidekiq.yml"]