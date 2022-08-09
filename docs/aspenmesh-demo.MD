# Aspen Mesh Demo Site

The Aspen Mesh demo site is meant to demonstrate features of Aspen Mesh.  It is composed of 9 microservices.  It also has the Aspen Mesh Collector and Agents.

## Installation

### Step 1
Make sure you've set up the Aspen Mesh Helm repository in this repository's [README](../README.MD).

### Step 2

Create a DNS record in your DNS provider for the frontend of the site.  This record should point to the hostname (CNAME) or the IP address (A) of the Istio Ingress Gateway's `EXTERNAL-IP` value.

```bash
kubectl get svc -n istio-ingress istio-ingress

NAME            TYPE           CLUSTER-IP       EXTERNAL-IP  PORT(S)                                      AGE
istio-ingress   LoadBalancer   172.20.253.198   <hostname>   15021:31684/TCP,80:31395/TCP,443:30800/TCP   5h29m
```

### Step 3

Install the Aspen Mesh Demo Site in an existing cluster.  Note that you need to set the `aspenmeshCollector.collectorConfig.prometheusRemoteWriteExporter.HEADERS.tenantName` value to the value given to you by Aspen Mesh, and the `frontend.hostnames` value to the DNS hostname in [Step 4](#step-4).

```bash
helm install aspenmesh-demo aspenmesh/aspenmesh-demo --set aspenmeshCollector.collectorConfig.prometheusRemoteWriteExporter.HEADERS.tenantName=mytenantname --set "frontend.hostnames={demo.mysite.com}" 

NAME: aspenmesh-demo
LAST DEPLOYED: Fri Jun 17 15:48:57 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
```

### Step 4

You should now be able to view the demo site in your browser using the DNS hostname from [Step 4](#step-4).

```bash
open demo.mysite.com
```