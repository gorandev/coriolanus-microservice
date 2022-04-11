# ruby-tweet-microservice

# the microservice use a database in sqlite3 for save 10 tweets by topic

#git clone https://gitlab.com/EosWeb/ruby-tweet-microservice.git

Dockerfile
```
FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN apt update && apt install -y sqlite3 vim

COPY . .

```


# Run file

microservice.sh
```
docker run -it \
    -v <path_of_project>/ruby-tweet-microservice:/usr/src/microservice \
    -w /usr/src/microservice app:latest bash
```

First time Run migrations
```
# sh microservice.sh
# rake db:migrate
```

get Tweets
```
# sh microservice.sh
# ruby get.rb "<topic of tweets to get>" 
```


