<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultipleSelection_Edit.ascx.cs" Inherits="MAT.WebApp.App.DynamicData.FieldTemplates.MultipleSelection_Edit" %>

<asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>
<asp:ListBox ID="DropDownList1" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="Get" CssClass="select2 tag-input-style" SelectionMode="Multiple"></asp:ListBox>
<asp:Literal runat="server" Text="</div>" Visible='<%# base.Column.IsRequired %>'></asp:Literal>

<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="DropDownList1" Display="Dynamic" Enabled="false" />
<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="DropDownList1" Display="Dynamic" />