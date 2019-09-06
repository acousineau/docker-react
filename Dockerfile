FROM node:alpine as build_phase
RUN npm install -g yarn
WORKDIR /usr/app
COPY ./package.json ./
RUN yarn
COPY ./ ./
RUN yarn build

# /usr/app/build
FROM nginx
COPY --from=build_phase /usr/app/build /usr/share/nginx/html
