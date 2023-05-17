const slonik = require('slonik')

const SLONIK_URL = "slonik://user1:1234@localhost:5432/prueba"

module.exports=slonik.createPool(SLONIK_URL)