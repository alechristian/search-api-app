<div align="center">
<h1 >Search API APP </h1>

<p>Projeto para uma busca no Google com uma API node e um cliente Flutter.</p>

## 📖 O desafio:

1. Desenvolver, em qualquer linguagem, uma API que faz uma pesquisa no google e devolve o resultado em json e/ou XML.
Não utilizar as API do Google, como Search API.
Deve se extrair do resultado do google:
    Titulo
    Link
2. Um cliente para consumir a API em qualquer linguagem/Plataforma:
Ex:
    Apenas um campo para entrada de dados do valor a ser pesquisado;
    Um botão para disparar a pesquisa;
    Um container para exibir o resultado.
Não pode ser utilizado IFrames, ou similares.

O Titulo deve ser exibido, sem link.
O Link logo abaixo do Titulo, clicavel e abrir em uma nova janela.

Não deve ser exibido mais nada da página do google. Todas as outras informações, cabeçalhos, rodapés, etc devem ser descartados.


## 📟 Pages

- [x] Home Page

## 🧩 Features Node (Backend)

- [x] Recebe um parametro de busca
- [x] Faz uma busca no Google com base no parametro
- [x] Retorna uma lista da busca 

## 🧩 Features Flutter (Frontend/Mobile)

- [x] InputText que recebe um valor
- [x] TextButton que dispara a busca (inicialmente está desabilitado e habilita com base nos parametros solicitados)
- [x] Uma lista que apresenta o retorno da busca

## 🛠 Ferramentas Packages Bibliotecas - Backend:

- <a>Node.js</a>
- <a>Express</a>
- <a>puppeteer</a>
- <a>bodyParser</a>
- <a>Postman</a>

<p align="center">
  <img src="images\back1.png" width="736 " height="414" title="Postman1">
  <img src="images\back2.png" width="736 " height="414" title="Postman2">
</p>


## 🛠 Ferramentas Packages Bibliotecas - Frontend/Mobile:

- <a>Flutter</a>
- <a>Flutter Modular</a>
- <a>Dio</a>
- <a>url_launch</a>

<p align="center">
  <img src="images\front1.png" width="414" height="736" title="Postman1">
  <img src="images\front2.png" width="414" height="736" title="Postman2">
</p>

