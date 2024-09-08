# Etapa de build
FROM golang:1.17-alpine AS builder

WORKDIR /app

COPY go.mod .  
RUN go mod tidy  

COPY . .       
RUN go build -o app .

# Imagem mínima
FROM scratch
COPY --from=builder /app/app /app/app
ENTRYPOINT ["/app/app"]