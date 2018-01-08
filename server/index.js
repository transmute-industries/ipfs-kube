const app = require('express')();

const port = process.env.PORT || 8000;

app.get('/', (req, res) => {
  res.status(200).json('Hello!');
});

app.get('/add', (req, res) => {
  res.status(200).json('Adding file..');
});

app.listen(port, () => console.log('Listening on port', port));

module.exports.app = app;