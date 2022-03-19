FROM golang:1.16-alpine as builder

WORKDIR /app
COPY *.go ./

RUN go build -o main ./main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app/main .

CMD [ "./main" ]