# Aspen Mesh Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Release Charts](https://github.com/aspenmesh/aspenmesh-charts/workflows/Release%20Charts/badge.svg?branch=main)

These are the official Helm charts for [Aspen Mesh](https://aspenmesh.io/). [Helm](https://helm.sh/) is a package manager for Kubernetes.

**Available Packages**:
- [Aspen OpenTelemetry Collector](./charts/aspen-collector)
- [Aspen Mesh Microservices Demo](./charts/aspenmesh-demo)

## Prerequisites

The following are required before installing any Aspen Mesh chart:

 * Access to an existing [Kubernetes](https://kubernetes.io/docs/home/#set-up-a-k8s-cluster) cluster
 * [Istio 1.13 or higher](https://istio.io/latest/docs/setup/install/) installed in the cluster.
 * [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) installed on the machine that you'll be installing the demo site from.
 * [Helm v3](https://helm.sh/docs/intro/install/) client installed on the machine that you'll be installing the demo site from.

## Adding the Aspen Mesh Helm Repository

```bash
helm repo add aspenmesh https://aspenmesh.github.io/aspenmesh-charts/
helm repo update
```

## Next Steps

See the README for each chart for configuration and next steps
 * [Aspen OpenTelemetry Collector](./docs/aspenmesh-collector.md)
 * [Aspen Mesh Microservices Demo](./docs/aspenmesh-demo.md)


## License

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
[Apache 2.0 License](https://github.com/aspenmesh/aspenmesh-charts/blob/main/LICENSE).

## Helm Charts Build Status

![Release Charts](https://github.com/aspenmesh/aspenmesh-charts/workflows/Release%20Charts/badge.svg?branch=main)


