CREATE TABLE ORDERS (
    ORDER_ID      NUMBER(12,0),
    ORDER_DATE    DATE,
    ORDER_MODE    VARCHAR2(8 BYTE),
    CUSTOMER_ID   NUMBER(6,0),
    ORDER_STATUS  NUMBER(2,0),
    ORDER_TOTAL   NUMBER(8,2) DEFAULT 0,
    SALES_REP_ID  NUMBER(6,0),
    PROMOTION_ID  NUMBER(6,0),
    CONSTRAINT PK_ORDERS PRIMARY KEY (ORDER_ID),
    CONSTRAINT CK_ORDER_MODE CHECK (ORDER_MODE IN ('direct', 'online'))
);

SELECT CAST(column_name AS VARCHAR2(15)) AS 컬럼,
       CAST(data_type ||
            CASE WHEN data_type = 'NUMBER'   THEN '(' || data_precision || ',' || data_scale || ')'
                 WHEN data_type = 'VARCHAR2' THEN '(' || char_length || DECODE(char_used, 'B', ' BYTE', ' CHAR') || ')'
            END AS VARCHAR2(20)) AS 타입,
       data_default AS 디폴트
  FROM user_tab_columns
 WHERE table_name = 'ORDERS'
 ORDER BY column_id;

SELECT CAST(a.constraint_name AS VARCHAR2(15)) AS 제약명,
       a.constraint_type AS 종류,
       CAST(b.column_name AS VARCHAR2(15)) AS 컬럼,
       CAST(a.search_condition_vc AS VARCHAR2(40)) AS 조건
  FROM user_constraints a, user_cons_columns b
 WHERE a.constraint_name = b.constraint_name
   AND a.table_name = 'ORDERS'
 ORDER BY a.constraint_type DESC, b.position;

CREATE TABLE ORDER_ITEMS (
    ORDER_ID      NUMBER(12,0),
    LINE_ITEM_ID  NUMBER(3,0),
    PRODUCT_ID    NUMBER(3,0),
    UNIT_PRICE    NUMBER(8,2) DEFAULT 0,
    QUANTITY      NUMBER(8,0) DEFAULT 0,
    CONSTRAINT PK_ORDER_ITEMS PRIMARY KEY (ORDER_ID, LINE_ITEM_ID)
);

SELECT CAST(column_name AS VARCHAR2(15)) AS 컬럼,
       CAST(data_type ||
            CASE WHEN data_type = 'NUMBER'   THEN '(' || data_precision || ',' || data_scale || ')'
                 WHEN data_type = 'VARCHAR2' THEN '(' || char_length || DECODE(char_used, 'B', ' BYTE', ' CHAR') || ')'
            END AS VARCHAR2(20)) AS 타입,
       data_default AS 디폴트
  FROM user_tab_columns
 WHERE table_name = 'ORDER_ITEMS'
 ORDER BY column_id;

SELECT CAST(a.constraint_name AS VARCHAR2(15)) AS 제약명,
       a.constraint_type AS 종류,
       CAST(b.column_name AS VARCHAR2(15)) AS 컬럼
  FROM user_constraints a, user_cons_columns b
 WHERE a.constraint_name = b.constraint_name
   AND a.table_name = 'ORDER_ITEMS'
 ORDER BY b.position;

CREATE TABLE PROMOTIONS (
    PROMO_ID    NUMBER(6,0),
    PROMO_NAME  VARCHAR2(20),
    CONSTRAINT PK_PROMOTIONS PRIMARY KEY (PROMO_ID)
);

SELECT CAST(column_name AS VARCHAR2(15)) AS 컬럼,
       CAST(data_type ||
            CASE WHEN data_type = 'NUMBER'   THEN '(' || data_precision || ',' || data_scale || ')'
                 WHEN data_type = 'VARCHAR2' THEN '(' || char_length || DECODE(char_used, 'B', ' BYTE', ' CHAR') || ')'
            END AS VARCHAR2(20)) AS 타입
  FROM user_tab_columns
 WHERE table_name = 'PROMOTIONS'
 ORDER BY column_id;

SELECT CAST(a.constraint_name AS VARCHAR2(15)) AS 제약명,
       a.constraint_type AS 종류,
       CAST(b.column_name AS VARCHAR2(15)) AS 컬럼
  FROM user_constraints a, user_cons_columns b
 WHERE a.constraint_name = b.constraint_name
   AND a.table_name = 'PROMOTIONS';

SELECT LOG(10, 2) AS log10_2,
       126 * LOG(10, 2) AS digits
  FROM dual;

CREATE SEQUENCE ORDERS_SEQ
    INCREMENT BY 1
    START WITH 1000
    MINVALUE 1
    MAXVALUE 99999999
    NOCYCLE
    NOCACHE;

SELECT sequence_name, min_value, max_value, increment_by, last_number
  FROM user_sequences
 WHERE sequence_name = 'ORDERS_SEQ';
