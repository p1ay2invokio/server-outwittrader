FROM node:21

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3001

CMD [ "npm", "run", "prod" ]