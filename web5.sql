--web5 예제 테이블 

--회원정보 
create table web5_member (
	id			varchar2(20) primary key,	--회원ID
	password	varchar2(20) not null,		--비밀번호
	name		varchar2(20) not null,		--이름
	phone		varchar2(20),				--전화번호
	address		varchar2(100),				--주소
	email		varchar2(50)				--이메일주소
);

--입력 예 
insert into web5_member values ('hong','1234','홍길동','010-1111-1111','부산시 중구', 'abc@gmail.com');

