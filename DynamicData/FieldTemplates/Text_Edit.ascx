<%@ Control Language="C#" CodeBehind="Text_Edit.ascx.cs" Inherits="MAT.WebApp.App.Text_EditField" %>

<Metronic:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString %>'></Metronic:TextBox>

<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" />

