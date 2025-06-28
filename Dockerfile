FROM node:21

WORKDIR /

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3001

CMD [ "npm", "run", "prod" ]