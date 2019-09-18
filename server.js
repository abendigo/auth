const bodyParser = require('body-parser');
const cookies = require('cookie-parser');
const express = require('express');
const morgan = require('morgan');
const path = require('path');

const app = express();
const port = 3000;

app.use(morgan('combined'));

app.use(bodyParser.urlencoded({extended: false}));
app.use(cookies());

app.post('/login', (request, response) => {
  console.log({ body: request.body });
  response.cookie('mycookie', 'value', { domain: 'localtest.me', path: '/', expires: new Date(Date.now() + 900000) });
  response.sendStatus(200);
});
app.get('/auth', (request, response) => {
  console.log('cookies', request.cookies);
  console.log('headers', request.headers);

  const { mycookie } = request.cookies;
  if (mycookie) {
    return response.sendStatus(204);
  }
  return response.redirect('http://auth.localtest.me/login/');
});

app.use(express.static(path.join(__dirname, 'public')));

app.listen(port, () => console.log('Listening'));
