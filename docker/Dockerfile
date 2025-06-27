# Use an official Node runtime as a parent image
FROM node:18.17.0 AS builder

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn install --only=production

COPY . .

RUN yarn run build

# Production image using Nginx to serve built files
FROM nginx:alpine

COPY --from=builder /usr/src/app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
