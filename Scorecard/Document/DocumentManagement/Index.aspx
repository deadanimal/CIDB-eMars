<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Document.DocumentManagement.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
     <asp:Button ID="hidBtnAdd" runat="server" Text="Hidden Upload Button" CausesValidation="false" Style="visibility: hidden;" OnClick="hidBtnAdd_Click"/>
    <Metronic:LinkButton ID="btnEmail" runat="server" Text="Email" CausesValidation="false" OnClick="btnEmail_Click" SkinID="ButtonFreeText" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvList" 
        OnAddClick="btnAdd_Click" ShowAddButton="true">
        <SearchTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Category" AssociatedControlID="ddlDocumentType"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList ID="ddlDocumentType" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="ddlDocumentType_Get"></Metronic:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Document Name" AssociatedControlID="txtDocumentName"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="txtDocumentName"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-12">
                                    <div class="pull-right">
                                        <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" OnClick="btnSearch_Click"></Metronic:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </SearchTemplate>
    </Metronic:SearchPanel>

    <Metronic:GridView ID="gvList" runat="server" ItemType="MAT.App.Scorecard.Scorecard.Document.DocumentManagement.DocumentManagementViewModel"
        DataKeyNames="AttachmentID" SelectMethod="gvList_Get" OnRowCommand="gvList_RowCommand">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <Metronic:CheckBox ID="chkSelect" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField SortExpression="FileName" HeaderText="Document Name">
                <ItemTemplate>
                    <asp:LinkButton ID="lbFileName" runat="server" Text='<%# Eval("FileName") %>'
                        CausesValidation="false" CommandName="Download" CommandArgument='<%# Item.AttachmentID %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Category" DataField="CategoryDesc" SortExpression="CategoryDesc" />
            <asp:BoundField DataField="Comment" HeaderText="Description" SortExpression="Comment" HtmlEncode="False" />
            <asp:BoundField HeaderText="Uploaded By" DataField="CreatedByName" SortExpression="CreatedByName" />
            <asp:BoundField HeaderText="Uploaded Date" DataField="CreatedDate" SortExpression="CreatedDate" DataFormatString="{0:dd/MM/yyyy}" />            
            <asp:TemplateField ItemStyle-Width="45px">
                <ItemTemplate>
                    <div class="action-buttons">
                        <Metronic:LinkButton ID="btnDelete" runat="server" CommandName="Remove" FunctionAccessControlCode="Delete" SkinID="ButtonDeleteIcon"
                            OnClientClick="sweetConfirm(this, true);return false;" CausesValidation="false" CommandArgument='<%# Item.AttachmentID %>'></Metronic:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>        
        </Columns>
    </Metronic:GridView>

    <div class="modal fade" id="modalform" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <MAT:Literal ID="ltTitle" runat="server" Text="Compose email"></MAT:Literal>
                    </h5>
                    <button type="button" class="close" runat="server" id="btnClose" onserverclick="btnModelClose_ServerClick" causesvalidation="false">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group row">
                                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Recipient(s)" />
                                <div class="col-sm-9">
                                    <Metronic:TextBox ID="txtEmails" Mandatory="true" ValidationGroup="Email" runat="server" />
                                    <small id="emailHelp" class="form-text text-muted">Use a semicolon ';' as the delimiter between email addresses.</small>
                                </div>
                            </div>
                            <div class="form-group row">
                                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Subject" />
                                <div class="col-sm-9">
                                    <Metronic:TextBox ID="txtEmailSubject" runat="server" Mandatory="true" ValidationGroup="Email" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Attachment(s)" />
                                <div class="col-sm-9">
                                    <asp:Literal ID="ltAttachments" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="form-group row">
                                <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="Message" />
                                <div class="col-sm-9">
                                    <Metronic:TextBox ID="txtMessage" Mandatory="true" ValidationGroup="Email" runat="server" Mode="Multiline" Rows="10" />
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-12">
                                    <div class="pull-right">
                                        <Metronic:LinkButton ID="btnSendEmail" CausesValidation="true" ValidationGroup="Email" runat="server" Text="Send" OnClick="btnSendEmail_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
