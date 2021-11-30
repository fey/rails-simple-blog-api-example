FROM ruby:3.0.2

WORKDIR /home/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN chmod +x scripts/start.sh

CMD ["./scripts/start.sh"]
