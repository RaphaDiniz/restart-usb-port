#!/bin/bash

# Verifique se foi fornecido um argumento
if [ -z "$1" ]; then
    echo "Por favor, forneça o número da porta USB. Exemplo: $0 0"
    exit 1
fi

# Número da porta USB
USB_PORT="/dev/ttyUSB$1"

# Verifique se a porta USB existe
if [ ! -e "$USB_PORT" ]; then
    echo "A porta USB $USB_PORT não existe."
    exit 1
fi

echo "Reiniciando a porta USB $USB_PORT..."

# Desativa a porta USB
sudo sh -c "echo 0 > $USB_PORT"

# Aguarde um momento (pode ser necessário ajustar o tempo de espera)
sleep 2

# Ativa a porta USB
sudo sh -c "echo 1 > $USB_PORT"

echo "Porta USB $USB_PORT reiniciada com sucesso."
