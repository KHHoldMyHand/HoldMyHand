-- Customer 테이블 생성& userNo 시퀀스 생성
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
    userNo                  NUMBER              NOT NULL,
    userID                  VARCHAR2(30)		NOT NULL,
    userPwd	                VARCHAR2(20)		NOT NULL,
    userEmail	            VARCHAR2(30)		NOT NULL,
    userJoinDate	        DATE		        NOT NULL,
    managerClassification	NUMBER		        NOT NULL,
    userAddress	            VARCHAR2(30)		NOT NULL,
    corpName	            VARCHAR2(20)		NOT NULL,
    corpType	            VARCHAR2(10)		NOT NULL,
    corpManager	            VARCHAR2(10)		NOT NULL,
    phoneNo	                VARCHAR2(20)		NOT NULL,
    creditStatus            NUMBER              NOT NULL
);

ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (userNo);
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'100407',123,'jju@tistory.com',SYSDATE,0,'yongin','coupang','transport','geunju','01042933016',0);

INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'950913',1234,'mm@tistory.com',SYSDATE,1,'yongin','coupang','transport','주종훈','01068898243',0);

alter table Customer add sessionKey varchar(50) default 'none' not null ;
alter table Customer add sessionLimit timestamp;
commit;



----
CREATE TABLE Corporation (
    userNo              NUMBER                              NOT NULL,
    establishmentName   VARCHAR2(30)                        NOT NULL,
    establishmentDate   VARCHAR2(20)                        NOT NULL,
    companyName         VARCHAR2(20)                        NOT NULL,
    companyScale        VARCHAR2(20)                        NOT NULL,
    employeers          NUMBER                              NOT NULL,
    tax                 NUMBER                                      ,
    score               VARCHAR2(3)         DEFAULT 'NR'        NULL,
    files               NUMBER              DEFAULT 0           NULL,
    receiptDate         DATE,
    CONSTRAINT fk_midx foreign key(userNo) references Customer (userNo)
);
INSERT INTO Corporation (userNo,establishmentName, establishmentDate, companyName,companyScale,employeers,tax,score,receiptDate)
values(10,'주종훈','1995/09/13','쿠팡','협력업체',1024,'10000000','NR',sysdate);

