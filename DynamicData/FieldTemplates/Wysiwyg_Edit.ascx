<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Wysiwyg_Edit.ascx.cs" Inherits="MAT.WebApp.App.DynamicData.FieldTemplates.Wysiwyg_Edit" %>

<div class="summernote" id="editor1" runat="server"></div>

<%--<asp:HiddenField ID="HidTemplate" runat="server" />--%>

<asp:TextBox ID="HidTemplate" runat="server" Text='<%# FieldValueEditString %>' Style="display: none"></asp:TextBox>
