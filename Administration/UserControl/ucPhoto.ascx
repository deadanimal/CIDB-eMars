<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucPhoto.ascx.cs" Inherits="MAT.WebApp.App.Administration.UserControl.ucPhoto" %>
<div class="m-dropzone dropzone m-dropzone--primary dz-clickable"
    action='<%# ResolveUrl("~/Handlers/FileUpload.ashx?type=2&uid=" + MAT.Context.Profile.UserId.ToString() + "&ownerTable=" + this.OwnerTable + "&ownerId=" + this.OwnerId + "&path=" + System.Web.HttpUtility.UrlEncode("Upload/ProductPhoto")) %>'
    id="dzupload" style='<%# this.ReadOnly ? "display: none;": "" %>'>
    <div class="m-dropzone__msg dz-message needsclick">
        <h3 class="m-dropzone__msg-title">Drop photos here or click to upload.
        </h3>
    </div>
</div>
<asp:UpdatePanel ID="upPhoto" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <ul class="ace-thumbnails clearfix">
            <asp:Repeater ID="rptPhoto" runat="server" SelectMethod="rptPhoto_GetData" ItemType="MAT.App.General.Attachment.AttachmentViewModel">
                <ItemTemplate>
                    <li>
                        <asp:Image runat="server" ImageUrl='<%# "~/Handlers/FileDownload.ashx?id=" + Item.AttachmentId.ToString() %>' Width="150px" />
                        <div class="tools" runat="server" visible='<%# !this.ReadOnly %>'>
                            <asp:LinkButton ID="btnDelete" ClientIDMode="AutoID" runat="server" CssClass="ace-icon fa fa-trash" ToolTip="Delete"
                                CommandArgument='<%# Item.AttachmentId.ToString() %>' OnClick="btnDelete_Click"
                                OnClientClick="sweetConfirm(this, true);return false;"></asp:LinkButton>
                            <asp:LinkButton ID="btnMain" ClientIDMode="AutoID" runat="server" CssClass='<%# Item.IsMain == true ? "ace-icon fa fa-star orange" : "ace-icon fa fa-star-o" %>' ToolTip="Main Photo"
                                CommandArgument='<%# Item.AttachmentId.ToString() %>' OnClick="btnMain_Click"></asp:LinkButton>
                            <asp:LinkButton ID="btnArrowUp" ClientIDMode="AutoID" runat="server" CssClass="ace-icon fa fa-arrow-up" ToolTip="Up"
                                CommandArgument='<%# Item.AttachmentId.ToString() %>' OnClick="btnArrowUp_Click" Visible='<%# Item.IsMain != true %>'></asp:LinkButton>
                            <asp:LinkButton ID="btnArrowDown" ClientIDMode="AutoID" runat="server" CssClass="ace-icon fa fa-arrow-down" ToolTip="Down"
                                CommandArgument='<%# Item.AttachmentId.ToString() %>' OnClick="btnArrowDown_Click" Visible='<%# Item.IsMain != true %>'></asp:LinkButton>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnPhotoUpload" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
<asp:LinkButton ID="btnPhotoUpload" runat="server" OnClick="btnPhotoUpload_Click"></asp:LinkButton>