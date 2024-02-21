<h1 align="center">
  <div style="padding: 10px;">
    <img src="busca_cep\assets\github\app_logo_github.png" alt="Busca Cep logo" style="width: 50%;">
  </div>
</h1>

## :memo: Descrição do Projeto
<p>O Busca Cep é uma aplicação de voltada para a busca de informações de locais através do CEP e a busca de CEPs pelo endereço fornecido.</p>
<p>O projeto visa a facilitar o acesso de informações dos locais disponíveis na api do viacep, seja procurando um cep com base nas informações do local, seja buscando dados de uma localização utilizando um cep válido.</p>
<p>A aplicação foi desenvolvimenta com intuito de praticar alguns conceitos, como o mobx para gerenciamento de estados do aplicativo e a realização de testes unitários, visando obter conhecimentos mais sólidos através desta prática.</p>
<p>O aplicação também conta a api do viacep, para buscar os dados sobre os locais, bem como Provider para injetar as depedências de acesso ao client http dio e a controller do aplicativo.</p>

## :books: Funcionalidades
* Busca dos dados de um local com base no CEP
* Listagem de locais em busca de informações como o CEP, através da Unidade da Federação, Cidade e Rua

## :camera: Capturas de Tela

Aqui estão algumas capturas de tela do aplicativo em ação:

<div style="padding: 10px; display: flex; gap: 50px; flex-wrap: wrap;">
    <img src="busca_cep\assets\github\screen_01.png" alt="Tela inicial" style="width: 202.5px; height: 450px; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);">
    <img src="busca_cep\assets\github\screen_02.png" alt="Tela de busca por cep" style="width: 202.5px; height: 450px; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);">
    <img src="busca_cep\assets\github\screen_03.png" alt="Tela de resultado da busca por cep" style="width: 202.5px; height: 450px; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);">
    <img src="busca_cep\assets\github\screen_04.png" alt="Tela de busca por endereço" style="width: 202.5px; height: 450px; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);">
    <img src="busca_cep\assets\github\screen_05.png" alt="Tela de listagem da busca por endereço" style="width: 202.5px; height: 450px; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);">
    <img src="busca_cep\assets\github\screen_06.png" alt="Tela de informações sobre um endereço" style="width: 202.5px; height: 450px; box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.15);">
</div>
  
## :wrench: Tecnologias Utilizadas
* Linguagem Dart
* Flutter
* Viacep Api

## :computer: Bibliotecas e Ferramentas
* Validatorless para realizar as validações de formulário
* Flutter Splash Native para a splash nativa personalizada na abertura do app
* Provider para disponibilizar o acesso ao client http dio aos repositories
* Mobx e Flutter Mobx para o gerencimento de estado
* Loading Animation Widget para carregamento do loader quando feitas as requisições

## :information_source: Como Rodar
* Flutter já configurado em qualquer versão entre 3.2.3 e 4.0.0
* Tenha o Git, GitHub Cli e NodeJS instalados.
```bash

# Clone este repositório
$ gh repo clone yurilima7/Busca-Cep

# Acesse a pasta do projeto no terminal/cmd
$ cd Busca-Cep/busca_cep

# Crie uma nova branch
$ git checkout -b minha-nova-branch

# Instale as dependências
$ flutter pub get
```
* Caso queira contribuir, faça suas alterações.
* Envie suas alterações para a branch principal.
* Então abra uma pull
  
## :file_folder: Estrutura do Projeto
O projeto está organizado da seguinte forma:
* **busca_cep:** contém o projeto como um todo.
* **assets:** Contém uma pasta fonts com as fontes utilizadas e images com as imagens necessárias para o app, bem como pastas para exibir a logo na tela inicial com base na tela do dispositivo.
* **test:** Estão os arquivos utilizados para testar as camadas de repository e as controllers do aplicativo.
* **lib:** Contém os códigos do projeto englobadas na app.
* **core:** Contém os widgtes essenciais para a aplicação, que se encontra na pasta **ui**, onde na **helper** temos o loader de carregamento e as messagens de feedback. Ainda na ui se encontram os **styles** de cores e texto, bem como o **theme** global do app. Por fim, temos a **exception** global do app, o **provider** para injetar as depedências e o **rest client** de acesso ao dio.
* **model:** Contém o modelo de dados que vem após consulta na api do viacep.
* **repositories:** Camada responsável por realizar a comunicação com a api.
* **screens:** É onde estão as telas do aplicativo, bem como suas controllers e seus arquivos de rotas para facilitar o acesso.

## :memo: Licença
Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes

## :dart: Status do Projeto
Fase de testes.
