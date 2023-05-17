const router = require('express').Router()

const authControllers = require('../controllers/auth')

const { authorizer } = require('../middlewares')

module.exports = (db) => {
    router.post('/register', authControllers.register(db))
    router.post('/logIn', authControllers.logIn(db))
    router.post('/logOut',authorizer, authControllers.logOut())
    return router
}