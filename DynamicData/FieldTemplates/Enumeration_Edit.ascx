<%@ Control Language="C#" CodeBehind="Enumeration_Edit.ascx.cs" Inherits="MAT.WebApp.App.Enumeration_EditField" %>

<Metronic:DropDownList ID="DropDownList1" runat="server" DataValueField="Key" DataTextField="Value"></Metronic:DropDownList>

<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator help-block" ControlToValidate="DropDownList1" Display="Dynamic" />

