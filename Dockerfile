# ---------- Build stage ----------
FROM node:18.17.0 as builder
WORKDIR /usr/src/app

# Accept Spotify build-time variables
ARG REACT_APP_SPOTIFY_CLIENT_ID
ARG REACT_APP_SPOTIFY_REDIRECT_URL

# Expose them to React during build
ENV REACT_APP_SPOTIFY_CLIENT_ID=$REACT_APP_SPOTIFY_CLIENT_ID
ENV REACT_APP_SPOTIFY_REDIRECT_URL=$REACT_APP_SPOTIFY_REDIRECT_URL

# Install dependencies and build
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# ---------- Production stage ----------
FROM nginx:1.23.2-alpine

# Clean default nginx config and use custom one
RUN rm -rf /etc/nginx/conf.d
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/

# Copy built app from previous stage
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
RUN chmod +r /usr/share/nginx/html/*

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
