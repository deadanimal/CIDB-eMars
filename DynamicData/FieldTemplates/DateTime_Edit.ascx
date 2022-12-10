<%@ Control Language="C#" CodeBehind="DateTime_Edit.ascx.cs" Inherits="MAT.WebApp.App.DateTime_EditField" %>

<Metronic:TextBox ID="TextBox1" runat="server" SkinID="DatePicker" Text='<%# FieldValueEditString%>'></Metronic:TextBox>

<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" />
<asp:CustomValidator runat="server" ID="DateValidator" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" />

