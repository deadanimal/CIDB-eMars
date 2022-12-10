<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inline_Edit.ascx.cs" Inherits="MAT.WebApp.App.Inline_Edit" %>

<%@ Reference Control="~/DynamicData/EntityTemplates/Inline.ascx" %>
<asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" OnInit="Label_Init" OnPreRender="Label_PreRender" CssClass="col-sm-3 control-label no-padding-right" />

            <div class="col-sm-9">
                <asp:DynamicControl runat="server" ID="DynamicControl" Mode="Edit" OnInit="DynamicControl_Init" CssClass="col-xs-10 col-sm-5" />
            </div>
        </div>
    </ItemTemplate>
</asp:EntityTemplate>
