FROM node:20-alpine

WORKDIR /gqlmocks

RUN npm install @babel/preset-typescript @babel/preset-env graphql-mocks gqlmocks@0.5.1

CMD ["npx", "gqlmocks"]
