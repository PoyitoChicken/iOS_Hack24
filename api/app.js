const express = require('express')
const listEndpoints = require('express-list-endpoints');
const bodyParser = require('body-parser')
const cors = require('cors')
const fs = require('fs')
const path = require('path')
const morgan = require('morgan')
const router = require('./routes.js')
const app = express()

app.use(cors())

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

app.use(morgan('dev'))
 
var accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), { flags: 'a' })


// setup the logger
app.use(morgan('combined', { stream: accessLogStream }))
app.use(router)

// Get all used routes
const usedRoutes = listEndpoints(app)
  .map(route => route.path); // Extract paths from endpoints

console.log('Used routes:', usedRoutes);


app.get('/', (req, res) => {
  res.send('Hello World!')
})

//port
const port = 3100

// app.listen(process.env.PORT || port , (err) => {
app.listen(port, () => {
  console.log('Server started running on : ' + port)
})
