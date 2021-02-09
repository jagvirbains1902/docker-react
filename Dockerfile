# build phase
FROM node:alpine as builder

# set work directory
WORKDIR /app

# copy package.json and install the dependencies
COPY package.json .
RUN npm install

# copy the code
COPY . .

# build the app
RUN npm run build

# use nginx as base image
FROM nginx

# copy the build from previous phase
COPY --from=builder /app/build /usr/share/nginx/html
