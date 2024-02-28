# Docker Com Poze

Este é um script personalizado em bash que executa o docker-compose e reproduz uma música do artista Poze do Rodo após a execução bem-sucedida.

## Requisitos

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

# Dependências

Serão instaladas automaticamente pelo script:

- [mpg123](https://www.mpg123.de/download.shtml)

## Instalação

```bash
git clone
cd docker-com-poze
chmod +x install.sh
./install.sh
```

## Uso

Em qualquer diretório que contenha um arquivo `docker-compose.yml`, execute o comando:

```bash
docker-com-poze up -d
```
