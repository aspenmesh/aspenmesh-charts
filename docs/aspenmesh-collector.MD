# Aspen OpenTelemetry Collector

The Aspen OpenTelemetry Collector collects telemetry data from Kubernetes and your Service Mesh and sends it to the [Aspen Mesh Application Intelligence Platform](https://aspenmesh.io/). Our platform is built for modern App and SRE teams to see and understand how their systems are behaving.

## Installation

### One-line script installation

The Aspen OpenTelemetry Collector can be installed by a one-line script.
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/aspenmesh/aspenmesh-charts/main/scripts/aspenmesh-collector-setup.sh)" -- --endpoint <remote-write-endpoint> --apiKey <user-group-api-key>
```
You can also follow the details for each installation step.

### Add the Aspen Mesh Helm Repository

```bash
helm repo add aspenmesh https://aspenmesh.github.io/aspenmesh-charts/
helm repo update
```

### Obtain your Aspen Mesh API Key

Note your API key in the [Aspen Mesh dashboard](https://console.cloud.aspenmesh.io/client).

[Register for a new account](https://console.cloud.aspenmesh.io/v1/oauth2/register) if you haven't signed up for Aspen Mesh.

### Install the Aspen OpenTelemetry Collector

With you API key, execute the following command:

```bash
helm upgrade --install aspenmesh-collector aspenmesh/aspenmesh-collector -n aspenmesh --create-namespace --set apiKey=<replace-with-your-api-key>
```

Upon successful deployment, you will see a similar message:

```console
NAME: aspenmesh-collector
LAST DEPLOYED: Wed Nov 2 15:48:57 2022
NAMESPACE: aspenmesh
STATUS: deployed
REVISION: 1
```

### Verify your Aspen OpenTelemetry Collector Helm Deployment

You can verify your deployment by reviewing the logs from the Aspen OpenTelemetry Collector: 

```bash
AOC_POD="$(kubectl get pod -o name -n aspenmesh -l app.kubernetes.io/name=aspenmesh-collector)"
kubectl logs -n aspenmesh ${AOC_POD}
```

A successful deployment will look similar to the following:

```bash
2022-12-02T06:50:03.037Z    info    service/telemetry.go:103    Setting up own telemetry...
2022-12-02T06:50:03.037Z    info    service/telemetry.go:138    Serving Prometheus metrics    {"address": ":8888", "level": "basic"}
...
...
2022-12-02T06:50:03.081Z    info    service/collector.go:128    Everything is ready. Begin running and processing data.
2022-12-02T06:50:08.287Z    info    MetricsExporter    {"kind": "exporter", "data_type": "metrics", "name": "logging", "#metrics": 214}
```

Watch for several `info` log messages from the `MetricsExporter` to ensure data is being sent to to the [Aspen Mesh Application Intelligence Platform](https://aspenmesh.io/). If you are see any errors, start by reviewing our [troubleshooting](troubleshooting.md) guide.

### Next Steps

You're all set! Log into your [Aspen Mesh account](https://console.cloud.aspenmesh.io/client) and ensure you can see data in the dashboard.

_Note:_ it can take up to 5 minutes before data is available after you first install the Aspen OpenTelemetry Collector.
