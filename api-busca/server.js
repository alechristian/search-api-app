const express = require('express');
const bodyParser = require('body-parser');
const puppeteer = require('puppeteer');

const server  = express();
server.use(bodyParser.json());


server.post('/buscar', async (req, res) => {

    const busca = req?.body?.busca;
    if (!busca) {
        res.status(400).send({ error: 'Precisamos de um parametro de busca!' });
        return;
      }

  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto(`https://www.google.com/search?q=${busca}`);

  const results = await page.evaluate(() => {
    const searchResults = Array.from(document.querySelectorAll('#search .g'));
    return searchResults.map((result) => ({
      title: result.querySelector('h3').textContent,
      link: result.querySelector('a').href,
    }));
  });

  await browser.close();

  res.status(200).json({
    "message": "OK",
    "data": results
  })
});


let porta = 8000;
server.listen(porta, () => {
    console.log('Servidor em execução na porta: ' + porta);
}); 
