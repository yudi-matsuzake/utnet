# UTNET

Script simples para conectar automaticamente na rede da UTFPR

## Dependência

Você deve ter instalado o pacote *curl*.

## Instalação

1. Configuração

	A configuração pede basicamente a matrícula e a senha para ser possível fazer os próximos logins. Execute o seguinte comando como root:
```shell
$ sudo ./configure
matricula: xxxxxx
senha: xxxxxx
```

2. Instalação

	Execute o seguinte comando como root:

```shell
$ sudo ./install
```

## Funcionamento

* O script basicamente é basicamente um comando curl onde é fornecido o usuário e a senha para o access point;

* Ele é disparado sempre que a rede muda de estado, e envia o método http apenas se estiver conectado com o SSID UTFPRWEB"

	- É feito isso copiando o script para a pasta /etc/NetworkManager/dispatcher.d

* Ele armazena a matricula e a senha em um arquivo na pasta /root/, assim, apenas o root do computador poderá ter acesso ao arquivo
