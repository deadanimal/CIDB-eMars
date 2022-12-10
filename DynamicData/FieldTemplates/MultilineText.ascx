<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultilineText.ascx.cs" Inherits="MAT.WebApp.App.DynamicData.FieldTemplates.MultilineText" %>

<asp:TextBox ID="TextBox1" runat="server" SkinID="DefaultTextBox" TextMode="MultiLine" Text='<%# FieldValueString %>' Rows="5" Width="100%" ReadOnly="true"></asp:TextBox>
