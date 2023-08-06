FROM node:18.16.0-alpine3.18

RUN npm install --global nodemon
WORKDIR /app
COPY /src/package*.json .
RUN npm install

EXPOSE 3000

COPY . .
CMD [ "npm", "run", "dev" ]