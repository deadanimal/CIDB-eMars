<%@ Control Language="C#" AutoEventWireup="true"  CodeBehind="Url_Edit.ascx.cs" Inherits="MAT.WebApp.App.Url_EditField" %>

<asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>
<asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString%>' Columns="10" TextMode="Url" CssClass="DDTextBox input-sm form-control"></asp:TextBox>
<asp:Literal runat="server" Text="</div>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Static" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Static" />

