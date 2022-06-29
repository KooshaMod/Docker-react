FROM node:16-alpine as builder

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

WORKDIR /usr/app/build

COPY --from=builder /usr/app/build /usr/share/nginx/html

# in the above COPY whit --from we are saying copy from the builder phase. and then specify the folder that we want
# we only need the build file all other files are there to make that build folder and then we copy that in /usr/share/nginx/html

# nginx said in its documentation to copy in that path

# THe default command for nginx base image is to run nginx
