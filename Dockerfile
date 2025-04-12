# build stage
FROM node:23-slim AS build
WORKDIR /app
COPY app/package.json .
RUN npm install
COPY app/ .
RUN npm run build

# prod stage
FROM node:23-alpine AS prod
WORKDIR /app
COPY --from=build /app/dist /app/dist
RUN npm i -g serve
RUN addgroup -S appuser && adduser -S -G appuser appuser
RUN chown -R appuser:appuser /app
USER appuser
EXPOSE 3000
CMD [ "serve", "-s", "dist" ]