const { Client } = require('pg')
const client = new Client({
  user: 'postgres',
  host: 'localhost',
  database: 'postgres',
  password: 'admin',
  port: 5432,
})

execute()

async function execute(){
  try{
await client.connect()
await client.query('BEGIN')
console.log('Connected successfully')


await client.query("INSERT INTO Content_info(description) VALUES ('poker night'), ('snowfall'),('car club meeting')")
const {rows} = await client.query('select * from content_info')
console.table(rows)
await client.query('COMMIT')
  }
  catch(ex){
  console.log(`Something wrong happened ${ex}`)
  await client.query("ROLLBACK")
}
finally{
await client.end()
console.log('Client disconnected successfully')
}
}