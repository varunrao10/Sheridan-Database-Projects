/*-----------------------------------------------------------------------------------
| exercise3ch10.sql																	|
| H.D																				|
| S6																				|
| This sctipt creates the tablas as per requirements of exercise 3 in chapter 10	|
-------------------------------------------------------------------------------------*/

DROP SEQUENCE members_seq;
DROP SEQUENCE groups_seq;
DROP TABLE members_groups;
DROP TABLE groups;
DROP TABLE members;

CREATE TABLE members(
  member_id           CHAR(4),
  first_name          VARCHAR2(50)  CONSTRAINT first_name_nn NOT NULL,
  last_name           VARCHAR2(50)  CONSTRAINT last_name_nn NOT NULL,
  address             VARCHAR2(50)  CONSTRAINT address_nn NOT NULL,
  city                VARCHAR2(25)  CONSTRAINT city_nn NOT NULL,
  province            CHAR(2)       DEFAULT 'ON',
  phone               VARCHAR2(50),
  CONSTRAINT members_pk PRIMARY KEY(member_id)
);

CREATE TABLE groups(
  group_id    CHAR(4),
  group_name  VARCHAR2(50)  CONSTRAINT group_name_nn NOT NULL,
  CONSTRAINT groups_pk PRIMARY KEY(group_id)
);

CREATE TABLE members_groups(
  member_id  CHAR(4),
  group_id   CHAR(4),
  CONSTRAINT memners_groups_pk PRIMARY KEY(member_id, group_id),
  CONSTRAINT members_groups_fk_members FOREIGN KEY(member_id)
      REFERENCES members (member_id),
  CONSTRAINT members_groups_fk_groups FOREIGN KEY(group_id)
      REFERENCES groups (group_id)
);

CREATE SEQUENCE members_seq;
CREATE SEQUENCE groups_seq;

Insert into members
Values('1','Varun','Rao','123 Sheridan Ave','Oakville','ON','123-456-789');
Insert into members
Values('2','John','Smith','322 hello street','Oakville','ON','345');

Insert into Groups
Values('G' || TO_CHAR(groups_seq.nextval, 'FM000'), 'BackRoom');

/*
Insert into members_groups
Values('M' || TO_CHAR(members_seq.currval, 'FM000'), 'G' || TO_CHAR(groups_seq.Currval, 'FM000')
);
*/
/*
update members
set city ='newyork'
where member_id='1'
*/

delete from members 
where member_id='2';




