<%@ Control Language="C#" CodeBehind="Password_Edit.ascx.cs" Inherits="MAT.WebApp.App.Password_EditField" %>

<Metronic:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString%>' TextMode="Password"></Metronic:TextBox>

<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" />

