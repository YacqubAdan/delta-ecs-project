# build stage
FROM node:23-slim AS build
ARG VITE_RAPID_API_KEY
WORKDIR /app
COPY app/package.json .
RUN npm install
COPY app/ .
RUN npm run build

# prod stage
FROM node:23-alpine AS prod
ARG VITE_RAPID_API_KEY
WORKDIR /app
COPY --from=build /app/dist /app/dist
ENV VITE_RAPID_API_KEY=$VITE_RAPID_API_KEY
RUN npm i -g serve
EXPOSE 3000
CMD [ "serve", "-s", "dist" ] 