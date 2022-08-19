FROM jenningsloy318/prom-builder as builder

WORKDIR /app

# Download necessary Go modules
COPY go.mod go.sum ./
RUN go mod download

# Build go binary from sources
COPY . ./
RUN make build


FROM scratch

COPY --from=builder /app/build/panos_exporter /
# Añadir un archivo de configuracion
COPY panos_exporter.yaml ./

EXPOSE 9654
#ENTRYPOINT ["/panos_exporter --config.file=panos_exporter.yaml"]
#ENTRYPOINT ["/panos_exporter"]
ENTRYPOINT ["/bin/echo"]
CMD ["Hello"]
