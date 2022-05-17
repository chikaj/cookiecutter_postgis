const http = require("http");
const { postgraphile } = require("postgraphile");

const db_url = "postgres://" + 
               process.env.POSTGRES_USER + ":" +
               process.env.POSTGRES_PASSWORD + "@" +
               process.env.POSTGRES_HOST + ":" +
               process.env.POSTGRES_PORT + "/" +
               process.env.POSTGRES_DB;

http
  .createServer(
    // postgraphile(db_url, process.env.POSTGRES_SCHEMA, {
    // postgraphile(db_url, 'forum_example', {
    postgraphile('postgres://forum_example_postgraphile:xyz@pg:5432/pgphile', 'forum_example', {
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true,
      retryOnInitFail: true,
      pgDefaultRole: 'forum_example_anonymous',
      jwtSecret: 'aGreatBigJWTSecret',
      jwtPgTypeIdentifier: 'forum_example.jwt_token',
    })
  )
  .listen(process.env.GRAPHQL_PORT);
