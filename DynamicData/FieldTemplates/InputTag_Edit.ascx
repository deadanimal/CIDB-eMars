<%@ Control Language="C#" CodeBehind="InputTag_Edit.ascx.cs" Inherits="MAT.WebApp.App.InputTag_Edit" %>

<asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>
<div class="input-group">
    <asp:TextBox ID="TextBox1" runat="server" Text='<%# FieldValueEditString %>' CssClass="DDTextBox input-sm form-control input-tags"></asp:TextBox>
</div>
<asp:Literal runat="server" Text="</div>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="TextBox1" Display="Dynamic" />

