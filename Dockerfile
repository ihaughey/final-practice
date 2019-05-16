FROM nginx
LABEL maintainer = "Ian Haughey haug8413@stthomas.edu"
EXPOSE 80
COPY index.html /usr/share/nginx/html
