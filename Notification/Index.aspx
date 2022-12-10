<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Notification.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-bottom: 10px">
        <Metronic:LinkButton ID="btnDeleteAll" OnClick="btnDeleteAll_Click" runat="server" OnClientClick="sweetConfirm(this, true);return false;" CssClass="btn btn-danger m-btn m-btn--custom m-btn--icon" FrontIconCss="fa fa-trash-o padding_right_1" Text="Delete All" />
        <Metronic:LinkButton ID="btnDeleteSelected" OnClick="btnDeleteSelected_Click" runat="server" OnClientClick="sweetConfirm(this, true);return false;" SkinID="ButtonDelete" Text="Delete Selected" />
    </div>
    <div class="table-responsive">

        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.Notification.NotificationItemViewModel" DataKeyNames="NotificationId,NotificationStatus"
            SelectMethod="GridView1_GetData" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_DataBound">
            <Columns>
                <MAT:TemplateField HeaderStyle-Width="20px" ItemStyle-Width="20px">
                    <HeaderTemplate>
                        <Metronic:CheckBox runat="server" ID="cbAll" onclick="metronicCheckAll(this); " />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <Metronic:CheckBox ID="chkDeleteSelected" runat="server" />
                    </ItemTemplate>
                </MAT:TemplateField>

                <MAT:BoundField ItemStyle-HorizontalAlign="Left" HeaderText="NotificationDateTime" DataFormatString="{0:dd/MM/yyyy HH:mm}" DataField="CreatedDate"
                    SortExpression="CreatedDate"/>
                <MAT:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Message" SortExpression="Message">
                    <ItemTemplate>
                        <span id="unreadicon" runat="server"><i class="m--font-primary fa fa-envelope"></i></span><span id="readicon" runat="server"><i class="m--font-primary fa fa-envelope-open-o"></i></span>
                        <MAT:LinkButton ID="LinkButton3" runat="server" CssClass="blue" Text='<%# Item.Message %>'
                            CommandName="Read" CommandArgument='<%# Item.NotificationId %>'></MAT:LinkButton>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField HeaderText="NotificationType" SortExpression="NotificationType">
                    <ItemTemplate>
                        <%# MAT.Helper.EnumHelper.GetText(Eval("NotificationType").ToString()) %>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:TemplateField ItemStyle-Width="20px" ItemStyle-HorizontalAlign="Right">
                    <ItemTemplate>
                        <Metronic:LinkButton ID="btnDelete" runat="server" SkinID="ButtonDeleteIcon" CommandName="Del"
                            OnClientClick="sweetConfirm(this, true);return false;" CommandArgument='<%# Item.NotificationId %>'></Metronic:LinkButton>
                    </ItemTemplate>
                </MAT:TemplateField>

            </Columns>
        </Metronic:GridView>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
