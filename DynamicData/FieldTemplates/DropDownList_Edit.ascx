<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropDownList_Edit.ascx.cs" Inherits="MAT.WebApp.App.DynamicData.FieldTemplates.DropDownList_Edit" %>

<Metronic:DropDownList ID="DropDownList1" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="Get"></Metronic:DropDownList>

<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="DropDownList1" Display="Dynamic" />