const { sql } = require('slonik')

const insertRegister = (email, password) => sql.unsafe`
 INSERT INTO users (
    email, password
 ) VALUES (
    ${email}, ${password}
 );
`
const selectByEmail = (email) => sql.unsafe`
    SELECT email, password
    FROM users
    WHERE email LIKE ${email}
`

module.exports = {
    insertRegister,
    selectByEmail,
}