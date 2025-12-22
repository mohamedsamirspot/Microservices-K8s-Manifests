{{- define "microservices.labels" -}}
app: microservices-app
env: {{ .Values.app.env }}
{{- end -}}
