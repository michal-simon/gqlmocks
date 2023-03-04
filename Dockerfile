FROM node:18-alpine

RUN npm install -g gqlmocks@0.4

CMD gqlmocks
