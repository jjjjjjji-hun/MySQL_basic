-- 권한 뺏기
-- GRANT가 들어갈 자리에 REVOKE를 사용하면 됩니다.
-- 단, REVOKE는 GRANT와 TO처럼 FROM과 연동해서 씁니다.
-- REVOKE 권한명 ... ON DB이름.테이블이름 FROM 계정명;


-- [조인(JOIN)]
-- 테이블 2개를 합쳐주는 기능
-- 연관된 데이터를 여러 테이블에 나눠담았을때 그것을 다시 재조립해줍니다.
-- 조인 문법
-- SELECT 테이블1.컬럼1, 테이블1.컬럼2, 테이블2.컬럼1, 테이블2.컬럼2...
-- 		FROM 테이블1 조인구문(INNER JOIN) 테이블2
-- 		ON 테이블1.공통컬럼 = 테이블2.공동컬럼;
-- 		WHERE구문은 ON으로 합쳐진 결과컬럼에 대한 필터링을 해줍니다.

SELECT * FROM buyTbl INNER JOIN userTbl ON buyTbl.user_id = userTbl.user_id;
SELECT * FROM buyTbl;
-- 지금 현재 구매자 정보를 조회하려고 하는데, 필요한 정보는
-- buyTbl의 구매 물품정보 전체에, 구매자 정보는 택배를 받기 위해서
-- 이름, 주소, 휴대폰번호만 있으면 되는 상황입니다.
SELECT buyTbl.order_number, buyTbl.user_id, buyTbl.prod_name, 
	buyTbl.group_name, buyTbl.price, buyTbl.amount,
    userTbl.user_name, userTbl.addr, userTbl.phone_number 
    FROM buyTbl INNER JOIN userTbl ON buyTbl.user_id = userTbl.user_id;
    
-- 위의 경우처럼 특정 테이블의 전체 데이터를 출력하는 경우는
-- 테이블명.*로 대체할 수 있습니다.
SELECT buyTbl.*,
    userTbl.user_name, userTbl.addr, userTbl.phone_number 
    FROM buyTbl INNER JOIN userTbl ON buyTbl.user_id = userTbl.user_id;
    
-- FROM구문에서 테이블명만 적는게 아니라, 테이블명 병명 형식으로 적을 경우는
-- 테이블명을 풀로 적지 않고 별명으로 대체해서 호출할 수 있어 좀 더 편리합니다.
SELECT * FROM buyTbl b INNER JOIN userTbl u
		ON b.user_id = u.user_id;
        
-- 현재 * 로 처리된 부분을
-- buyTbl의 구매 물품정보 전체에, 구매자 정보는 택배를 받기 위해서
-- 이름, 주소, 휴대폰번호만 있으면 되는 상황입니다.
-- 위에 적힌 컬럼조회하는 부분으로 고쳐주세요(단, buyTbl.*에 해당하는 구문은 쓰지 마세요)
SELECT b.order_number, b.user_id, b.prod_name, 
	b.group_name, b.price, b.amount, u.user_name, u.addr, u.phone_number 
    FROM buyTbl b INNER JOIN userTbl u ON b.user_id = u.user_id;
    
-- WHERE절은 먼저 JOIN구문의 결과가 나온 상태에서, 추가 필터링만을 담당합니다.
-- 구매물품의 가격이 50000원 이상인것만 남기는 구문.
SELECT b.order_number, b.user_id, b.prod_name, 
	b.group_name, b.price, b.amount, 
    u.user_name, u.addr, u.phone_number 
    FROM buyTbl b INNER JOIN userTbl u ON b.user_id = u.user_id
    WHERE price >= 50000;

-- 위쪽 JOIN구문을 활용하시되, 가격이 200000원 이하인 품목만 남겨주시고
-- 그 남은 자료들을 가격순으로 내림차순 출력해주세요.
SELECT b.order_number, b.user_id, b.prod_name, 
	b.group_name, b.price, b.amount, 
    u.user_name, u.addr, u.phone_number 
    FROM buyTbl b INNER JOIN userTbl u ON b.user_id = u.user_id
    WHERE price <= 200000 ORDER BY b.price DESC;
    
-- INNER JOIN은 양쪽 테이블 모두에 존재하는 데이터만 출력
-- LEFT JOIN, RIGHT JOIN은 공통데이터가 아닌 데이터도 방향에 따라
-- 출력이 되기 때문에 공통데이터(INNER)가 아닌 데이터(OUTER)까지
-- 출력되는 점을 이용해 OUTER JOIN이라고 부릅니다.
-- LEFT OUTER JOIN은 JOIN 구문의 왼쪽 테이블 데이터는 모두 출력하고,
-- 오른쪽 테이블 데이터는 왼쪽 테이블의 기준컬럼과 일치할때만 출력합니다.
-- RIGHT OUTER JOIN은 JOIN 구문의 오른쪽 테이블 데이터는 모두 출력하고,
-- 왼쪽 테이블 데이터는 오른쪽 테이블의 기준컬럼과 일치할때만 출력합니다.
-- FULL OUTER JOIN 양쪽 테이블 데이터를 전부 살린다.

SELECT * FROM userTbl; -- 가입회원은 11명
SELECT * FROM buyTbl; -- 구매이력이 있는 회원은 5명

-- LEFT JOIN인데, userTbl를 LEFT에, buyTbl을 RIGHT에 두고 작성해주세요.
-- INNER JOIN을 넣은 자리에 대신 LEFT OUTER JOIN으로 고쳐주시기만 하면 작동합니다.
-- 테이블의 컬럼은 전체 출력합니다.
SELECT * FROM userTbl LEFT OUTER JOIN buyTbl ON userTbl.user_id = buyTbl.user_id;

-- RIGHT JOIN인데, userTbl를 RIGHT에, buyTbl을 LEFT에 두고 작성해주세요.
-- INNER JOIN을 넣은 자리에 대신 RIGHT OUTER JOIN으로 고쳐주시기만 하면 작동합니다.
-- 테이블의 컬럼은 전체 출력합니다.
SELECT * FROM buyTbl RIGHT OUTER JOIN userTbl ON userTbl.user_id = buyTbl.user_id;

-- FULL OUTER JOIN은 누락데이터 없이 양쪽 테이블의 모든 자료를 보여줍니다.
-- ORACLE SQL에는 FULL OUTER JOIN을 구문으로 지원하지만 MySQL에서는
-- FULL OUTER JOIN을 UNION 명령어를 이용해
-- LEFT OUTER JOIN과 RIGHT OUTER JOIN의 결과물을 합쳐서 구현합니다.
-- 이 때 접점이 없는 데이터는 반대쪽 데이터를 NULL로 가집니다.
-- UNION은 위쪽 결과물과 아래쪽 결과물을 합쳐줍니다.
SELECT * FROM buyTbl b LEFT OUTER JOIN userTbl u ON b.user_id = u.user_id
	UNION -- UNION 구문은 위 아래 결과 화면을 합쳐 줍니다.(LEFT, RIGHT 사이에 넣으면 FULL)
SELECT * FROM buyTbl b RIGHT OUTER JOIN userTbl u ON b.user_id = u.user_id;

-- FULL OUTER JOIN 이해를 돕기 위한 추가 데이터 설정
CREATE TABLE student(
	user_name VARCHAR(3) PRIMARY KEY,
    user_addr CHAR(2) NOT NULL
);
CREATE TABLE membership(
	user_name VARCHAR(3) PRIMARY KEY,
    user_point INT NOT NULL
    );

INSERT INTO student VALUES ('강건마', '서울');
INSERT INTO student VALUES ('노영웅', '수원');
INSERT INTO student VALUES ('이상용', '인천');
SELECT * FROM student;

INSERT INTO membership VALUES ('강건마', 15000);
INSERT INTO membership VALUES ('노영웅', 37000);
INSERT INTO membership VALUES ('김철수', 500);
SELECT * FROM membership;

-- 위 데이터셋(학생 student, 회원포인트 membership)에 대해 left조인을 해주세요.
SELECT * FROM student s LEFT OUTER JOIN membership m ON s.user_name = m.user_name
UNION
SELECT * FROM student s RIGHT OUTER JOIN membership m ON s.user_name = m.user_name;

-- 위의 UNION으로 처리되는 구문은 user_name이 두 번 출력되는 문제가 있습니다.
-- 한 번만 출력되게 만들어보세요.
SELECT s.user_name, s.user_addr, m.user_point FROM student s LEFT OUTER JOIN membership m ON s.user_name = m.user_name
UNION
SELECT m.user_name, s.user_addr, m.user_point FROM student s RIGHT OUTER JOIN membership m ON s.user_name = m.user_name;
