FROM node:10.17.0

WORKDIR /oa-web
COPY . .

RUN npm install

#CMD ["npm", "run", "--", "ng", "serve", "--host", "0.0.0.0", "--disable-host-check", '--prod']


RUN npm run ng build -- --prod

FROM nginx:alpine
COPY --from=0 /oa-web/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]