const queries = require('../../models/users')

module.exports = (db) => async (req, res, next) => {


    const {id} = req.params

    const dbRes= await queries.selectIdUser(await db)(id)

    if(!dbRes.ok) return next({
        statusCode: 500,
        error: new Error('something went wrong!'),
    })
    res.status(200).json({
        
        success: true,
        data: dbRes.response,

    })

}