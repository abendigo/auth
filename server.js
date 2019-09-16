const express = require('express');
const morgan = require('morgan');
const path = require('path');

const app = express();
const port = 3000;

app.use(morgan('combined'));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (request, response) => response.send('Hello World!'));
app.get('/auth', (request, response) => response.sendStatus(204));

app.listen(port, () => console.log('Listening'));
