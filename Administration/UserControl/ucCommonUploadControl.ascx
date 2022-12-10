<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCommonUploadControl.ascx.cs" Inherits="MAT.WebApp.App.Administration.UserControl.ucCommonUploadControl" %>

<div class="col-xs-12" runat="server">
    <%-- UserControl Title --%>
    <h4 class="header smaller blue">
        <MAT:Literal ID="ltTitle" runat="server" Text="Attachment"></MAT:Literal>
    </h4>
    <p></p>

    <%-- File Upload Controller --%>
    <div class="form-horizontal" role="form" id="uploadPanel" runat="server" visible='<%# !ReadOnly && MATPage.HasFunctionAccessControl("Create") %>'>
        <div class="col-sm-6 col-xs-12">
            <div class="form-group">
                <div class="col-sm-8">
                    <%-- Using Asp.net File Upload : Multiple Files --%>
                    <%--<asp:FileUpload ID="FileUpload" runat="server" class="common-uploader" AllowMultiple="true"/>--%>
                    <%-- Single File Uploader --%>
                    <asp:FileUpload ID="FileUpload" runat="server" class="common-uploader" />
                </div>
                <div class="col-sm-4">
                    <MAT:LinkButton ID="btnUpload" runat="server" SkinID="ButtonUpload" CausesValidation="false"
                        OnClick="btnUpload_Click" OnClientClick="return isFileSelected()"></MAT:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <%-- GridView --%>
    <div class="col-sm-12 col-xs-12">
        <div class="table-responsive">
            <MAT:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.Attachment.AttachmentViewModel" DataKeyNames="AttachmentId"
                SelectMethod="GridView1_GetData" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <MAT:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:LinkButton ID="btnDelete" runat="server" CssClass="red" FrontIconCss="ace-icon fa fa-trash-o bigger-130"
                                    FunctionAccessControlCode="Delete" CommandName="MyDelete" CommandArgument='<%# Item.AttachmentId %>'
                                    OnClientClick="return confirm('Are you sure?');" Visible="<%# !ReadOnly %>" CausesValidation="false"></MAT:LinkButton>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:TemplateField HeaderText="FileName" SortExpression="FileName">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbFileName" runat="server" Text='<%# Eval("FileName") %>'
                                CausesValidation="false" CommandName="Download" CommandArgument='<%# Item.AttachmentId %>'></asp:LinkButton>
                        </ItemTemplate>
                    </MAT:TemplateField>
                </Columns>
            </MAT:GridView>
        </div>
    </div>
</div>

<%-- Necessary Script to run the File Input --%>
<script>
    $(document).ready(function () {
        $('.common-uploader').ace_file_input({
            no_file: 'Choose file to upload',
            maxSize: (5120 * 1024), //5 MB = (5120 * 1024) Bytes
        });
    });


    //If no file is selected, no postback will occur
    function isFileSelected() {
        var file = $('#<%= FileUpload.ClientID%>').val();
        if (!file) {
            alert('No File is Selected. Select File(s).');
            return false;
        }

        return true;
    }
</script>
