FROM debian:wheezy

RUN apt-get update && apt-get -y install mailgraph lighttpd supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN lighttpd-enable-mod cgi \
	&& mkdir /tmp/rrd \
	&& chmod 777 /tmp/rrd \
	&& mkdir -p /var/www/cgi-bin/ \
	&& ln -s /usr/lib/cgi-bin/mailgraph.cgi /var/www/cgi-bin/mailgraph.cgi \
	&& sed -i 's|/var/lib/mailgraph|/tmp/rrd|g' /usr/lib/cgi-bin/mailgraph.cgi

VOLUME ["/tmp/mail.log", "/tmp/rrd"]

CMD ["/usr/bin/supervisord"]

EXPOSE 80

