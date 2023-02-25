drop table Customer;
drop sequence userNo;

CREATE SEQUENCE userNo
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 100000000
    NOCYCLE
NOCACHE;

CREATE TABLE Customer(
                         userNo NUMBER		NOT NULL,
                         userID	VARCHAR2(30)		NOT NULL,
                         userPwd	VARCHAR2(20)		NOT NULL,
                         userEmail	VARCHAR2(30)		NOT NULL,
                         userJoinDate	DATE		NOT NULL,
                         managerClassification	NUMBER		NOT NULL,
                         userAddress	VARCHAR2(30)		NOT NULL,
                         corpName	VARCHAR2(20)		NOT NULL,
                         corpType	VARCHAR2(10)		NOT NULL,
                         corpManager	VARCHAR2(10)		NOT NULL,
                         phoneNo	VARCHAR(20)		NOT NULL
);

ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (
                                                             userNo
    );
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo)
values(userNo.NEXTVAL,'100407',123,'jju@tistory.com','2023-02-22',0,'yongin','coupang','transport','geunju','01042933016');

INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo)
values(userNo.NEXTVAL,'950913',1234,'mm@tistory.com','2023-02-22',1,'yongin','coupang','transport','주종훈','01068898243');

alter table Customer add sessionKey varchar(50) default 'none' not null ;
alter table Customer add sessionLimit timestamp;
commit;
