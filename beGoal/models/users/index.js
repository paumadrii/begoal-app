const { selectAllUsers, selectId, addOneUser} = require('./queries')


const selectAll = (db) => async () => {
    try {
        const response = await db.query(selectAllUsers())

        return {
            ok: true,
            response: response.rows,
        }
    } catch (error) {
        return {
            ok: false,
            message: error.message,
        }
        
    }

}
 
const selectIdUser = (db) => async (id) => {
    try {
        
        const response = await db.query(selectId(id))

        console.log(response)
        

        return {
            ok: true,
            response: response.rows,
        }
        
        
    } catch (error) {
        return {
            ok: false,
            message: error.message,
        }
        
    }
    
}

const addUsers = (db) => async (user) => {
    try {
        
        const response = await db.query(addOneUser(user))

        console.log(response)
        

        return {
            ok: true,
            response: response.rows,
        }
        
        
    } catch (error) {
        return {
            ok: false,
            message: error.message,
        }
        
    }
    
}


module.exports = {
    selectAll,
    selectIdUser,
    addUsers,
}