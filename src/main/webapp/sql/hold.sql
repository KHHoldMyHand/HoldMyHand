-- Customer 테이블 생성& userNo 시퀀스 생성
drop table Reply;
drop table CREDITEVALUATION;
drop table QA;
drop table Corporation;
drop table Customer;
drop table FileInfo;
drop sequence userNo;
drop sequence QANo;
drop sequence reportNo;
drop sequence ReplyNo;


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

ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (userNo);

alter table Customer add sessionKey varchar(50) default 'none' not null ;
alter table Customer add sessionLimit timestamp;
commit;



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
                             CONSTRAINT fk_midx foreign key(userNo) references Customer (userNo) on delete cascade
);

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
                    writer   VARCHAR2(10)      NOT NULL,
                    CONSTRAINT PK_QA PRIMARY KEY (QANo)
);

CREATE SEQUENCE QANo
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 100000000
    NOCYCLE
    NOCACHE;

ALTER TABLE QA ADD CONSTRAINT FK_userNo FOREIGN KEY (userNo) REFERENCES Customer (userNo) on delete cascade;

CREATE TABLE CREDITEVALUATION (
                                  reportNo          NUMBER                  NOT NULL,
                                  reportRank        VARCHAR2(30)            NOT NULL,
                                  userNo            NUMBER                  NOT NULL,
                                  createDate        DATE                    NOT NULL,
                                  fileDate          DATE                    NOT NULL,
                                  CONSTRAINT PK_CREDITEVALUATION PRIMARY KEY (reportNo)
);

CREATE SEQUENCE reportNo
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 100000000
    NOCYCLE
NOCACHE;

ALTER TABLE CREDITEVALUATION ADD CONSTRAINT FK_userNo_1 FOREIGN KEY(userNo) REFERENCES CUSTOMER (userNo) on delete cascade;

CREATE TABLE Reply (
                       ReplyNo          NUMBER          NOT NULL,
                       replyContent     VARCHAR2(200)   NOT NULL,
                       QANo             NUMBER          NOT NULL,
                       userNo           NUMBER          NOT NULL,
                       ReWriter         VARCHAR2(10)    NOT NULL
);

ALTER TABLE Reply ADD CONSTRAINT PK_REPLY PRIMARY KEY (ReplyNo);
ALTER TABLE Reply ADD CONSTRAINT FK_userNo_By_Reply FOREIGN KEY (userNo)REFERENCES Customer (userNo) on delete cascade;
ALTER TABLE Reply ADD CONSTRAINT FK_QANo_By_Reply FOREIGN KEY (QANo)REFERENCES QA (QANo) on delete cascade;
CREATE SEQUENCE  ReplyNo
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 100000000
    NOCYCLE
NOCACHE;

--관리자계정 생성
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'950913',1234,'wnwhdgns12@naver.com',SYSDATE,1,'경기도 성남시','X','X','주종훈','01068898243',9);
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'950916',1234,'?@?',SYSDATE,1,'서울특별시','X','X','추경현','01068898243',9);
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'970319',1234,'?@?',SYSDATE,1,'경기도 화성시','X','X','김창민','01075095747',9);
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'000000',1234,'?@?',SYSDATE,1,'경기도 광명시','X','X','김해란','01068898243',9);
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'961002',1234,'?@?',SYSDATE,1,'경기도 고양시','X','X','김영빈','01068898243',9);
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'960806',1234,'?@?',SYSDATE,1,'경기도 시흥시','X','X','김비오','01068898243',9);
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,'960718',1234,'jju@tistory.com',SYSDATE,1,'경기도 용인시','X','X','오근주','01042933016',9);


--랜덤고객계정 생성(아래 테이블 n번 반복실행)
INSERT INTO Customer (userNo,userID, userPwd, userEmail,userJoinDate,managerClassification,userAddress,corpName,corpType,corpManager,phoneNo,creditStatus)
values(userNo.NEXTVAL,TRUNC(DBMS_RANDOM.VALUE(100000,999999)),1234,'random@naver.com',SYSDATE,0,'randomAddress','randomCompany','randomtype','RandomName','010'+TRUNC(DBMS_RANDOM.VALUE(10000000,99999999)),0);


--8번유저의 신용평가 신청만 한 상태로 만듬.
INSERT INTO Corporation (userNo,establishmentName, establishmentDate, companyName,companyScale,employeers,tax,score,receiptDate)
values(3,'','1997/05/15','배달의민족','협력업체',1099,'10000000','NR',sysdate);
--게시물 하나 만듦.
INSERT INTO QA (QANO,TITLE,CONTENT,WRITEDATE,USERNO,ADMINNO,COUNT,WRITER)
VALUES (QANO.nextval,'abc','내용6',SYSDATE,1,1,0,'바보');

--1번 게시물에 1번 유저와 2번 유저가 한개씩 총 2개의 댓글을 닮.
insert into reply values (ReplyNo.NEXTVAL,'첫번째댓글',1,1,'바보');
insert into reply values (ReplyNo.NEXTVAL,'두번째댓글',1,2,'멍청2');


COMMIT;

