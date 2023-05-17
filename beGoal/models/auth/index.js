
const { insertRegister, selectByEmail } = require('./queries')

const createRegister = (db) => async (email, password) => {
    try {

        await db.query(insertRegister(email, password))
        return {
            ok: true
        }
        
    } catch (error) {
        console.info('> create user error:', error.message)
        return {
            ok: false,
            message: error.message,
        }
        
    }
}

const selectUser = (db) => async (email, compareFn) => {
    try {
       const emailUser= await db.maybeOne(selectByEmail(email))
       console.info('EMAIL-USER: ', emailUser)

       if(!emailUser)
        return {
            ok: false,
            error_code: 'wrong_data',
        }
         const areEqual = await compareFn(emailUser.password)
          console.info('>son iguales?', areEqual)
          if(!areEqual) return {
            ok:false,
            error_code: 'wrong_data',
          }
        return{
            ok: true,
            content: {
                user: emailUser.email,
            }
        }
    } catch (error) {
        console.info('> incorrect user  ', error.message)
        return {
            ok: false,
            message: error.message,
        }
    }
}

module.exports = {

    createRegister,
    selectUser,
}