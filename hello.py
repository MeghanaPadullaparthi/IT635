import psycopg2
hostname= 'localhost'
database='mydatabase'
username='myuser'
pwd='mypassword'
port_id=5432
conn=psycopg2.connect(
    host=hostname,
    dbname=database,
    user=username,
    password=pwd,
    port=port_id
)
cur = conn.cursor()
department_id=1
cur.execute('SELECT * FROM Courses WHERE department_id = %s', (department_id,))
rows = cur.fetchall()
print(rows)
cur.close()
#GRANT ALL PRIVILEGES ON table1, table2, table3 TO username;
conn.close
