FROM node:18-alpine

WORKDIR /gqlmocks

RUN npm install @babel/preset-typescript @babel/preset-env graphql-mocks gqlmocks@0.4

CMD ["npx", "gqlmocks"]
