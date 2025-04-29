FROM elixir:1.14-alpine

RUN mix local.hex --force && \
    mix local.rebar --force

RUN apk add --no-cache nodejs npm git build-base

WORKDIR /app

COPY . .

RUN HEX_HTTP_CONCURRENCY=1 HEX_HTTP_TIMEOUT=120 mix deps.get

RUN mix compile

EXPOSE 4000

CMD ["mix", "phx.server"]

