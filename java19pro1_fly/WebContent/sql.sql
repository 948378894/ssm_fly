--�û���Ϣ��
create table userinfo(
id int(9) primary key not null auto_increment comment '����',
email varchar(100) not null default '' comment '�����ַ',
nickname varchar(200) not null default '' comment '�û��ǳ�',
password varchar(500) not null default '' comment '�û�����',
head varchar(100) not null default 'default.png' comment '�û�ͷ���ַ',
city varchar(50) not null default '��̫��' comment '��ס����',
sex varchar(2) not null default '��' comment '�Ա�',
sign varchar(1000) not null default '����ǩ��Ϊ��' comment 'ǩ��',
kissnum int(9) not null default 100 comment '������',
regtime date comment 'ע��ʱ��',
authority int(2) not null default 0 comment '�û�Ȩ��, 0 ������ͨ�û�,1�������Ա',
experience int(9) not null default 0 comment '����ֵ, ���������Ǿ���ֵ'
)
--����������Ϣ��
create table articletype(
id int(9) primary key not null auto_increment comment '����',
typename varchar(100) not null default '' comment '��������'
)

--������Ϣ��
create table articleinfo(
id int(9) primary key not null auto_increment comment '����',
title varchar(100) not null default '' comment '���ӱ���',
authorid int(9) not null default 0 comment '����id,��Ӧuserinfoid',
releasetime datetime comment '����ʱ��',
typeid int(9) not null default 0 comment '����id ��Ӧarticle��id',
visitnum int(9) not null default 0 comment '���������',
commentnum int(9) not null default 0 comment '����������',
cream int(3) not null default 0 comment '�Ƿ��Ǿ����� 0������ 1������',
stick int(3) not null default 0 comment '�Ƿ����ö��� 0������ 1������',
isdone int(3) not null default 0 comment '�Ƿ���� 0����δ���� 1�������',
paykiss int(9) not null default 0 comment '���͵ķ�����',
artcontent longtext comment '��������'
)

--����������Ϣ��
create table commentinfo(
id int(9) primary key not null auto_increment comment '����',
authorid int(9) not null default 0 comment '������id,��Ӧarticleinfo id',
commtime datetime comment '����ʱ��',
commcontent longtext comment '��������',
artidorcommid int(9) not null default 0 comment '��������id,�������۵�id',
commtype int(3) not null default 0 comment '��������,0��������,1�ظ�����',
praisepoints int(9) not null default 0 comment '�յ�����',
isaccept int(3) not null default 0 comment '�Ƿ񱻲���,0δ������,1������'
)
--��Ϣ֪ͨ��  ����
create table messageinfo(
id int(9) primary key not null auto_increment comment '����',
userid int(9) not null default 0 comment '', 
)
-- �ղ�������Ϣ��
create table collectioninfo(
id int(9) primary key not null auto_increment comment '����',
userid int(9) not null default 0 comment '�ղ���id',
articleid int(9) not null default 0 comment '�ղ�������',
colltime datetime comment '�ղ�ʱ��'  
)















