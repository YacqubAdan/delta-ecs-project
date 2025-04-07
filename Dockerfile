# build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY app/package.json . 
RUN npm install
COPY app/ .
RUN npm run build

# prod stage
FROM node:18-alpine AS prod
WORKDIR /app
COPY --from=build /app/dist /app/dist
RUN npm i -g serve
EXPOSE 3000
CMD [ "serve", "-s", "dist" ]
