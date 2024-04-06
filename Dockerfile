FROM nginx

WORKDIR /app

COPY . .

COPY index.html /usr/share/nginx/html

EXPOSE 80