const http= require('http');
const express = require('express');

const app = express();

app.use((req, res, next) =>{
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH, DELETE');
});

app.use(express.json());

app.use('/', (req, res, next)=>{
    res.send('<h1>Server is running. Add path to data</h1>');
});

app.listen(process.env.PORT);