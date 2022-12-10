<%@ Control Language="C#" CodeBehind="Time.ascx.cs" Inherits="MAT.WebApp.App.TimeField" %>

<%--<asp:Literal runat="server" ID="Literal1" Text="<%# FieldValueString %>" />--%>

<asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueString %>' ReadOnly="true"></asp:TextBox>
