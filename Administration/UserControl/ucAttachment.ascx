<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAttachment.ascx.cs" Inherits="MAT.WebApp.App.Administration.UserControl.ucAttachment" %>
<div class="m-dropzone dropzone m-dropzone--primary dz-clickable"
    action='<%# ResolveUrl("~/Handlers/FileUpload.ashx?type=1&uid=" + MAT.Context.Profile.UserId.ToString() + "&ownerTable=" + this.OwnerTable + "&ownerId=" + this.OwnerId + "&path=" + System.Web.HttpUtility.UrlEncode("Upload/Attachment")) %>'
    id="dzuploadattachment" style='<%# this.ReadOnly ? "display: none;": "" %>'>
    <div class="m-dropzone__msg dz-message needsclick">
        <h3 class="m-dropzone__msg-title">Drop files here or click to upload.
        </h3>
    </div>
</div>

<asp:UpdatePanel ID="upAttachment" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <ul class="ace-thumbnails clearfix">
            <Metronic:GridView ID="gvList" runat="server" ItemType="MAT.App.General.Attachment.AttachmentViewModel" DataKeyNames="AttachmentId"
                SelectMethod="gvList_Select" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <MAT:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:LinkButton ID="btnDelete" runat="server" CssClass="red" FrontIconCss="ace-icon fa fa-trash-o bigger-130"
                                    FunctionAccessControlCode="Delete" CommandName="MyDelete" CommandArgument='<%# Item.AttachmentId %>'
                                    OnClientClick="sweetConfirm(this, true);return false;" CausesValidation="false"></MAT:LinkButton>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:TemplateField HeaderText="FileName" SortExpression="FileName">
                        <ItemTemplate>
                            <asp:HyperLink Text='<%# Eval("FileName") %>' runat="server" NavigateUrl='<%# "~/Handlers/FileDownload.ashx?id=" + Item.AttachmentId.ToString() %>'></asp:HyperLink>
                        </ItemTemplate>
                    </MAT:TemplateField>
                </Columns>
            </Metronic:GridView>
        </ul>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnUpload" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
<asp:LinkButton ID="btnUpload" runat="server" OnClick="btnUpload_Click"></asp:LinkButton>