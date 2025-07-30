FROM nginx:alpine

#removing default static files
RUN rm -rf /usr/share/nginx/html/*

copy build/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
