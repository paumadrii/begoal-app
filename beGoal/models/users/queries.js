const { sql } = require('slonik')
const selectAllUsers = () => sql.unsafe`
    SELECT * FROM users;
`

const selectId = (id) => sql.unsafe`
    SELECT name, email, password 
    FROM users
    WHERE id = ${id}
`

const addOneUser = (user) => sql.unsafe`
INSERT INTO users (
    name, last_name, age, city, phone_number, email, password, marital_status, occupation, clinic_history, monitoring
) VALUES (
    ${user.name}, ${user.last_name}, ${user.age}, ${user.city}, ${user.phone_number}, ${user.email}, ${user.password}, ${user.marital_status}, ${user.occupation}, ${user.clinic_history}, ${user.monitoring}
); 
`
   /* const keys= Object.keys(user)
    const values= Object.keys(user).map((key)=>{
        if(key==='age'){
            return parseInt(user[key])
        }

        return `'${user[key]}'`
    })
   

    return sql.unsafe `
    INSERT INTO users (
        ${sql.join(keys,sql`, `)}
    ) VALUES (
        ${sql.join(values, sql`, `)}
    )
`*/





module.exports = {
    selectAllUsers,
    selectId,
    addOneUser,
}