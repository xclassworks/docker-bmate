FROM node:argon

# Create app directory
RUN mkdir -p /bmate
WORKDIR /bmate/

# Install app
RUN git clone https://github.com/xclassworks/bwebclient.git
RUN git clone https://github.com/xclassworks/bserver.git
COPY . /bmate

# Install apps dependencies
WORKDIR /bmate/bwebclient
RUN npm install
WORKDIR /bmate/bserver
RUN npm install

EXPOSE 8989
EXPOSE 80

CMD ["node", "/bmate/bserver/index.js"]
CMD ["node", "/bmate/bwebclient/index.js"]
