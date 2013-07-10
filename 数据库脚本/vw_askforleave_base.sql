USE [uds]
GO

/****** Object:  View [dbo].[vw_askforleave_base]    Script Date: 07/11/2013 01:35:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_askforleave_base]
AS
/****** �޸���ͼ�ķ��� ******/
/******
		�ڱ�UDS_Flow_Style_Data�У��ܹ�����26����ĸ����ʾ�ĵ��Ĳ�ͬ���ԡ������ĵ��Ĵ�����������������ͬһ���ĵ�����ͬ���ֶ�Ҳ�����ͬ����˼��
		���ԣ���������ͼ����ȡһ��ͳһ�����ݽṹ��
		��������ĵ��У�
		a ��ʾ �������
		b ��ʾ ��ٵ�����
		c ��ʾ �����ʼʱ��
		d ��ʾ ��ٽ���ʱ��
		e ��ʾ �������

		���Ժ���ĵ��У����ܻ��ò�ͬ���ֶ�����ʾ��ͬ����˼��
		���磺
		��a��ʾ��ٵ�����
		��ʱ����Ҫ����ͼ�ű��е� dbo.UDS_Flow_Style_Data.b AS days �޸ĳ� dbo.UDS_Flow_Style_Data.a AS days
		��Ӧ�ģ��������ֶ�Ҳ����ͬ���޸ġ�

		��ô������ҳ���ٵ���

		�� UDS_Flow_Document ���ҳ���ٵ���Ӧ�� Flow_ID���ѳ�ʼ��ͼ�е�
		dbo.UDS_Flow_Document.Flow_ID = 98 �ĳɶ�Ӧ��ID��ż��ɡ�

		��ĳЩϵͳ�У����ܴ��ڶ����ٵ����������������̲�ͬ�����¶�����ٵ���������������£�
		dbo.UDS_Flow_Document.Flow_ID = 98
		Ҫ�ĳ�
		dbo.UDS_Flow_Document.Flow_ID in ������ģʽ��

		��Ӧ�ģ���ͬ����ٵ�֮�䣬ͬһ���ֶλ��ʾ��ͬ����˼������a������һ����ٵ��б�ʾ������������һ����ٵ��б�ʾ������
		��ʱ������Ҫʹ��case������ֱ�ѡ����Ӧ���ֶΡ����磺
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