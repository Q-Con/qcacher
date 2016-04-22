FROM nginx:1.9-alpine
MAINTAINER Dan Porter <dpreid@gmail.com>

COPY conf /etc/nginx

RUN mkdir -p /srv/cache/{installs,other,temp} && nginx -t

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
