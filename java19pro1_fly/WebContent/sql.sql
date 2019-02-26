--用户信息表
create table userinfo(
id int(9) primary key not null auto_increment comment '主键',
email varchar(100) not null default '' comment '邮箱地址',
nickname varchar(200) not null default '' comment '用户昵称',
password varchar(500) not null default '' comment '用户密码',
head varchar(100) not null default 'default.png' comment '用户头像地址',
city varchar(50) not null default '外太空' comment '居住城市',
sex varchar(2) not null default '男' comment '性别',
sign varchar(1000) not null default '您的签名为空' comment '签名',
kissnum int(9) not null default 100 comment '飞吻数',
regtime date comment '注册时间',
authority int(2) not null default 0 comment '用户权限, 0 代表普通用户,1代表管理员',
experience int(9) not null default 0 comment '经验值, 发帖回帖涨经验值'
)
--文章类型信息表
create table articletype(
id int(9) primary key not null auto_increment comment '主键',
typename varchar(100) not null default '' comment '帖子类型'
)

--文章信息表
create table articleinfo(
id int(9) primary key not null auto_increment comment '主键',
title varchar(100) not null default '' comment '帖子标题',
authorid int(9) not null default 0 comment '作者id,对应userinfoid',
releasetime datetime comment '发布时间',
typeid int(9) not null default 0 comment '类型id 对应article中id',
visitnum int(9) not null default 0 comment '文章浏览量',
commentnum int(9) not null default 0 comment '文章评论量',
cream int(3) not null default 0 comment '是否是精华帖 0代表不是 1代表是',
stick int(3) not null default 0 comment '是否是置顶帖 0代表不是 1代表是',
isdone int(3) not null default 0 comment '是否结帖 0代表未结帖 1代表结帖',
paykiss int(9) not null default 0 comment '悬赏的飞吻数',
artcontent longtext comment '文章内容'
)

--帖子评论信息表
create table commentinfo(
id int(9) primary key not null auto_increment comment '主键',
authorid int(9) not null default 0 comment '评论者id,对应articleinfo id',
commtime datetime comment '评论时间',
commcontent longtext comment '评论内容',
artidorcommid int(9) not null default 0 comment '评论文章id,或者评论的id',
commtype int(3) not null default 0 comment '评论类型,0评论类型,1回复评论',
praisepoints int(9) not null default 0 comment '收到的赞',
isaccept int(3) not null default 0 comment '是否被采纳,0未被采纳,1被采纳'
)
--信息通知表  不用
create table messageinfo(
id int(9) primary key not null auto_increment comment '主键',
userid int(9) not null default 0 comment '', 
)
-- 收藏帖子信息表
create table collectioninfo(
id int(9) primary key not null auto_increment comment '主键',
userid int(9) not null default 0 comment '收藏者id',
articleid int(9) not null default 0 comment '收藏者帖子',
colltime datetime comment '收藏时间'  
)















