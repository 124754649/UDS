using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Collections ;
using System.Configuration;
using System.Web;



namespace UDS.Components
{
	/// <summary>
	/// BBS ��ժҪ˵����
	/// </summary>
	public class BBSClass
	{
		#region �ж��Ƿ���BBS����Ȩ��
		/// <summary>
		/// �ж��Ƿ��й���Ȩ��
		/// </summary>
		/// <param name="username">�û���</param>
		/// <returns>bool</returns>
		public bool AdminBBS(string username,int classid)
		{
			if(classid!=0)
			{
				int actid = 8;
				Database db = new Database();
				SqlParameter[] prams = {
										   db.MakeInParam("@Class_ID",SqlDbType.Int,4,classid),
										   db.MakeInParam("@Username",SqlDbType.VarChar,100,username),
										   db.MakeInParam("@Act_ID",SqlDbType.Int,4,actid),
										   db.MakeOutParam("@ReturnValue",SqlDbType.Int,4)
									   };
				try
				{
					db.RunProc("sp_GetAccessPermission",prams);
										//					����������
										//					return(true);
					return((Int32.Parse(prams[3].Value.ToString())==1)?true:false);

				}
				catch(Exception ex)
				{
					Error.Log(ex.Message);
					throw new Exception("BBSȨ���жϴ���!",ex);
				}
			}
			else
				return(false);
			
		}

		#endregion

		#region �ж��Ƿ��з���ϵͳ����Ȩ��
		/// <summary>
		/// �ж��Ƿ��з���ϵͳ����Ȩ��
		/// </summary>
		/// <param name="username">�û���</param>
		/// <returns>bool</returns>
		public bool AdminSysBulletin(string username,int classid)
		{
			if(classid!=0)
			{
				int actid = 9;
				Database db = new Database();
				SqlParameter[] prams = {
										   db.MakeInParam("@Class_ID",SqlDbType.Int,4,classid),
										   db.MakeInParam("@Username",SqlDbType.VarChar,100,username),
										   db.MakeInParam("@Act_ID",SqlDbType.Int,4,actid),
										   db.MakeOutParam("@ReturnValue",SqlDbType.Int,4)
									   };
				try
				{
					db.RunProc("sp_GetAccessPermission",prams);
//					����������
//					return(true);
					return((Int32.Parse(prams[3].Value.ToString())==1)?true:false);

				}
				catch(Exception ex)
				{
					Error.Log(ex.Message);
					throw new Exception("BBSȨ���жϴ���!",ex);
				}
			}
			else
				return(false);
			
		}

		#endregion

		#region �ж��Ƿ��ǰ�����
		/// <summary>
		/// �ж��Ƿ��ǰ�����
		/// </summary>
		/// <param name="boardid">���ID</param>
		/// <param name="username">�û���</param>
		/// <returns></returns>
		public bool IsBoardMaster(int boardid,string username)
		{
			Database db = new Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@board_id",SqlDbType.Int,4,boardid),
									   db.MakeInParam("@staff_name",SqlDbType.VarChar,100,username)
								   };
			try
			{
				if(db.RunProc("sp_BBSISBoardMaster",prams)==1)
					return(true);
				else
					return(false);
			}
			catch(Exception ex)
			{
				Error.Log(ex.Message);
				throw new Exception("BBS����Ȩ���жϴ���!",ex);
			}

		}
		#endregion

        #region ����������Ϣ
		//��uds_bbs_catalog��,������¼
		public bool AddBBSCatalog (BBSCatalog BBSCatalog)  //string CatalogName,string CatalogDescription
		{
			//���� CatalogName ��ʾBBS�е�title , ���� CatalogDescription ��ʾBBS�е�content
			//���洢���̴��ݲ���
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@title",  SqlDbType.VarChar, 300, BBSCatalog.CatalogName),
									   data.MakeInParam("@content", SqlDbType.NText, 16, BBSCatalog.CatalogDescription),
			};
			data.RunProc ("sp_BBS_AddCatalog",prams);
			return true;
			
		}
		#endregion 

		#region ��ѯBBS����
		public SqlDataReader Find(string key,BBSSearchOption option,DataTable boards)
		{
			string boardids = "";
			string sql = "select * from UDS_Bbs_ForumItem";
			SqlDataReader dr = null;
			
			
			if(option.searchtype==BBSSearchType.author)
			{
				sql += " where sender like '%"+key+"%'";
			}
			else if(option.searchtype==BBSSearchType.title)
			{
				sql += " where title like '%"+key+"%'";
			}
			
			if(option.BoardID!=0)
			{
				sql += " and board_id="+option.BoardID;
			}
			else
			{
				foreach(DataRow row in boards.Rows)
				{
					boardids += row["board_id"].ToString() + ",";
				}

				if(boardids!="")
					boardids = boardids.Substring(0,boardids.Length-1);



				sql += " and board_id in ("+boardids+")";
			}
			if(option.TimeBound!=TimeSpan.MaxValue)
			{
				//����ʱ���
				sql += " and datediff(d,send_time,getdate())< "+option.TimeBound.Days.ToString();
			}
			
			
			UDS.Components.Database db = new UDS.Components.Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@SQL",  SqlDbType.NText, 5000, sql),
			};

			db.RunProc("sp_RunSQL",prams,out dr);
			return dr;
		}
		#endregion

		#region �޸ķ�����Ϣʱ����CatalogID��ʾ����
		public SqlDataReader GetModifyBBSCatalog (int m_CatalogID)
		{
			//����CatalogID��ʾ�洢�����е�@catalog_id int	����ID
			SqlDataReader dataReader = null;
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@catalog_id",  SqlDbType.Int, 4, m_CatalogID),
			};
			try
			{
				data.RunProc ("sp_BBS_GetCatalogInfo",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				//				throw new Exception("BBS������Ӵ���!",ex);
				return null;
			}
		}
		#endregion

		#region �޸ģ��༩������Ϣ��
		//���·�������Ϣ
		public bool EditBBSCatalog (BBSCatalog BBSCatalog)
		{
			//	@catalog_id int,				:	����ID
			//	@catalog_name varchar(300),		:	��������
			//	@catalog_description varchar(300)	:	��������
			// ���洢���̴��ݲ���
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@catalog_id",  SqlDbType.Int, 4, BBSCatalog.CatalogID),
									   data.MakeInParam("@catalog_name", SqlDbType.VarChar, 300, BBSCatalog.CatalogName),
									   data.MakeInParam("@catalog_description", SqlDbType.VarChar ,300, BBSCatalog.CatalogDescription),
			};
			try
			{
				data.RunProc ("sp_BBS_UpdateCatalogInfo",prams);
				return true;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				throw new Exception("BBS���༩����!",ex);
				
			}
		}
		#endregion

		#region ɾ��������������Ϣ��

		public int DelBBSCatalog(int catalog_id)
		{
			Database db = new Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@catalog_id ",SqlDbType.Int,4,catalog_id)
								   };
			return(db.RunProc("sp_BBS_DeleteCatalog",prams));
		}

	    #endregion

        #region �ڷ���������һ����飨��Ӱ�飩
		//��BBS������ ��Ӱ��
		public bool BBSAddBoard(BBSBoard BBSBoard)
		{
			//����洢���̴��ݵĲ�������
			//@catalog_id (int) ����ID��, @title (varchar(300)) ̧ͷ������, @content ntext �������, @boardtype bit �������
			
			Database data = new Database();
			SqlParameter[] prams = { 
									   data.MakeInParam ("@catalog_id", SqlDbType.Int, 4, BBSBoard.CatalogID ),
									   data.MakeInParam ("@title", SqlDbType.VarChar, 300, BBSBoard.BoardName ),
									   data.MakeInParam ("@content", SqlDbType.NText, 16, BBSBoard.BoardDescription ),
									   data.MakeInParam ("@boardtype", SqlDbType.Bit, 1, BBSBoard.BoardType ),
			};
			
				data.RunProc ("sp_BBS_AddBoard",prams);
				return true;

		}

        #endregion 

		#region �޸İ��ʱ����BoardID��ʾ����

		public SqlDataReader GetModifyBBSBoard (int m_BoardID)
		{
			//����m_BoardID��ʾ�洢�����е�@board_id int	:	���ID
			SqlDataReader dataReader = null;
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@board_id",  SqlDbType.Int, 4, m_BoardID),
			};
			try
			{
				data.RunProc ("sp_BBS_GetBoardInfo",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				//				throw new Exception("BBS������Ӵ���!",ex);
				return null;
			}
		}

		#endregion

		#region �޸ģ��༩��飩
		//���°����Ϣ
		public bool EditBBSBoard (BBSBoard BBSBoard)
		{
			//@board_id int,				:	�����µİ��ID			
			//@board_name varchar(300)		:	�������
			//@board_description varchar(300),	:	������
			//@board_type bit				:	�������(�����ͣ�˽����)
			// ���洢���̴��ݲ���
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@board_id",  SqlDbType.Int, 4, BBSBoard.BoardID),
									   data.MakeInParam("@board_name", SqlDbType.VarChar, 300, BBSBoard.BoardName),
									   data.MakeInParam("@board_description", SqlDbType.VarChar ,300, BBSBoard.BoardDescription),
									   data.MakeInParam("@board_type", SqlDbType.Bit, 1 ,BBSBoard.BoardType),
			};
			//try
			{
				data.RunProc ("sp_BBS_UpdateBoardInfo",prams);
				return true;
			}
			//catch (Exception ex)
			{
			//	Error.Log(ex.ToString());
			//	throw new Exception("BBS���༩����!",ex);
				
			}
		}    
		#endregion

		#region ɾ����ɾ����飩
		
		public int DelBBSBoard(int board_id)
		{
			//@board_id 	:	���ID
			Database db = new Database();
			SqlParameter[] prams = {
									   db.MakeInParam("@board_id ",SqlDbType.Int,4,board_id)
								   };
			return(db.RunProc("sp_BBS_DeleteBoard",prams));
		}

		#endregion

		#region �������
		//�õ�������
		public SqlDataReader GetBoardMaster ()
		{
			SqlDataReader dataReader = null;
			Database data = new Database();
			//SqlParameter[] prams = {
			//						   data.MakeInParam("@board_id",  SqlDbType.Int, 4, master.BoardID),
			//};
			try
			{
				data.RunProc ("sp_BBS_GetAllBoardMaster",out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}


		//ɾ������
		public int DeleteBoardMaster (BBSBoardmaster master)
		{
			//����:
			//      @BoardID 	:	���ID
			//   	@StaffID 	:	Ա��ID
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@BoardID", SqlDbType.Int, 4, master.BoardID),
									   data.MakeInParam("@StaffID", SqlDbType.Int, 4, master.StaffID), 
			};
			return(data.RunProc ("sp_BBS_DeleteBoardMaster",prams));
		}


		//���ð���
		public bool SetupBoardMaster (BBSBoardmaster master)
		{
			//����:	
			//       @BoardID int		:	���ID
			//     	@StaffID int		:	Ա��ID
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@BoardID", SqlDbType.Int, 4, master.BoardID),
									   data.MakeInParam("@StaffID", SqlDbType.Int, 4, master.StaffID), 
			};
			try
			{
				data.RunProc ("sp_BBS_SetupBoardMaster",prams);
				return true;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return false;
			}
		}


		//ȡ������ְ���û�����
		public SqlDataReader GetAllStaff()
		{
			//����  ��   Ĭ��ȡ��ְ��������Ա����
			SqlDataReader dataReader = null;
			Database data = new Database();
			try
			{
				data.RunProc ("sp_getallstaff",out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}

		#endregion

		#region ˽�а���Ա����
		//�õ�����Ա
		public SqlDataReader GetBoardMember ()
		{
			SqlDataReader dataReader = null;
			Database data = new Database();
			try
			{
				data.RunProc ("sp_BBS_GetAllBoardMember",out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}


		//ɾ����Ա
		public int DeleteBoardMember (BBSBoardmember member)
		{
			//����:
			//      @BoardID 	:	���ID
			//   	@StaffID 	:	Ա��ID
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@StaffID", SqlDbType.Int, 4, member.StaffID)
			};
			return(data.RunProc ("sp_BBS_DeleteBoardMember",prams));
		}


		//���ó�Ա
		public bool SetupBoardMember (int boardid,int staffid)
		{
			//����:	
			//       @BoardID int		:	���ID
			//     	@StaffID int		:	Ա��ID
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@BoardID", SqlDbType.Int, 4, boardid),
									   data.MakeInParam("@StaffID", SqlDbType.Int, 4, staffid), 
			};
			try
			{
				data.RunProc ("sp_BBS_SetupBoardMember",prams);
				return true;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return false;
			}
		}

		#endregion

		#region ��ʾ���з�����Ϣ
		public SqlDataReader GetBBSCatalog()
		{
			//����:			��
			SqlDataReader dataReader = null;
			Database data = new Database();

			try
			{
				data.RunProc ("sp_GetBBSCatalog",out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}
		#endregion

		#region ��ʾ���˵ķ������İ��
		public SqlDataReader GetBBSBoard(string m_StaffName)  
		{
			//����:  m_StaffName        :   Ա������
			//@catalog_id int			:	������ID
			// @staff_name varchar(50)=''	:	Ա������
			SqlDataReader dataReader = null;
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@staff_name",  SqlDbType.VarChar, 50, m_StaffName)
			};
			try 
			{
				data.RunProc ("sp_BBS_GetAllBoardByStaff",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}
        #endregion

		#region ��ʾ���а��
		public SqlDataReader GetAllBBSBoard()  
		{
			SqlDataReader dataReader = null;
			Database data = new Database ();
			try 
			{
				data.RunProc ("sp_BBS_GetAllBoard",out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}
		#endregion

		#region ��ʾ�ð�����������
		public SqlDataReader GetBBSForumItem(BBSForumItem item)
		{
			//����:	@board_id int		:	�ð��ID
			SqlDataReader dataReader = null;
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@board_id",  SqlDbType.Int, 4, item.BoardID),
			};
			try
			{
				data.RunProc ("sp_GetBBSForumItem",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}
        #endregion

		#region �õ�����ϵͳ����
		/// <summary>
		/// �õ�����ϵͳ����
		/// </summary>
		/// <returns></returns>
		public SqlDataReader GetSysBulletin()
		{
			SqlDataReader dataReader = null;
			Database data = new Database ();
			try
			{
				SqlParameter[] prams = {
										   data.MakeInParam("@type",  SqlDbType.Int, 4, -1),
				};
				data.RunProc ("sp_BBS_GetBulletin",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}

		}
		#endregion

		#region �õ��������湫��
		/// <summary>
		/// �õ��������湫��
		/// </summary>
		/// <returns></returns>
		public SqlDataReader GetDeskTopBulletin()
		{
			SqlDataReader dataReader = null;
			Database data = new Database ();
			try
			{
				SqlParameter[] prams = {
										   data.MakeInParam("@type",  SqlDbType.Int, 4, -2),
				};
				data.RunProc ("sp_BBS_GetBulletin",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}

		}
		#endregion

		#region �õ���鹫��
		/// <summary>
		/// �õ���鹫��
		/// </summary>
		/// <param name="boardid">���id,=0��ȡ�����а��Ĺ���</param>
		/// <returns></returns>
		public SqlDataReader GetBulletin(int boardid)
		{
			SqlDataReader dataReader = null;
			Database data = new Database ();
			try
			{
				SqlParameter[] prams = {
										   data.MakeInParam("@type",  SqlDbType.Int, 4, boardid),
				};
				data.RunProc ("sp_BBS_GetBulletin",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}

		}
		#endregion

		#region ��ȡ��̳����
		public SqlDataReader ReadBBSForumItem(BBSForumItem item)
		{
			//����:			@item_id int		:	����ID	
			SqlDataReader dataReader = null;
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@item_id",  SqlDbType.Int, 4, item.ItemID),
			};
			try 
			{
				data.RunProc ("sp_ReadBBSForumItem",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				return null;
			}
		}

		public void ReadBBSForumItemStruct(BBSForumItem item)
		{
			//����:			@item_id int		:	����ID	
			SqlDataReader dataReader = null;
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@item_id",  SqlDbType.Int, 4, item.ItemID),
			};
			try 
			{
				data.RunProc ("sp_ReadBBSForumItem",prams,out dataReader);
				while(dataReader.Read())
				{
					item.BoardID = Int32.Parse(dataReader["board_id"].ToString());
					item.Title = dataReader["title"].ToString();
					item.Content = dataReader["content"].ToString();
					item.Sender = dataReader["sender"].ToString();
					item.SendTime = DateTime.Parse(dataReader["send_time"].ToString());
					item.HitTimes = Int32.Parse(dataReader["hit_times"].ToString());
					item.ReplayTimes = Int32.Parse(dataReader["replay_times"].ToString());
					item.LastReplayer = dataReader["last_replayer"].ToString();
					item.LastReplayTime = dataReader["last_replay_time"].ToString();
					item.IP = dataReader["ip"].ToString();
					item.Bulletin = Convert.ToBoolean(dataReader["bulletin"]);
					item.SysBulletin = Convert.ToBoolean(dataReader["sysbulletin"]);
					item.DeskTop = Convert.ToBoolean(dataReader["desktop"]);
				}
			
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				
			}
		}
		#endregion

		#region �޸���̳����
		public void ModBBSForumItem(BBSForumItem item)
		{
			//����:			@item_id int		:	����ID	
			Database data = new Database ();
			SqlParameter[] prams = {
									    data.MakeInParam("@item_id",  SqlDbType.Int, 4, item.ItemID),
										data.MakeInParam("@board_id",  SqlDbType.Int, 4, item.BoardID),
										data.MakeInParam("@title",  SqlDbType.VarChar, 300, item.Title),
										data.MakeInParam("@content",  SqlDbType.NText, 5000, item.Content),
										data.MakeInParam("@sender",  SqlDbType.VarChar, 50, item.Sender),
										data.MakeInParam("@send_time",  SqlDbType.DateTime, 8, item.SendTime),
										data.MakeInParam("@hit_times",  SqlDbType.Int, 4, item.HitTimes),
										data.MakeInParam("@replay_times",  SqlDbType.Int, 4, item.ReplayTimes),
										data.MakeInParam("@last_replayer",  SqlDbType.VarChar, 50, item.LastReplayer),
										data.MakeInParam("@last_replay_time",  SqlDbType.DateTime, 8, item.LastReplayTime==""?Convert.DBNull:item.LastReplayTime),
										data.MakeInParam("@ip",  SqlDbType.VarChar, 50, item.IP),
										data.MakeInParam("@bulletin",  SqlDbType.Bit, 4, item.Bulletin),
										data.MakeInParam("@sysbulletin",  SqlDbType.Bit, 4, item.SysBulletin),
										data.MakeInParam("@desktop",  SqlDbType.Bit, 4, item.DeskTop),
			};
			try 
			{
				data.RunProc ("sp_BBS_UpdateItemInfo",prams);
				
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString());
				
			}
		}
		#endregion

		#region ��ȡ���ӻظ�
		public SqlDataReader ReadBBSForumItemReplay(BBSForumItem item)
		{
			//����:			@item_id int		:	����ID
			SqlDataReader dataReader = null;
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@item_id",  SqlDbType.Int, 4, item.ItemID),
			};
			try
			{
				data.RunProc ("sp_ReadBBSForumItemReplay",prams,out dataReader);
				return dataReader;
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString ());
				return null;
			}
		}
        #endregion

		#region ɾ���ظ�
		public void DelReplay(BBSReplay replay)
		{
			Database data = new Database ();
			SqlParameter[] prams = {
									    data.MakeInParam("@replayid",  SqlDbType.Int, 4,replay.ReplayId),
										data.MakeInParam("@itemid",SqlDbType.Int,4,replay.ItemID)
			};
			data.RunProc ("sp_BBS_DeleteReplay",prams);
		}
		#endregion

		#region �ظ�����
		public int ReplayItem(BBSReplay replay)
		{
			Database data = new Database ();
			SqlParameter[] prams = {
									    data.MakeInParam("@item_id",  SqlDbType.Int, 4, replay.ItemID),
										data.MakeInParam("@content",  SqlDbType.NText,5000, replay.Content),
										data.MakeInParam("@replayer",  SqlDbType.VarChar,300, replay.Replayer),
										data.MakeInParam("@replay_ip",  SqlDbType.VarChar,50, replay.ReplayId)
			};
			try
			{
				return(data.RunProc ("sp_BBSReplay",prams));
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString ());
				throw new Exception("�ظ�����");
			}

		}
		#endregion

		#region ��������
		public int SendItem(BBSForumItem item)
		{
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@board_id",  SqlDbType.Int, 4,item.BoardID),
									   data.MakeInParam("@title",  SqlDbType.VarChar,300,item.Title),
									   data.MakeInParam("@content",  SqlDbType.NText,5000,item.Content),
									   data.MakeInParam("@sender",  SqlDbType.VarChar,100,item.Sender),
									   data.MakeInParam("@ip",  SqlDbType.VarChar,50,item.IP ),
									   data.MakeInParam("@bulletin",SqlDbType.Bit,1,item.Bulletin),
									   data.MakeInParam("@sysbulletin",SqlDbType.Bit,1,item.SysBulletin),
									   data.MakeInParam("@desktop",SqlDbType.Bit,1,item.DeskTop)	
								   };
			try
			{
				return(data.RunProc ("sp_BBSAddItem",prams));
			}
			catch (Exception ex)
			{
				Error.Log(ex.ToString ());
				throw new Exception("��������");
			}
		}
		#endregion

		#region ���Ӱ���
		public void AddBoardMaster(int boardid,int staffid)
		{
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@BoardID",  SqlDbType.Int, 4,boardid),
									   data.MakeInParam("@StaffID",  SqlDbType.Int, 4,staffid)
								   };
			data.RunProc ("sp_BBS_SetupBoardMaster",prams);
			
		}
		#endregion

		#region ɾ������
		public void DelBoardMaster(int boardid,int staffid)
		{
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@BoardID",  SqlDbType.Int, 4,boardid),
									   data.MakeInParam("@StaffID",  SqlDbType.Int, 4,staffid)
								   };
			data.RunProc ("sp_BBS_DeleteBoardMaster",prams);
		}
	
		#endregion

		#region �ƶ���̳����
		public void MoveBoardItem(BBSForumItem olditem,BBSForumItem newitem)
		{
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@item_id",  SqlDbType.Int, 4,olditem.ItemID),
									   data.MakeInParam("@to_board_id",  SqlDbType.Int, 4,newitem.BoardID)
								   };
			data.RunProc ("sp_BBSMoveItem",prams);
		}
		#endregion

		#region ɾ����̳����
		public void DelItem(BBSForumItem item)
		{
			Database data = new Database ();
			SqlParameter[] prams = {
									   data.MakeInParam("@item_id",  SqlDbType.Int, 4,item.ItemID)
									  
								   };
			data.RunProc ("sp_BBSDeleteItem",prams);
		}
		#endregion

		#region �õ�������̳
		public SqlDataReader GetAllBoard()
		{
			Database data = new Database ();
			SqlDataReader dr = null;
			data.RunProc ("sp_BBSGetMoveToBoard",out dr);
			return(dr);
		}
		#endregion

		#region �ϴ�һ���ļ��õ�id��
		public int InsertFile(string name,string extension)
		{
			Database data = new Database();
			SqlParameter[] prams = {
									   data.MakeInParam("@name",SqlDbType.VarChar,200,name),
									   data.MakeInParam("@extension",SqlDbType.VarChar,100,extension)
								   };
			
			return(data.RunProc ("sp_BBS_AddFile",prams));
		}

		#endregion

		#region ����id�õ��ϴ�������Ϣ
		public SqlDataReader GetAttachmentByID(int id)
		{
			Database data = new Database();
			SqlDataReader dr = null;
			SqlParameter[] prams = {
									   data.MakeInParam("@id",SqlDbType.Int,4,id)
								   };
			data.RunProc ("sp_BBS_GetAttachmentByID",prams,out dr);
			return(dr);
		}
		#endregion

	}
}

public class BBSBoard
{
	private int m_BoardID;
	private int m_CatalogID;
	private string m_BoardName;
	private string m_BoardDescription;
	private int m_BoardType;
		
	public int BoardID
	{	
		//
		get { return m_BoardID; }
		set { m_BoardID = value; }
	}
 
	public int CatalogID
	{
		//
		get { return m_CatalogID; }
		set { m_CatalogID = value; }
	}

	public string BoardName
	{
		//
		get { return m_BoardName; }
		set { m_BoardName = value; }
	}

	public string BoardDescription
	{
		//
		get { return m_BoardDescription; }
		set { m_BoardDescription = value; }
	}
	
	public int BoardType	
	{
		//
		get { return m_BoardType; }
		set { m_BoardType = value; }
	} 
}

public class BBSBoardmaster
{
	// ������Ϣ
	private int m_BoardID;
	private int m_StaffID;

	public int BoardID 
	{
		//
		get { return m_BoardID; }
		set { m_BoardID = value; }
	}

	public int StaffID
	{
		//
		get { return m_StaffID; }
		set { m_StaffID = value; } 
	}   

}

public class BBSBoardmember
{
	//BBS��Ļ�Ա
	private int m_StaffID;
	private int m_BoardID;
		
	public int StaffID 
	{
		//
		get { return m_StaffID; } 
		set { m_StaffID = value; }
	}

	public int BoardID
	{
		//
		get { return m_BoardID; }
		set { m_BoardID = value; }
	}

}

public class BBSCatalog 
{
	//BBS ���
	private int m_CatalogID;
	private string m_CatalogName; 
	private string m_CatalogDescription;

	public int CatalogID
	{
		//���ID��
		get { return m_CatalogID; }
		set { m_CatalogID = value; }
	}

	public string CatalogName
	{
		// �������
		get { return m_CatalogName; } 
		set { m_CatalogName = value; }
	}
		
	public string CatalogDescription
	{
		// ���ע
		get { return m_CatalogDescription; }
		set { m_CatalogDescription = value; } 
	}

}

public class BBSForumItem
{
	//
	private int m_ItemID;
	private int m_BoardID;
	private string m_Title;
	private string m_Content;
	private string m_Sender;
	private DateTime m_SendTime;
	private int m_HitTimes;
	private int m_ReplayTimes;
	private string m_LastReplayer;
	private string m_LastReplayTime;
	private string m_IP;
	private bool m_Bulletin;
	private bool m_SysBulletin;
	private bool m_DeskTop;

	public int ItemID
	{
		//
		get { return m_ItemID;}
		set {m_ItemID = value;}
	}

	public int BoardID
	{
		//
		get { return m_BoardID; }
		set { m_BoardID = value; }
	}

	public string Title
	{
		//
		get { return m_Title; }
		set { m_Title = value; }
	}

	public string Content
	{
		//
		get { return m_Content; }
		set { m_Content = value; }
	}

	public string Sender 
	{
		//
		get { return m_Sender; }
		set { m_Sender = value; }
	}

	public DateTime SendTime
	{
		//����ʱ��
		get { return m_SendTime; }
		set { m_SendTime = value; }
	}

	public int HitTimes
	{
		//
		get { return m_HitTimes; }
		set { m_HitTimes = value; }
	}

	public int ReplayTimes
	{
		//�ظ�����
		get { return m_ReplayTimes; }
		set { m_ReplayTimes = value; }
	}

	public string LastReplayer
	{
		//
		get { return m_LastReplayer; }
		set { m_LastReplayer = value; }
	}

	public string LastReplayTime
	{
		//
		get { return m_LastReplayTime; }
		set { m_LastReplayTime = value; }
	}

	public string IP 
	{
		//
		get { return m_IP; }
		set { m_IP = value; }
	}
	/// <summary>
	/// ���湫��
	/// </summary>
	public bool Bulletin
	{
		get{return m_Bulletin;}
		set{m_Bulletin = value;}
	}
	/// <summary>
	/// ϵͳ����
	/// </summary>
	public bool SysBulletin
	{
		get{return m_SysBulletin;}
		set{m_SysBulletin = value;}
	}

	/// <summary>
	/// ����������ʾ
	/// </summary>
	public bool DeskTop
	{
		get{return m_DeskTop;}
		set{m_DeskTop = value;}
	}

	/// <summary>
	/// �����Ӹ����������
	/// </summary>
	/// <param name="filenames">�ļ���������ļ����� , �ֿ���</param>
	public void Attach(string filenames)
	{
		UDS.Components.Database data = new UDS.Components.Database ();
		string[] arrfilename = filenames.Split(',');
		for(int i=0;i<arrfilename.Length;i++)
		{
			if(arrfilename[i].Trim()!="")
			{
				SqlParameter[] prams = {
										   data.MakeInParam("@itemid",  SqlDbType.Int, 4,this.ItemID),
										   data.MakeInParam("@filename",  SqlDbType.VarChar, 500,arrfilename[i])
									   };
				data.RunProc ("sp_BBS_AttachmentToItem",prams);
			}
			
		}

	}

	/// <summary>
	/// ɾ������
	/// </summary>
	public void DelAttachment(string attachmentmd)
	{
		UDS.Components.Database data = new UDS.Components.Database ();
		//ɾ�����лظ�����
		//�õ����лظ�
		UDS.Components.BBSClass bbs = new UDS.Components.BBSClass();
		SqlDataReader dr1 = null;
		dr1 = bbs.ReadBBSForumItemReplay(this);
		while(dr1.Read())
		{
			BBSReplay replay = new BBSReplay();
			replay.ReplayId = Int32.Parse(dr1["replay_id"].ToString());
			replay.DelAttachment(attachmentmd);
		}
		//ɾ�����ӱ�����
		SqlParameter[] prams = {
								   data.MakeInParam("@itemid",  SqlDbType.Int, 4,this.ItemID),
		};
		SqlDataReader dr = null;
		data.RunProc ("sp_BBS_GetItemAttachment",prams,out dr);
		while(dr.Read())
		{
			System.IO.File.Delete(attachmentmd+"\\"+dr["filename"].ToString());
		}
		data.Close();
		SqlParameter[] prams1 = {
									data.MakeInParam("@itemid",  SqlDbType.Int, 4,this.ItemID),
		};
		data.RunProc("sp_BBS_DelAttachmentToItem",prams1);
	}
	        		
}
public class BBSReplay
{
	private int m_ReplayId;
	private int m_ItemId;
	private string m_Content;
	private string m_Replayer;
	private string m_ReplayTime;
	private string m_ReplayIP;
        
	public int ReplayId
	{
		//
		get { return m_ReplayId; }
		set { m_ReplayId = value; }
	}

	public int ItemID
	{
		//
		get { return m_ItemId; }
		set { m_ItemId = value; }
	}

	public string Content
	{
		//
		get { return m_Content; }
		set { m_Content = value;}
	}

	public string Replayer
	{
		//
		get { return m_Replayer; }
		set { m_Replayer = value; }
	}

	public string ReplayTime
	{
		//
		get { return m_ReplayTime; }
		set { m_ReplayTime = value; }
	}

	public string ReplayIP
	{
		//
		get { return m_ReplayIP; }
		set { m_ReplayIP = value; }
	}

	/// <summary>
	/// �������ͻظ���
	/// </summary>
	/// <param name="filenames">�ļ���,����ļ����� , �ֿ�</param>
	public void Attach(string filenames)
	{
		UDS.Components.Database data = new UDS.Components.Database ();
		string[] arrfilename = filenames.Split(',');
		for(int i=0;i<arrfilename.Length;i++)
		{
			if(arrfilename[i].Trim()!="")
			{
				SqlParameter[] prams = {
										   data.MakeInParam("@replayid",  SqlDbType.Int, 4,this.ReplayId),
										   data.MakeInParam("@filename",  SqlDbType.VarChar, 500,arrfilename[i])
									   };
				data.RunProc ("sp_BBS_AttachmentToReplay",prams);
			}
			
		}
	}

	/// <summary>
	/// ɾ������
	/// </summary>
	public void DelAttachment(string attachmentmd)
	{
		UDS.Components.Database data = new UDS.Components.Database ();
		SqlParameter[] prams = {
								   data.MakeInParam("@replayid",  SqlDbType.Int, 4,this.ReplayId),
							   };
		SqlDataReader dr = null;
		data.RunProc ("sp_BBS_GetReplayAttachment",prams,out dr);
		while(dr.Read())
		{
			System.IO.File.Delete(attachmentmd+"\\"+dr["filename"].ToString());
		}
		data.Close();
		SqlParameter[] prams1 = {
								   data.MakeInParam("@replayid",  SqlDbType.Int, 4,this.ReplayId),
		};
		data.RunProc("sp_BBS_DelAttachmentToReplay",prams1);
	}
}


public class BBSSearchOption
{
	private int _boardid;
	private TimeSpan _time;
	private BBSSearchType _searchtype;

	public int BoardID
	{
		get
		{
			return _boardid;
		}
		set
		{
			_boardid = value;
		}
	}

	public TimeSpan TimeBound
	{
		get
		{
			return _time;
		}
		set
		{
			_time = value;
		}
	}

	public BBSSearchType searchtype
	{
		get
		{
			return _searchtype;
		}
		set
		{
			_searchtype = value;
		}
	}
	
}

public enum BBSSearchType{author,title}
