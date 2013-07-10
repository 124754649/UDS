USE [uds]
GO

/****** Object:  View [dbo].[vw_askforleave_base]    Script Date: 07/11/2013 01:35:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_askforleave_base]
AS
/****** 修改视图的方法 ******/
/******
		在表UDS_Flow_Style_Data中，总共用了26个字母来表示文档的不同属性。根据文档的创建的条件，尽管是同一类文档，不同的字段也会代表不同的意思。
		所以，这里用视图来获取一个统一的数据结构。
		在最初的文档中：
		a 表示 请假人名
		b 表示 请假的天数
		c 表示 请假起始时间
		d 表示 请假结束时间
		e 表示 请假事由

		在以后的文档中，可能会用不同的字段来表示相同的意思。
		例如：
		用a表示请假的天数
		这时，就要将视图脚本中的 dbo.UDS_Flow_Style_Data.b AS days 修改成 dbo.UDS_Flow_Style_Data.a AS days
		相应的，其它的字段也做相同的修改。

		那么，如果找出请假单？

		在 UDS_Flow_Document 中找出请假单对应的 Flow_ID，把初始视图中的
		dbo.UDS_Flow_Document.Flow_ID = 98 改成对应的ID编号即可。

		在某些系统中，可能存在多个请假单（由于审批的流程不同而导致多种请假单），在这种情况下，
		dbo.UDS_Flow_Document.Flow_ID = 98
		要改成
		dbo.UDS_Flow_Document.Flow_ID in （）的模式。

		相应的，不同的请假单之间，同一个字段会表示不同的意思，例如a可能在一个请假单中表示人名，而在另一个请假单中表示天数。
		此时，就需要使用case语句来分别选出对应的字段。例如：
		case dbo.uds_flow_document.flow_id
			when 98 then dbo.uds_flow_style_data.a
			when 99 then dbo.uds_flow_style_data.b
		end as name
******/
SELECT     dbo.UDS_Flow_Document.Flow_ID,
			dbo.UDS_Flow_Document.Doc_Status, 
			dbo.UDS_Flow_Style_Data.a AS name, 
			dbo.UDS_Flow_Style_Data.b AS days, 
            dbo.UDS_Flow_Style_Data.c AS startingDate, 
			dbo.UDS_Flow_Style_Data.d AS expiringDate, 
			dbo.UDS_Flow_Style_Data.e AS reason
FROM         dbo.UDS_Flow_Document INNER JOIN
                      dbo.UDS_Flow_Style_Data ON dbo.UDS_Flow_Document.Doc_ID = dbo.UDS_Flow_Style_Data.Doc_ID
WHERE dbo.UDS_Flow_Document.Flow_ID = 98

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UDS_Flow_Document"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UDS_Flow_Style_Data"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 121
               Right = 393
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_askforleave_base'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_askforleave_base'
GO