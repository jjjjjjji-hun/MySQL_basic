-- 테이블을 만들어주세요.
-- 테이블 이름 : userinfo
-- uname 10글자 회원이름
-- uid 20글자 회원아이디
-- upw 20글자 회원비밀번호
-- uemail 20글자 회원이메일

CREATE TABLE userinfo(
	uname VARCHAR(10) not null,
    uid VARCHAR(20) PRIMARY KEY,
    upw VARCHAR(20) not null,
    uemail VARCHAR(20) 
);

-- 유저 4명을 입력해주세요.
-- 2명은 이메일 넣어주시고 2명은 넣지 말아주세요.
INSERT INTO userinfo VALUES ('김자바', 'KJV', 'javaKim', 'Java@naver.com');
INSERT INTO userinfo VALUES ('김파이썬', 'KPTH', 'pythonKim', 'Pison@naver.com');
INSERT INTO userinfo VALUES ('박스프링', 'PSP', 'springPark', null);
INSERT INTO userinfo VALUES ('장부트', 'JB', 'bootJang', null);

SELECT * FROM userinfo;
DELETE FROM userinfo WHERE uid = 'JB';

-- 게시판 테이블(boardinfo)을 생성해보겠습니다.
CREATE TABLE boardinfo(
board_num INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
content VARCHAR(2000) NOT NULL,
writer VARCHAR(30) NOT NULL,
bdate DATETIME DEFAULT now(),
mdate DATETIME DEFAULT now(),
hit INT DEFAULT 0
);

SELECT * FROM boardinfo;

INSERT INTO boardinfo(title, content, writer) VALUES('jsp 배우기', 'jsp는 배울게 진짜 많구나 열심히 배워야지', '김자바');
INSERT INTO boardinfo VALUES(null, 'html', 'html도 빨리 복습해야하는데', '최스프링', now(), now(), 0);
INSERT INTO boardinfo(title, content, writer) VALUES('java', 'java 까먹지 않았겠지 걱정이다', '박파이썬');

