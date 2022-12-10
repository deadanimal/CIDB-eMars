<%@ Control Language="C#" CodeBehind="MultilineText_Edit.ascx.cs" Inherits="MAT.WebApp.App.MultilineText_EditField" %>

<Metronic:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Text='<%# FieldValueEditString %>' Rows="5" Width="100%"></Metronic:TextBox>

<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" id="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Static" />

