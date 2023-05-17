const { hash } = require('simple-stateless-auth-library')
const { createRegister } = require('../../models/auth')
const errors = require('../../misc/errors')

module.exports = (db) => async (req, res, next) => {

    const { email,  password } = req.body
    console.log('>', email, password)

    if(!email || !password) return next(errors[400])

    const encrypted = await hash.encrypt(password)

    const response = await createRegister( await db)(email, encrypted)

    if(!response.ok) return next(errors[500])

    res.status(200).json({
        success: true,
    })
}