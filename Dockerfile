FROM elixir:1.14-alpine

# Instalar Hex y Rebar (para deps de Elixir)
RUN mix local.hex --force && \
    mix local.rebar --force

# Instalar Node.js, npm y herramientas necesarias
RUN apk add --no-cache nodejs npm git build-base

# Crear carpeta de trabajo
WORKDIR /app

# Copiar el proyecto
COPY . .

# Instalar dependencias Elixir
RUN mix deps.get

# Compilar el proyecto
RUN HEX_HTTP_CONCURRENCY=1 HEX_HTTP_TIMEOUT=120 mix deps.get


# Si tienes carpeta assets, instalar dependencias JS (opcional pero recomendable)
WORKDIR /app/assets
RUN npm install
WORKDIR /app

# Exponer el puerto de Phoenix
EXPOSE 4000

# Comando por default
CMD ["mix", "phx.server"]
