<%@ Control Language="C#" CodeBehind="Time_Edit.ascx.cs" Inherits="MAT.WebApp.App.Time_EditField" %>

<asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>
<asp:TextBox ID="TextBox1" runat="server" CssClass="DDTextBox input-sm form-control time-picker" Text='<%# FieldValueEditString%>' Columns="20"></asp:TextBox>
<asp:Literal runat="server" Text="</div>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" />
<asp:CustomValidator runat="server" ID="DateValidator" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" EnableClientScript="false" Enabled="false" OnServerValidate="DateValidator_ServerValidate" />

