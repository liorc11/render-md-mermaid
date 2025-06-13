# FROM debian:9.5-slim
FROM minlag/mermaid-cli:11.4.2

# Add bash & perl
USER root
RUN apk add bash perl
USER mermaidcli

COPY entrypoint.sh /entrypoint.sh
COPY render-md-mermaid.sh /render-md-mermaid.sh
#COPY 12.02_webui_technology_stack.md /12.02_webui_technology_stack.md

ENTRYPOINT ["/entrypoint.sh"]
