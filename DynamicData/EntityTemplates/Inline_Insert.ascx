<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inline_Insert.ascx.cs" Inherits="MAT.WebApp.App.Inline_Insert" %>

<%@ Reference Control="~/DynamicData/EntityTemplates/Inline.ascx" %>

<asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
        <div>
            <asp:Label ID="Label1" runat="server" OnInit="Label_Init" OnPreRender="Label_PreRender" />
            <asp:DynamicControl runat="server" ID="DynamicControl" Mode="Insert" OnInit="DynamicControl_Init" />
        </div>
    </ItemTemplate>
</asp:EntityTemplate>


