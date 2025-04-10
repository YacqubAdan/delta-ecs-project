# build stage
FROM node:23-slim AS build
ARG API_KEY
WORKDIR /app
COPY app/package.json .
RUN npm install
COPY app/ .
RUN npm run build

# prod stage
FROM node:23-alpine AS prod
ARG API_KEY 
WORKDIR /app
COPY --from=build /app/dist /app/dist
ENV API_KEY=$API_KEY 
RUN npm i -g serve
EXPOSE 3000
CMD [ "serve", "-s", "dist" ] 