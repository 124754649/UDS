<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ControlCustomProjectTreeView.ascx.cs" Inherits="UDS.Inc.ControlCustomProjectTreeView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<asp:TreeView ID="tv1" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" ShowLines="True">
    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px" NodeSpacing="0px" VerticalPadding="2px" />
    <ParentNodeStyle Font-Bold="False" />
    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px" VerticalPadding="0px" />
</asp:TreeView>
