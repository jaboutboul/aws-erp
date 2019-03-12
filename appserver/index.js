const express = require('express')
const app = express()
const getIP = require('external-ip')();
app.get('/', (req, res) => {
    getIP((err, ip) => {
        if (err) {
            // every service in the list has failed
            throw err;
        }
        res.send('Hello from: ' + ip)
    });
})

app.listen(3000, () => console.log('Server running on port 3000'))
