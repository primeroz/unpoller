FROM busybox:latest
 
COPY --from=ghcr.io/unpoller/unpoller:v2.7.11 /etc/unpoller /etc/unpoller
COPY --from=ghcr.io/unpoller/unpoller:v2.7.11 /usr/bin/unpoller /usr/bin/unpoller

HEALTHCHECK --interval=1m --timeout=3s --retries=5 --start-period=3m \
  CMD wget -q http://localhost:9130/ || kill 1

ENTRYPOINT [ "/usr/bin/unpoller" ]
