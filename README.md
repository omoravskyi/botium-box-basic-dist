# Botium Box - Community Edition

Chatbots are driving the industry. With Botium we are driving chatbots. Botium is a suite of open source software components that support chatbot makers in training and quality assurance.

Botium Box is running on standard components available for free. You can install it on your own server (on premise), or use cloud providers for serverless installation, or even a mixture of those approaches.

**_IF YOU LIKE WHAT YOU SEE, PLEASE CONSIDER GIVING US A STAR ON GITHUB!_**

## Release Notes

Check them out [in the Botium Wiki](https://botium.atlassian.net/wiki/spaces/BOTIUM/pages/20807681/Botium+Box+Release+Notes)

## Botium Box Installation on Kubernetes

You can run Botium Box on your Kubernetes environment, locally in [Minikube](https://kubernetes.io/de/docs/setup/minikube/), or on a cloud server as [Amazon Elastic Kubernetes Service](https://aws.amazon.com/de/eks/).

Persistent data storage is not part of the Kubernetes definitions in this repository. You can [install MySQL in your Kubernetes environment as well](https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/). All major cloud providers support hosted MySQL installations, for example
* [Amazon RDS for MySQL](https://aws.amazon.com/de/rds/mysql/)
* [Azure Database for MySQL](https://azure.microsoft.com/de-de/services/mysql/)

### Prerequisites

* A working Kubernetes environment
* [kubectl](https://kubernetes.io/de/docs/tasks/tools/install-kubectl/) connected to your Kubernetes environment
* A MySQL-compatible database, installed locally or hosted in the cloud
* MySQL connectivity (check Firewalls etc)
    - MySQL hostname
    - MySQL username
    - MySQL password

Download this Git repository to your local workstation.

### Adapting Configuration

In the file _kubernetes/02-configmap.yml_, enter your MySQL connection information:
* my-mysql-host-name
* my-mysql-user-name
* my-mysql-password

### Deploy to Kubernetes

	> kubectl apply -f ./kubernetes

Wait several minutes for the cluster to come up, then list the status of the services. The *EXTERNAL_IP* column in the line starting with *box* is the **URL to point your browser to**.

```
> kubectl get svc -n botium-box-ce
NAME     TYPE           CLUSTER-IP      EXTERNAL-IP       PORT(S)        AGE
box      LoadBalancer   xxx.xxx.xxx.xxx some-ip-adress    80:32588/TCP   92m
prisma   ClusterIP      xxx.xxx.xxx.xxx <none>            4466/TCP       92m
redis    ClusterIP      xxx.xxx.xxx.xxx <none>            6379/TCP       92m
```

See the log output of Botium Box:

	> kubectl logs -l name=box -n botium-box-ce

## Botium Box Installation with Docker

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

## Install Samples

Botium Box comes with some sample projects installed. You can find more samples to import into Botium Box [here](https://botium.atlassian.net/wiki/spaces/BOTIUM/pages/57671681/Howto+Import+Botium+Samples).

Have fun.

## Frequently Asked Questions

**Can you help me install Kubernetes?**

No.

**Can you help me setup my Kubernetes cluster?**

No.

**Can you help me with my Kubernetes problems?**

No.

**Can you help me install Docker?**

No.

**Can you help me with my Docker problems?**

No.

**Can you help me setting up MySQL?**

No.