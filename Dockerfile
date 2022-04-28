# syntax=docker/dockerfile:1

FROM node:16 as web-builder

WORKDIR /app
COPY ./web/package.json ./web/package-lock.json /app/
RUN npm install
COPY ./web /app
RUN npm run build


# Alpine is chosen for its small footprint
# compared to Ubuntu
FROM golang:1.17-alpine

# Set working directory
WORKDIR /app

COPY --from=web-builder /app/dist /app/web/dist

# Download necessary Go modules
COPY go.mod ./
COPY go.sum ./

RUN --mount=type=cache,target=/go/pkg/mod \
go mod download

# Copy all sources
COPY ./ ./

RUN go build -o main

EXPOSE 8081

ENTRYPOINT [ "/app/main", "-host", "0.0.0.0" ]