<%@ Page Language="C#" MasterPageFile="~/PopupSite.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Document.DocumentManagement.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="m-portlet">
        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <span class="m-portlet__head-icon m--hide"><i class="la la-gear"></i></span>
                    <h3 class="m-portlet__head-text">Add Document/Form
                    </h3>
                </div>
            </div>
        </div>
        <div class="m-portlet__body">
            <div class="row">
                <div class="col-12">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Attachment" AssociatedControlID="uploadedFile"></MAT:Label>
                        <div class="col-sm-8">
                            <div class="custom-file">
                                <asp:FileUpload ID="uploadedFile" runat="server" CssClass="custom-file-input mat-input-required" />
                                <asp:Label runat="server" ID="lb" AssociatedControlID="uploadedFile" Text="Choose file" CssClass="custom-file-label"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvUpload" runat="server" ControlToValidate="uploadedFile" ValidationGroup="ucAttachmentInsert"
                                    Display="Dynamic" CssClass="reqField" ErrorMessage="test"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Category" AssociatedControlID="ddlDocumentType"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:DropDownList ID="ddlDocumentType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddlDocumentType_Get" Mandatory="true">
                            </Metronic:DropDownList>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="txtDescription"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" ValidationGroup="ucAttachmentInsert"
                                Text='<%# Bind("Comment") %>'></Metronic:TextBox>
                        </div>
                    </div>

                    <div class="m-form__actions">
                        <Metronic:LinkButton ID="btnUpload" CausesValidation="true" ValidationGroup="ucAttachmentInsert" runat="server" Text="Upload" OnClick="btnUpload_Click" />

                        <%--   <button type="reset" class="btn btn-accent">
                    Submit
                </button>
                <button type="reset" class="btn btn-secondary">
                    Cancel
                </button>--%>
                    </div>
                </div>
            </div>
        </div>
 
    </div>

</asp:Content>
