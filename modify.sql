

ALTER    PROC sp_DeleteTeam 
		@TeamID int
/*

============================================================
功能:	删除组（类）接点
参数:
	@TeamID in		:	被删除的组IDt
============================================================

*/
AS

IF @TeamID<>1 
BEGIN
	--删除类接点
	DELETE FROM uds_class WHERE classid = @TeamID
	--删除组信息
	DELETE FROM uds_teaminfo WHERE teamid = @TeamID
	--删除组成员
	DELETE FROM uds_staff_in_team WHERE team_id = @TeamID
	--删除组权利
	DELETE FROM uds_assgn_rule WHERE team_id = @TeamID
	--删除组文档
	DELETE FROM uds_document WHERE classid = @TeamID
	--删除流程绑定职位
	--DELETE FROM uds_flow_bang
		--WHERE obj_id = @TeamID AND obj_type = 2
	--删除组订阅
	DELETE FROM UDS_Subscription WHERE classid = @TeamID
END
ELSE
	PRINT 'Can''t delete the deault project.'

