# Lets Encrypt Sync to Web Farm

So I have a webfarm of Apache nodes that answer HTTP requests for various
virtual hosts.  I want to use LE to provide valid certs for these hosts, but
since requests can go to a number of nodes, this creates a challenge.  So the
idea in mind is the following workflow

1. From a service node, have a local directory served out by the simple python
web server, which listens for requests on 8081.
2. For each apache node, proxy any `/.well-known/acme-challenge/` request
to the service node on port 8081.  A global conf can do this.
3. Run the LE autorenew script on this server node for all the domains of
interested and use that local directory above.
4. If changes (can we detect?) rsync the resulting certs out to the farm and
reload the Apache process

I suspect somebody much smarter than me already figured this out and has a
more elegant solution!

## Deployment to /opt

1. `cd /opt`
2. `git clone https://github.com/akrherz/lesync.git`
3. `python -m pip install certbot`
