FROM node:18.7.0 as build

WORKDIR /app
COPY . /app
RUN yarn build

FROM nginx:latest

COPY --from=build /app/build /usr/share/nginx/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
