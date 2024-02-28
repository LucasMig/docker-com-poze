#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="docker-com-poze"
SCRIPT_PATH="$(pwd)/$SCRIPT_NAME"
AUDIO_FILE="$(pwd)/poze.mp3"

exit_with_error() {
    echo -e "${RED}Erro:${NC} $1"
    exit 1
}

if [ ! -w "$INSTALL_DIR" ]; then
    exit_with_error "Sem permissão para escrever em $INSTALL_DIR. Execute este arquivo novamente com sudo."
fi

sudo cp "$SCRIPT_PATH" "$INSTALL_DIR"
sudo cp "$AUDIO_FILE" "$INSTALL_DIR"

sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

if ! command -v mpg123 &> /dev/null; then
    echo -e "${YELLOW}Instalando mpg123...${NC}"

    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y mpg123
    elif command -v brew &> /dev/null; then
        brew install mpg123
    else
        exit_with_error "Não foi possível instalar mpg123 automaticamente. Por favor, instale manualmente."
    fi
fi

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "${YELLOW}Adicionando $INSTALL_DIR ao \$PATH${NC}"    echo "export PATH=\$PATH:$INSTALL_DIR" >> ~/.bashrc
    source ~/.bashrc
fi

echo -e "${GREEN}Instalação concluída.${NC} Agora você pode usar '${YELLOW}docker-com-poze${NC}' em qualquer lugar."
exit 0

# Fim do script