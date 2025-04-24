FROM elixir:1.14-alpine

# Instala Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Instala Node.js (si usas assets en Phoenix)
RUN apk add --no-cache nodejs npm git build-base

# Crea y copia el proyecto
WORKDIR /app
COPY . .

# Instala dependencias
RUN mix deps.get

# Compila el proyecto
RUN mix compile

# Expone el puerto por defecto de Phoenix
EXPOSE 4000

# Comando para iniciar la app (ajusta si es diferente)
CMD ["mix", "phx.server"]
