# test.py
import oracledb
import cx_Oracle
# oracledb.init_oracle_client()
dsnStr = oracledb.makedsn("prophet.njit.edu", "1521", "course")

# Connect as user "hr" with password "welcome" to the "orclpdb1" service running on this computer.
connection = cx_Oracle.connect(user="SR2484", password="1#PostMalone", dsn=dsnStr)

with connection.cursor() as cursor:
        sql = """select sysdate from dual"""
        for r in cursor.execute(sql):
            print(r)