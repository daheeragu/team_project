--tourinfo 시퀀스 생성
create sequence tourinfo_seq;

select * from tourinfo;

-- 레저 글 예시
insert into tourinfo (
    info_num, admin_id, info_title, info_subtitle, info_content
    , info_address, info_name, info_state, info_gu, info_theme
) values (
    tourinfo_seq.nextval, 'admin', '카약 체험', '가벼운 마음으로 즐기는 해양레포츠'
    , '재밌겠다', '부산시 수영구 광안2동', '광안리해수욕장', 'avaliable'
    , '수영구', 'leisure'
);

-- 체험 글 예시
insert into tourinfo (
    info_num, admin_id, info_title, info_subtitle, info_content
    , info_address, info_name, info_state, info_gu, info_theme
) values (
    tourinfo_seq.nextval, 'admin', '부산박물관', '고고인류학의 보고'
    , '볼게많아요', '부산광역시 남구 유엔평화로 63', '부산박물관', 'avaliable'
    , '남구', 'experience'
);

-- info_state 디폴트값을 대문자에서 소문자로 변환
ALTER TABLE tourinfo MODIFY (info_state varchar2(30) DEFAULT 'avaliable');

-- DB에 NOTICE에 시퀀스 추가
  CREATE SEQUENCE NOTICE_SEQ;

-- DB에 NOTICE_PIC 테이블 추가
  CREATE TABLE NOTICE_PIC ( 
   NOTICEPIC_NUM number PRIMARY KEY,
   SAVEDFILE varchar2(100),
   NOTICE_NUM number NOT NULL,
   CONSTRAINT NOTICE_PIC_FK FOREIGN KEY(NOTICE_NUM)
               REFERENCES NOTICE(NOTICE_NUM) ON DELETE CASCADE
    );

-- DB에 NOTICE_PIC 시퀀스 추가
 CREATE SEQUENCE NOTICE_PIC_SEQ;

-- DB EVENT 시퀀스 추가
 CREATE SEQUENCE EVENT_SEQ;

-- DB EVENT에 컬럼 변경 
--EVENT_CONTENTS 를 VO 클래스의 변수명 EVENT_CONTENT로 맞추기 위해 컬럼변경
 ALTER TABLE EVENT RENAME COLUMN EVENT_CONTENTS TO EVENT_CONTENT;
   
 -- EVENT_PIC의 VO클래스에 SAVEDFILE이 있기 때문에 EVENT의 SAVEDFILE 컬럼 삭제 진행     
ALTER TABLE EVENT DROP COLUMN EVENT_SAVEDFILE;

select * from admin;

select * from userinfo;

insert into 

commit;