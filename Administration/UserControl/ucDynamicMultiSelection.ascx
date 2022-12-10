<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDynamicMultiSelection.ascx.cs" Inherits="MAT.WebApp.App.Administration.UserControl.ucDynamicMultiSelection" %>

<% if (IsRequired) this.Response.Write("<div class=\"input-group mat-input-required\">"); %>
<Metronic:MultiSelect ID="msMulti" runat="server" SelectMethod="msMulti_Select" DataValueField="Key" DataTextField="Value" OnDataBound="msMulti_DataBound"></Metronic:MultiSelect>
<% if (IsRequired) this.Response.Write("</div>"); %>

<asp:RequiredFieldValidator runat="server" ID="rfv" CssClass="DDControl DDValidator help-block" ControlToValidate="msMulti" Display="Dynamic" Enabled="false" />