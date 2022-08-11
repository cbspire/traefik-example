const express = require('express')
const app = express()
const port = 80

const appName = process.env.APP_NAME;

app.get('/', (req, res) => {
  res.send(`Hello ${appName}\n\n`)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})