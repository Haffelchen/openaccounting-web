FROM node:10.17.0

WORKDIR /oa-web
COPY . .

RUN npm install

CMD ["npm", "run", "--", "ng", "serve", "--host", "0.0.0.0", "--disable-host-check"]
