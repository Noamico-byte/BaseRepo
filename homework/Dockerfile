FROM httpd:2.4
COPY index.html /usr/local/apache2/htdocs/
FROM haproxy:latest
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY ssl.pem /etc/ssl/
