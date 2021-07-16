# We are using 2.7.2 as that is the version used to build the application
# Check your version by typing ruby -v in your terminal
# Replace the version in the dockerfile with the one your pc uses.
FROM ruby:2.7.2
WORKDIR /home/app
ENV PORT 3000
EXPOSE $PORT
RUN gem install bundler
RUN apt-get update -qq && apt-get install -y nodejs npm
RUN npm install --global yarn
COPY . /home/app/
RUN bundler install
CMD rails server -p $PORT -b 0.0.0.0