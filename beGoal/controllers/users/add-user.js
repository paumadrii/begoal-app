const queries = require('../../models/users')

module.exports = (db) => async (req, res, next) => {

    const user = req.body
   

    const dbRes= await queries.addUsers(await db)(user)
    console.log(dbRes)

    if(!dbRes.ok) return next({
        statusCode: 500,
        error: new Error('something went wrong!'),
    })
    res.status(200).json({
        
        success: true,
        data: dbRes.response,

    })

}