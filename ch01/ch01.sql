-- 1장. 오라클

-- system 접속
SELECT * FROM v$version;

CREATE TABLESPACE myts DATAFILE
  '/opt/oracle/oradata/XE/XEPDB1/myts.dbf' SIZE 100M AUTOEXTEND ON NEXT 5M;

CREATE USER ora_user IDENTIFIED BY hong
  DEFAULT TABLESPACE myts
  TEMPORARY TABLESPACE temp;

GRANT DBA TO ora_user;

GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE, CREATE SYNONYM,
      CREATE PROCEDURE, CREATE TYPE, CREATE JOB TO ora_user;

SELECT username, default_tablespace, account_status
  FROM dba_users
 WHERE username = 'ORA_USER';

SELECT grantee, granted_role
  FROM dba_role_privs
 WHERE grantee = 'ORA_USER';

-- ora_user 접속 (expall.dmp, expcust.dmp import 후)
SELECT table_name
  FROM user_tables;
