# Aspen Mesh Helm Charts

These are the official Helm charts for Aspen Mesh.

## Prerequisites

The following are required before install Aspen Mesh applications:

 * Access to an existing [Kubernetes](https://kubernetes.io/docs/home/#set-up-a-k8s-cluster) cluster
 * [Istio 1.13 or higher](https://istio.io/latest/docs/setup/install/) installed in the cluster.
 * [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) installed on the machine that you'll be installing the demo site from.
 * [Helm v3](https://helm.sh/docs/intro/install/) client installed on the machine that you'll be installing the demo site from.

## Adding the Aspen Mesh Helm Repository

### Step 1

Add this repository to your Helm client
   
```bash
helm repo add aspenmesh https://aspenmesh.github.io/aspenmesh-charts/
```
```bash
"aspenmesh" has been added to your repositories
```

### Step 2

Update your Helm client

```bash
helm repo update
```
```bash
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "aspenmesh" chart repository
```

### Step 3

Search for the Aspen Mesh chart

```bash
helm search repo aspenmesh
```
```bash
NAME                    	      CHART VERSION	APP VERSION	DESCRIPTION         
aspenmesh/aspenmesh-demo	      0.1.0        	0.1.0      	Aspen Mesh Demo Site
aspenmesh/aspenmesh-collector   0.1.7        	0.1.0       Aspen OpenTelemetry Collector

```

### Next

See the README for each application for configuration and next steps
 * [Aspen OpenTelemetry Collector](./docs/aspenmesh-collector.MD)
 * [Aspen Mesh Demo Site](./docs/aspenmesh-demo.MD)





