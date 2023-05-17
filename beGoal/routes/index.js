const router = require('express').Router()

const authRouter = require('./auth')

const users= require('./users')

module.exports = (db) => {
    router.use('/auth', authRouter(db))
    router.use('/users', users(db))

    return router

}