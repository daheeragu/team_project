--tourinfo ������ ����
create sequence tourinfo_seq;

select * from tourinfo;
select * from admin;

-- ��� �� ����
insert into tourinfo (
    info_num, admin_id, info_title, info_subtitle, info_content
    , info_address, info_name, info_state, info_gu, info_theme
) values (
    tourinfo_seq.nextval, 'admin', '�ؿ�� �ؼ�����', '�λ��� ���÷��̽�'
    , '�ؿ�뱸', 'spot'
);

-- ���� �� ����
insert into tourinfo (
    info_num, admin_id, info_title, info_subtitle, info_content
    , info_address, info_name, info_state, info_gu, info_theme
) values (
    tourinfo_seq.nextval, 'admin', 'ī�� ü��', '������ �������� ���� �ؾ緹����'
    , '��հڴ�', '�λ�� ������ ����2��', '���ȸ��ؼ�����', 'avaliable'
    , '������', 'leisure'
);

-- ü�� �� ����
insert into tourinfo (
    info_num, admin_id, info_title, info_subtitle, info_content
    , info_address, info_name, info_state, info_gu, info_theme
) values (
    tourinfo_seq.nextval, 'admin', '�λ�ڹ���', '����η����� ����'
    , '���Ը��ƿ�', '�λ걤���� ���� ������ȭ�� 63', '�λ�ڹ���', 'avaliable'
    , '����', 'experience'
);

update tourinfo set info_state = 'available'
where info_state = 'avaliable';

-- info_state ����Ʈ���� �빮�ڿ��� �ҹ��ڷ� ��ȯ
ALTER TABLE tourinfo MODIFY (info_state varchar2(30) DEFAULT 'available');

-- DB�� NOTICE�� ������ �߰�
  CREATE SEQUENCE NOTICE_SEQ;

-- DB�� NOTICE_PIC ���̺� �߰�
  CREATE TABLE NOTICE_PIC ( 
   NOTICEPIC_NUM number PRIMARY KEY,
   SAVEDFILE varchar2(100),
   NOTICE_NUM number NOT NULL,
   CONSTRAINT NOTICE_PIC_FK FOREIGN KEY(NOTICE_NUM)
               REFERENCES NOTICE(NOTICE_NUM) ON DELETE CASCADE
    );

-- DB�� NOTICE_PIC ������ �߰�
 CREATE SEQUENCE NOTICE_PIC_SEQ;

-- DB EVENT ������ �߰�
 CREATE SEQUENCE EVENT_SEQ;

-- DB EVENT�� �÷� ���� 
--EVENT_CONTENTS �� VO Ŭ������ ������ EVENT_CONTENT�� ���߱� ���� �÷�����
 ALTER TABLE EVENT RENAME COLUMN EVENT_CONTENTS TO EVENT_CONTENT;

--event_pic ����
create table event_pic (
    eventpic_num number primary key
    , savedfile varchar2(100)
    , event_num number not null
);

--event_pic�� �ܷ�Ű ����
ALTER TABLE EVENT_PIC
	ADD FOREIGN KEY (EVENT_NUM)
	REFERENCES EVENT (EVENT_NUM)
;

 -- EVENT_PIC�� VOŬ������ SAVEDFILE�� �ֱ� ������ EVENT�� SAVEDFILE �÷� ���� ����     
ALTER TABLE EVENT DROP COLUMN EVENT_SAVEDFILE;

select * from admin;

select * from userinfo;

commit;