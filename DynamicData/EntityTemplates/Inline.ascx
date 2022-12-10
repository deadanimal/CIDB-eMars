<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Inline.ascx.cs" Inherits="MAT.WebApp.App.Inline" %>
<asp:EntityTemplate runat="server" ID="EntityTemplate1">
    <ItemTemplate>
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" OnInit="Label_Init" CssClass="col-sm-3 control-label no-padding-right" />

            <div class="col-sm-9">
                <p class="form-control-static">
                    <asp:DynamicControl runat="server" ID="DynamicControl" OnInit="DynamicControl_Init" />
                </p>
            </div>
        </div>
    </ItemTemplate>
</asp:EntityTemplate>

