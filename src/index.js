const express = require('express')
const fs = require('fs')
const app = express()
const port = 80

const appName = process.env.APP_NAME;

app.get('/', (req, res) => {
  const content = fs.readFileSync('content.txt', 'UTF-8')

  res.send(`Hello from ${appName}\n${content}\n`)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})