# Docker Container for GraphQL Mock Server

[![Codeac.io](https://static.codeac.io/badges/2-609545848.svg "Codeac.io")](https://app.codeac.io/github/michal-simon/gqlmocks)

This container is usefull in you local development environment or for integration testing also locally or in your CI pipeline.

Thanks to module [gqlmocks](http://www.graphql-mocks.com/docs/cli/quick-mocking/) you can simply share a schema of a third party service inside the container and get a fully working GraphQL API.

This is an example of a `docker-compose.yml` you can use:

```yaml
version: "3.7"

services:
  graphql-api-mock:
    image: michalsimon/gqlmocks:latest
    volumes:
      - ./api.graphql:/gqlmocks/schema.graphql
    command: npx gqlmocks serve --port=4002 --schema=/schema/schema.graphql
    ports:
      - 4002:4002
```

According to the [documentation](http://www.graphql-mocks.com/docs/handler/introducing-handler/), you can also define mock `handler.js` to serve your own mock data:

```js
const fs = require('fs');
const { GraphQLHandler } = require("graphql-mocks");

const schema = fs.readFileSync('schema/schema.graphql', {
  encoding: 'utf8',
  flag: 'r',
});

const resolverMap = {
  Query: {
    userInfo() {
      return {
        id: 'ef2699bb-0977-48e6-8f07-42118d34660d',
      };
    },
   },
};

module.exports = new GraphQLHandler({
  resolverMap,
  dependencies: {
    graphqlSchema: schema,
  },
});
```

To use a custom handler your command needs to have the correct parameter: 
```bash
npx gqlmocks serve --port=4002 --schema=/schema/schema.graphql --schema=/gqlmocks/schema.graphql
```
