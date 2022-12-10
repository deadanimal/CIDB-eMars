<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAttachment.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucAttachment" %>

<asp:UpdatePanel runat="server" UpdateMode="Conditional">
    <Triggers>
        <asp:PostBackTrigger ControlID="btnUpload" />
    </Triggers>
</asp:UpdatePanel>


<div class="m-portlet">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                    <MAT:Literal runat="server" ID="ltTitle" Text="Attachment"></MAT:Literal>
                </h3>
            </div>
        </div>
    </div>
    <div class="m-portlet__body">
        <div class="form-horizontal" role="form" id="uploadPanel" runat="server">
            <div class="col-md-12">
                <div class="form-group m-form__group mat-form-group">
                    <div class="col-sm-8" style="display: inline">
                        <div class="custom-file">
                            <asp:FileUpload ID="FileUpload" runat="server" CssClass="custom-file-input mat-input-required" />
                            <asp:Label runat="server" ID="lb" AssociatedControlID="FileUpload" Text="Choose file" CssClass="custom-file-label"></asp:Label>
                        </div>
                    </div>
                    <div class="col-sm-4" style="display: inline">
                        <Metronic:LinkButton ID="btnUpload" runat="server" SkinID="ButtonUpload" CausesValidation="false" OnClick="btnUpload_Click" OnClientClick="return isFileSelected()"></Metronic:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="table-responsive">
            <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.Attachment.AttachmentViewModel" DataKeyNames="AttachmentId" SelectMethod="GridView1_GetData" OnRowCommand="GridView1_RowCommand" SkinID="Custom">
                <Columns>
                    <MAT:TemplateField ItemStyle-Width="30px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:LinkButton ID="btnDelete" runat="server" CssClass="red" FrontIconCss="ace-icon fa fa-trash-o bigger-130"
                                    FunctionAccessControlCode="Delete" CommandName="MyDelete" CommandArgument='<%# Item.AttachmentId %>'
                                    OnClientClick="sweetConfirm(this, true);return false;" Visible="<%# !ReadOnly %>" CausesValidation="false"></MAT:LinkButton>
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
            </Metronic:GridView>
        </div>
        <div>
            <small><i>Each file is limited to a maximum size of 5MB & up 5 files.</i></small>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        //$('.common-uploader').ace_file_input({
        //    no_file: 'Choose file to upload',
        //    maxSize: (5120 * 1024), //5 MB = (5120 * 1024) Bytes
        //}).on('file.error.ace', function (event, info) {
        //    //info.file_count > number of files selected
        //    //info.invalid_count > number of invalid files

        //    if (info.error_count['size'] > 0) {
        //        $.gritter.add({
        //            title: 'Exceed maximum file size',
        //            text: 'File size cannot more than 5MB.',
        //            class_name: 'gritter-error gritter-center',
        //            time: 2000
        //        });
        //    }
        //});;
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
