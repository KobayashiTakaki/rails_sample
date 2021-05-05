FROM ruby:2.5.3

# install postgres
RUN apt update && apt install -y postgresql-client

# install node
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt update && apt install -y nodejs npm
RUN npm install n -g
RUN n 14.16.1
RUN apt purge -y nodejs npm

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn

WORKDIR /usr/var/app
COPY . .
CMD [ "scripts/run_rails.sh" ]
