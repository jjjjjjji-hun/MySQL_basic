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
