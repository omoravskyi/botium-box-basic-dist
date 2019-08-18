# Botium Box - Community Edition

Chatbots are driving the industry. With Botium we are driving chatbots. Botium is a suite of open source software components that support chatbot makers in training and quality assurance.

Botium Box is running on standard components available for free. You can install it on your own server (on premise), or use cloud providers for serverless installation, or even a mixture of those approaches.

**_IF YOU LIKE WHAT YOU SEE, PLEASE CONSIDER GIVING US A STAR ON GITHUB!_**

## Botium Box Installation

You can run Botium Box on your own server on-premise, or on a cloud server - for example, see [here](https://acloudxpert.com/how-to-install-docker-compose-on-amazon-linux-ami/) for instructions how to set up docker and docker-compose on an Amazon EC2 instance.

### Prerequisites

* [docker](https://www.docker.com/get-started)
* [docker-compose](https://docs.docker.com/compose/install/)

_If you have a firewall, you have to make sure that it allows inbound connections to port 4000 (default Botium Box listen port), or any other port if you are not using the default port_

### Run Botium Box

The Docker-Compose file contains all prerequisites for running Botium Box and is the recommended and most easy way to run Botium Box.

1. Download [docker-compose.yml](https://github.com/codeforequity-at/botium-box-basic-dist/blob/master/docker-compose.yml)
	> curl --output docker-compose.yml https://raw.githubusercontent.com/codeforequity-at/botium-box-basic-dist/master/docker-compose.yml

2. Start Botium Box by running docker-compose:
	> docker-compose up -d

3. Show log output from docker-compose (optional):
	> docker-compose up -d

4. Point your browser to http://127.0.0.1:4000 (or the IP address of your cloud server)

_To make your Botium testsets, resources and working directory point to a folder of your choice, you have to edit the docker-compose.yml file!_

### Update Botium Box

If you already have installed Botium Box before and just want to update to the latest Botium Box build, run this:

```
> docker-compose stop
> docker-compose pull
> docker-compose up -d
> docker-compose logs -f
```

## Login to Botium Box

Default usernames: 
* admin
* testmanager
* tester
* guest

Default password: "nooneknows"

Have fun.
