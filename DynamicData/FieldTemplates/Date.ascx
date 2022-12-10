<%@ Control Language="C#" CodeBehind="Date.ascx.cs" Inherits="MAT.WebApp.App.DateField" %>

<%--<asp:Literal runat="server" ID="Literal1" Text="<%# FieldValueString %>" />--%>

<asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueString %>' ReadOnly="true"></asp:TextBox>
