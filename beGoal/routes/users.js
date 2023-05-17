const router = require('express').Router()

const { getAll, getById, addUser } = require('../controllers/users')
const { authorizer } = require('../middlewares')

module.exports = (db) => {

    router.get('/', authorizer, getAll(db))
   // router.get('/:id')
    router.get('/:id', getById(db))
    
    router.post('/', addUser(db))
    return router
}