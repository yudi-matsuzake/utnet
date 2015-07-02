# UTNET

Script simples para conectar automaticamente na rede da UTFPR

## Dependência

Você deve ter instalado o pacote *curl*.

### Instalação via apt-get do curl

```shell
$ sudo apt-get install curl
```

### Instalação via yum
   
```shell
$ sudo yum install curl 
```

Intuitivo, não? c:

Ou você pode ir diretamente ao site do curl clicando [aqui](http://curl.haxx.se) e para mais informações sobre instalação clique [aqui](http://curl.haxx.se/docs/install.html).

## Instalação

1. Configuração

	A configuração pede basicamente a matrícula e a senha para ser possível fazer os próximos logins. Se voce for aluno, deve colocar o "a" e entao a matricula, ex: "a#####". Execute o seguinte comando como root:
```shell
$ sudo ./configure.sh
login: xxxxxx
senha: xxxxxx
```

2. Instalação

	Execute o seguinte comando:

```shell
$ sudo ./install.sh
```

3. Desinstalação

	Execute o seguinte comando:

```shell
$ sudo ./uninstall

```

	OBS.: na hora de desinstalar, se você tiver uma versão mais antiga do utnet você pode se deparar com umas mensagens de arquivos não encontrados. Não ligue pra elas.

## Sem ser automático

Você pode também, executar o comando manualmente, através digitando o seguinte no terminal:

```shell
$ sudo utnet
```

## Funcionamento

* O script basicamente é basicamente um comando curl onde é fornecido o usuário e a senha para o access point. No arquivo utfpr.web contém toda a suposta "mágica" o comando curl com o método enviado pelo Firefox.;

* Ele é disparado sempre que a rede muda de estado, e envia o método http apenas se estiver conectado com o SSID UTFPRWEB"

	- É feito isso copiando o script para a pasta /etc/NetworkManager/dispatcher.d

* Ele armazena a matricula e a senha em um arquivo na pasta /root/, assim, apenas o root do computador poderá ter acesso ao arquivo
