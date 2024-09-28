FROM node:latest AS akbar
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

#Stage2
FROM nginx
COPY --from=akbar /app/dist/akbar-app/browser/ /usr/share/nginx/html/