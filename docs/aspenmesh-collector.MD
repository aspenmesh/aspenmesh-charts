# Aspen Mesh Collector

The Aspen Mesh Collector collects telemetry data from Kubernetes and Istio and sends it to the Aspen Mesh Management Site.

## Installation

### Step 1
Make sure you've set up the Aspen Mesh Helm repository in this repository's [README](../README.MD).

### Step 2
Create a namespace for the collector.

```bash
kubectl create namespace aspenmesh
```

### Step 3

Create a Helm values override file. At a minimum, you need to set values for `apiKey`, `cluster`, and `replica`. Here is what an example file would look like:

```yaml

apiKey: 123456789abcdef
cluster: my-cluster
replica: my-replica
    
```

### Step 4

Install the Aspen Mesh Collector in an existing cluster. 

```bash
helm install aspenmesh-collector aspenmesh/aspenmesh-collector -n aspenmesh
NAME: aspenmesh-collector
LAST DEPLOYED: Fri Jun 17 15:48:57 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
```
