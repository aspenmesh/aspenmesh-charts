# Aspen Mesh Collector

The Aspen Mesh Collector collects telemetry data from Kubernetes and Istio and sends it to the Aspen Mesh Management Site.

## Installation

### Step 1
Make sure you've set up the Aspen Mesh Helm repository in this repository's [README](../README.MD).

### Step 2

Create a Helm values override file.  Here is what an example file would look like:

```yaml

aspenmeshCollector:
  collectorConfig:
    enablePrometheusRemoteWriteExporter: true
    prometheusRemoteWriteExporter:
      endpoint: https://metrics.cloud.aspenmesh.io/write
      externalLabels:
        cluster: aspenmesh-saas-demo-otel
        __replica__: otel-replica
      timeout: 30s
      headers:
        TENANT: TEST_TENANT
        
```

### Step 3

Install the Aspen Mesh Collector in an existing cluster. 

```bash
helm install aspenmesh-collector aspenmesh/aspenmesh-collector 
NAME: aspenmesh-collector
LAST DEPLOYED: Fri Jun 17 15:48:57 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
```
