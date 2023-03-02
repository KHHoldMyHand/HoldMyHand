-- Customer 테이블 생성& userNo 시퀀스 생성
drop table CREDITEVALUATION;
drop table QA;
drop table Corporation;
drop table Customer;
drop table FileInfo;
drop sequence userNo;
drop sequence QANo;
drop sequence reportNo;

CREATE SEQUENCE userNo
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 100000000
    NOCYCLE
NOCACHE;

CREATE TABLE Customer(
    userNo                  NUMBER              NOT NULL,
    userID                  VARCHAR2(300)		NOT NULL,
    userPwd	                VARCHAR2(200)		NOT NULL,
    userEmail	            VARCHAR2(300)		NOT NULL,
    userJoinDate	        DATE		        NOT NULL,
    managerClassification	NUMBER		        NOT NULL,
    userAddress	            VARCHAR2(300)		NOT NULL,
    corpName	            VARCHAR2(200)		NOT NULL,
    corpType	            VARCHAR2(100)		NOT NULL,
    corpManager	            VARCHAR2(100)		NOT NULL,
    phoneNo	                VARCHAR2(200)		NOT NULL,
    creditStatus            NUMBER              NOT NULL
);

ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (userNo) on delete cascade;
--혹시 에러가 나면 아래 코드를 대신 사용
--ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (userNo);

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
    establishmentName   VARCHAR2(300)                        NOT NULL,
    establishmentDate   VARCHAR2(200)                        NOT NULL,
    companyName         VARCHAR2(200)                        NOT NULL,
    companyScale        VARCHAR2(200)                        NOT NULL,
    employeers          NUMBER                              NOT NULL,
    tax                 NUMBER                                      ,
    score               VARCHAR2(30)         DEFAULT 'NR'        NULL,
    files               NUMBER              DEFAULT 0           NULL,
    receiptDate         DATE,
    CONSTRAINT fk_midx foreign key(userNo) references Customer (userNo)
);
INSERT INTO Corporation (userNo,establishmentName, establishmentDate, companyName,companyScale,employeers,tax,score,receiptDate)
values(1,'주종훈','1995/09/13','쿠팡','협력업체',1024,'10000000','NR',sysdate);

CREATE TABLE FileInfo (
    userNo              NUMBER                              NOT NULL,
    fileName            VARCHAR(300)                        NOT NULL
);

CREATE TABLE QA (
                    QANo   NUMBER      NOT NULL,
                    title   VARCHAR2(30)      NOT NULL,
                    content   VARCHAR2(500)      NOT NULL,
                    writeDate   DATE      NOT NULL,
                    userNo   NUMBER      NOT NULL,
                    adminNo   NUMBER      NULL,
                    count   NUMBER   DEFAULT 0   NOT NULL,
                    writer   VARCHAR2(10)      NOT NULL
);

ALTER TABLE QA ADD CONSTRAINT PK_QA PRIMARY KEY (QANo);

CREATE SEQUENCE QANo
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 100000000
    NOCYCLE
    NOCACHE;

ALTER TABLE QA ADD CONSTRAINT FK_userNo FOREIGN KEY (userNo) REFERENCES Customer (userNo);

CREATE TABLE CREDITEVALUATION (
                                  reportNo   NUMBER      NOT NULL,
                                  reportRank   VARCHAR2(30)      NOT NULL,
                                  userNo   NUMBER      NOT NULL,
                                  createDate   DATE      NOT NULL,
                                  fileDate   DATE      NOT NULL

);

CREATE SEQUENCE reportNo
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 100000000
    NOCYCLE
NOCACHE;

ALTER TABLE CREDITEVALUATION ADD CONSTRAINT PK_CREDITEVALUATION PRIMARY KEY (reportNo);

ALTER TABLE CREDITEVALUATION ADD CONSTRAINT FK_userNo_1 FOREIGN KEY(userNo) REFERENCES CUSTOMER (userNo);


INSERT INTO Creditevaluation (reportNo, reportRank, userNo, createDate, fileDate) VALUES(1, 'AAA', 1, sysdate, '20230225');

INSERT INTO Creditevaluation (reportNo, reportRank, userNo, createDate, fileDate) VALUES(2, 'AAA', 2, sysdate, '20230225');


COMMIT;

