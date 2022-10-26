{{/*
Expand the name of the chart.
*/}}
{{- define "aspenmeshCollector.name" -}}aspenmesh-collector{{- end}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "aspenmeshCollector.fullname" -}}aspenmesh-collector{{- end}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "am.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "aspenmeshCollector.labels" -}}
helm.sh/chart: {{ include "am.chart" . }}
{{ include "aspenmeshCollector.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "aspenmeshCollector.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aspenmeshCollector.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "aspenmeshAgent.name" -}}aspenmesh-agent{{- end}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "aspenmeshAgent.fullname" -}}aspenmesh-agent{{- end}}

{{/*
Common labels
*/}}
{{- define "aspenmeshAgent.labels" -}}
helm.sh/chart: {{ include "am.chart" . }}
{{ include "aspenmeshAgent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "aspenmeshAgent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aspenmeshAgent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

