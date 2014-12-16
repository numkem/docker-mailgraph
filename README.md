docker-mailgraph
================

Docker container for the mailgraph application with lighttpd for cgi server.

h1. Installation

h2. Minimum requirements

The straight minium required is to give a mail log for mailgraph to parse and monitor.

```
docker run -d -p 80:80 -v /var/log/maillog:/tmp/mail.log numkem/mailgraph
```

h2. Keeping the rrd files

Everything is kept in another volumes called `/tmp/rrd`

```
docker run -d -p 80:80 -v /var/log/maillog:/tmp/mail.log -v /home/rrd/:/tmp/rrd
```
