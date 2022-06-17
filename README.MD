# Aspen Mesh Demo Site Helm Charts

These are the official Helm charts for the Aspen Mesh Demo Site.

## Prerequisites

The following are required before install the Aspen Mesh Demo Site:

 * Access to an existing [Kubernetes](https://kubernetes.io/docs/home/#set-up-a-k8s-cluster) cluster
 * [Istio 1.13 or higher](https://istio.io/latest/docs/setup/install/) installed in the cluster, with the ingress gateway installed.
 * [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) installed on the machine that you'll be installing the demo site from.
 * [Helm v3](https://helm.sh/docs/intro/install/) client installed on the machine that you'll be installing the demo site from.

## Installation

### Step 1

Add this repository to your Helm client
   
```bash
helm repo add aspenmesh-demo https://aspenmesh.github.io/aspenmesh-demo-site-charts/

"aspenmesh-demo" has been added to your repositories
```

### Step 2

Update your Helm client

```bash
helm repo update

Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "aspenmesh-demo" chart repository
```

### Step 3

Search for the Aspen Mesh chart

```bash
helm search repo aspenmesh

NAME                         	CHART VERSION	APP VERSION	DESCRIPTION         
aspenmesh-demo/aspenmesh-demo	0.1.0        	           	Aspen Mesh Demo Site
```

### Step 4

Create a DNS record in your DNS provider for the frontend of the site.  This record should point to the hostname (CNAME) or the IP address (A) of the Istio Ingress Gateway's `EXTERNAL-IP` value.

```
kubectl get svc -n istio-ingress istio-ingress

NAME            TYPE           CLUSTER-IP       EXTERNAL-IP  PORT(S)                                      AGE
istio-ingress   LoadBalancer   172.20.253.198   <hostname>   15021:31684/TCP,80:31395/TCP,443:30800/TCP   5h29m
```

### Step 5

Install the Aspen Mesh Demo Site in an existing cluster.  Note that you need to set the `otel.otelcollector.tenantName` value to the value given to you by Aspen Mesh, and the `frontend.hostnames` value to the DNS hostname in [Step 4](#step-4).

```
helm install aspenmesh-demo aspenmesh-demo/aspenmesh-demo --set otel.otelcollector.tenantName=mytenantname --set "frontend.hostnames={demo.mysite.com}" 

NAME: aspenmesh-demo
LAST DEPLOYED: Fri Jun 17 15:48:57 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
```

### Step 6

You should now be able to view the demo site in your browser using the DNS hostname from [Step 4](#step-4).

```
open demo.mysite.com
```



