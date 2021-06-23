FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# elasticbeanstalk vidi ovaj expose port i mapira ga na aws
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
