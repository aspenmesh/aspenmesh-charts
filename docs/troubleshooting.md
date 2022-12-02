# Troubleshooting

The Aspen OpenTelemetry Collector offers multiple ways to measure the health of the collector as well as investigate issues.

Logs can be helpful in identifying issues. Always start by checking the log output and looking for potential issues. 

You can review the logs of the collector with the following commands: 

```bash
AOC_POD="$(kubectl get pod -o name -n aspenmesh -l app.kubernetes.io/name=aspenmesh-collector)"
kubectl logs -n aspenmesh ${AOC_POD}
```

## Common Issues

### Exporting data not working

If you are unable to export to the Aspen App Intelligence Platform then this is likely because either:

- There is a network configuration issue
- The `apiKey` specified during deployment is incorrect
- The destination is unavailable

Check the collector logs for potential issues.

More often than not, exporting data does not work because of a network configuration issue. This could be due to a firewall, DNS, or proxy issue.