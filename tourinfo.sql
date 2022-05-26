--tourinfo ������ ����
create sequence tourinfo_seq;

select * from tourinfo;

-- ���� �� ����
insert into tourinfo (
    info_num, admin_id, info_title, info_subtitle, info_content
    , info_address, info_name, info_state, info_gu, info_theme
) values (
    tourinfo_seq.nextval, 'admin', 'ī�� ü��', '������ �������� ���� �ؾ緹����'
    , '��հڴ�', '�λ�� ������ ����2��', '���ȸ��ؼ�����', 'avaliable'
    , '������', 'leisure'
);

-- info_state ����Ʈ���� �빮�ڿ��� �ҹ��ڷ� ��ȯ
ALTER TABLE tourinfo MODIFY (info_state varchar2(30) DEFAULT 'avaliable');

commit;