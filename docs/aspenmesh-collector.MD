# Aspen OpenTelemetry Collector

The Aspen OpenTelemetry Collector collects telemetry data from Kubernetes and your Service Mesh and sends it to the [Aspen Mesh Application Intelligence Platform](https://aspenmesh.io/).

## Installation

### Step 1
Add this repository to your Helm client
   
```bash
$ helm repo add aspenmesh https://aspenmesh.github.io/aspenmesh-charts/
```
```bash
"aspenmesh" has been added to your repositories
```

### Step 2
Update your Helm client

```bash
$ helm repo update
```
```bash
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "aspenmesh" chart repository
```

### Step 3
Note your API key in the [Aspen Mesh dashboard](https://console.cloud.aspenmesh.io/client). 

[Register for a new account](https://console.cloud.aspenmesh.io/v1/oauth2/register) if you haven't signed up for Aspen Mesh.

### Step 4

Install the Aspen OpenTelemetry Collector in an existing Kubernetes cluster. You'll need your API key from **Step 3**. 

With you API key, execute the following command:

```bash
$ helm upgrade --install aspenmesh-collector aspenmesh/aspenmesh-collector -n aspenmesh --create-namespace --set apiKey=<replace-with-your-api-key>
NAME: aspenmesh-collector
LAST DEPLOYED: Wed Nov 2 15:48:57 2022
NAMESPACE: aspenmesh
STATUS: deployed
REVISION: 1
```

### Step 5

You're all set! Log into your [Aspen Mesh account](https://console.cloud.aspenmesh.io/client) and ensure you can see data in the dashboard. 

_Note:_ it can take up to 5 minutes before data is available after you first install the Aspen OpenTelemetry Collector. 