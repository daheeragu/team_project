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

-- info_state 디폴트값을 대문자에서 소문자로 변환
ALTER TABLE tourinfo MODIFY (info_state varchar2(30) DEFAULT 'avaliable');

commit;