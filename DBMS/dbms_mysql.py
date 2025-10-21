# dbms_mysql.py #@todo snippet 자동 실행되게끔

import pymysql 
# from pymysql.cursors import DictCursor


# MySQL 서버에 연결
# conn_str = ''
# conn = sql.connect()

# cursor = conn.cursor()

# cursor.execute()

# conn.close()


conn= pymysql.connect(
    host= "localhost",
    port=3306, # 포트 번호 변경이 필요한 경우..
    user= 'root',
    passwd='1234',
    database='exampledb',
    charset='utf8mb4',
    cursorclass=pymysql.cursors.DictCursor
) 
cursor = conn.cursor()

def show_current(cursor):
    result = cursor.execute('SELECT DATABASE()')
    print(f'현재 DB: {cursor.fetchone()}')


sql = "SELECT * FROM employees"
cursor.execute(sql)
for rows in cursor.fetchall():
    print(rows)

sql1 = """
INSERT INTO employees(name, DEPTID, ManagerID, EMAIL)
VALUES('kenneth',8,101, 'kenneth@gmail.com')
"""
cursor.execute(sql1)
conn.commit()

print("데이터 삽입 완료")

sql1 = """
INSERT INTO employees(name, DEPTID, ManagerID, EMAIL)
VALUES(%s,%s,%s,%s)
"""
cursor.execute(sql.format('kenneth',8,101,''))
conn.commit()

conn.close()
