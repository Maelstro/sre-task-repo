# SRE Fundamentals with Google - project 1

The whole application is set up wih Makefile. It starts the Prometheus deployment, Grafana used to visualize the metrics collected by the Prometheus, and Upcommerce application itself.

## Requirements

Three environment variables must be set up before starting the Codespaces:
* `ALERT_EMAIL_ADDRESS` - Gmail address used to send notifications,
* `ALERT_EMAIL_PASSWORD` - app password to the Gmail account,
* `SLACK_API_URL` - Slack's incoming webhook.

The variables should be set up through GitHub Secrets.

## Instructions

Start the cluster with:

```bash
make start-cluster
```

Configure the Helm repositories:
```bash
make add-repos
```

Install Prometheus deployment:
```bash
make install-prometheus
```

Install Grafana:
```bash
make install-grafana
```

Start the Upcommerce application:
```bash
make start-upcommerce
```

Expose the Upcommerce application so that you can access it through the browser:
```bash
make expose-upcommerce
```

Halt the whole cluster:
```bash
make stop-all
```