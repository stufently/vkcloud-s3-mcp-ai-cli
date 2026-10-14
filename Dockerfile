FROM golang:1.27.2 AS build
ARG VERSION=0.1.0
ARG COMMIT=dev
ARG BUILD_UID=65532
ARG BUILD_GID=65532
ENV HOME=/tmp GOCACHE=/tmp/go-cache GOMODCACHE=/tmp/go-mod-cache
WORKDIR /src
COPY --chown=${BUILD_UID}:${BUILD_GID} go.mod go.sum ./
USER ${BUILD_UID}:${BUILD_GID}
RUN go mod download
COPY --chown=${BUILD_UID}:${BUILD_GID} . .
RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w -X main.version=$VERSION -X main.commit=$COMMIT" -o /tmp/vkcloud-s3 ./cmd/vkcloud-s3
FROM scratch
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /tmp/vkcloud-s3 /vkcloud-s3
# Introspection placeholder only. Real keys are passed with -e and override it.
ENV VKCLOUD_S3_ACCESS_KEY_ID=introspection-placeholder-not-a-key
ENV VKCLOUD_S3_SECRET_ACCESS_KEY=introspection-placeholder-not-a-key
LABEL io.modelcontextprotocol.server.name="io.github.stufently/vkcloud-s3-mcp-ai-cli"
LABEL org.opencontainers.image.source="https://github.com/stufently/vkcloud-s3-mcp-ai-cli"
USER 65532:65532
ENTRYPOINT ["/vkcloud-s3"]
CMD ["mcp"]
