FROM node:alpine as builder
#builder phase/stage

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

# /app/build <-- end directory in container

# new phase/stage starts automatically (single from statement)
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
