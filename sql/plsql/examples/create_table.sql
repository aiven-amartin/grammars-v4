CREATE TABLE employee (
     first_name VARCHAR2(128),
     last_name VARCHAR2(128),
     empID NUMBER,
     salary NUMBER(6) ENCRYPT
);
CREATE TABLE employee (
     first_name VARCHAR2(128),
     last_name VARCHAR2(128),
     empID NUMBER ENCRYPT NO SALT,
     salary NUMBER(6) ENCRYPT USING '3DES168'
);

CREATE TABLE persons OF person
  ( homeaddress NOT NULL,
      UNIQUE (homeaddress.phone),
      CHECK (homeaddress.zip IS NOT NULL),
      CHECK (homeaddress.city <> 'San Francisco') );

CREATE TABLE purchaseorder_as_table OF XMLType
  XMLSCHEMA "http://xmlns.oracle.com/xdb/documentation/purchaseOrder.xsd"
  ELEMENT "PurchaseOrder";

CREATE TABLE purchaseorder_as_column (id NUMBER, xml_document XMLType)
  XMLTYPE COLUMN xml_document
  ELEMENT
    "http://xmlns.oracle.com/xdb/documentation/purchaseOrder.xsd#PurchaseOrder";

CREATE TABLE po_binaryxml OF XMLType
 XMLTYPE STORE AS BINARY XML
 VIRTUAL COLUMNS
 (DATE_COL AS (XMLCast(XMLQuery('/PurchaseOrder/@orderDate'
 PASSING OBJECT_VALUE RETURNING CONTENT)
 AS DATE))) ;


create table junk (
       me date,
       primary key (me)
);

CREATE TABLE TEST
      AS 
      WITH TESTCTE AS (
        SELECT 1 ONE FROM DUAL
      )
      SELECT 'A', 'B', 'C'
      FROM DUAL
      JOIN TESTCTE;

CREATE TABLE DEMO (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    TEST VARCHAR2(100) NOT NULL
);

CREATE TABLE DEMO (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    TEST VARCHAR2(100) NOT NULL
);

CREATE TABLE DEMO (
    ID NUMBER GENERATED ALWAYS AS IDENTITY,
    TEST VARCHAR2(100) NOT NULL
);

CREATE TABLE products (
    id NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY (START WITH 101) NOT NULL PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    description VARCHAR2(512),
    weight FLOAT,
    PRICE NUMERIC(10,-2)
);

CREATE TABLE products (
    id NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY (START WITH 101 INCREMENT BY 1 CYCLE CACHE 200) NOT NULL PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    description VARCHAR2(512),
    weight FLOAT,
    PRICE NUMERIC(10,-2)
);

create table "DVSADM".CMP3$58238005 nocompress tablespace "DVS_PROOF" nologging lob (VALUE) store as (tablespace "DVS_PROOF" enable storage in row nocache nologging) as select /*+ DYNAMIC_SAMPLING(0) FULL("DVSADM"."DVS_ARCHIVE") */ * from "DVSADM"."DVS_ARCHIVE" sample block( 6.734) mytab;
