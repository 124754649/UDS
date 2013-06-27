delete UDS_Class where ClassType = 18 and ClassName = '公告管理';

delete UDS_Class where ClassType = 19 and ClassName = '资产管理';

insert into UDS_Class(ClassName, ClassRemark, ClassType, ClassAddedBy, ClassAddedDate, Status)
values('公告管理', '公告管理', 18, 'admin', getDate(), 0);

update UDS_Class set ClassParentID = @@IDentity where ClassName = '公告管理' and ClassType = 18

insert into UDS_Class(ClassName, ClassRemark, ClassType, ClassAddedBy, ClassAddedDate, Status)
values('资产管理', '资产管理', 19, 'admin', getDate(), 0);

update UDS_Class set ClassParentID = @@IDentity where ClassName = '资产管理' and ClassType = 19;