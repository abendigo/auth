const bodyParser = require('body-parser');
const cookies = require('cookie-parser');
const express = require('express');
const morgan = require('morgan');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

const sessions = {};
let session = 0;

app.use(morgan('combined'));

app.use(bodyParser.urlencoded({extended: false}));
app.use(cookies());

app.post('/login', (request, response) => {
  console.log('query', request.query);
  console.log({ body: request.body });
  console.log(sessions[request.query.session]);

  const cookiedomain = sessions[request.query.session].cookiedomain;
  const domain = sessions[request.query.session].headers['x-forwarded-host'];
  console.log({ cookiedomain, domain })

  response.cookie('mycookie', 'value', { domain: cookiedomain, path: '/', expires: new Date(Date.now() + 900000) });
  response.redirect(`http://${domain}`);
});
app.get('/auth', (request, response) => {
  console.log('cookies', request.cookies);
  console.log('headers', request.headers);
  console.log('query', request.query);

  const { mycookie } = request.cookies;
  if (mycookie) {
    return response.sendStatus(204);
  }

  session += 1;
  sessions[session] = {
    cookiedomain: request.query.domain,
    cookies: {...request.cookies},
    headers: {...request.headers}
  }

  return response.redirect(`http://auth.${request.query.domain}/login/?session=${session}`);
});

app.use(express.static(path.join(__dirname, 'public')));

app.listen(port, () => console.log('Listening'));
