<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucActiveDirectoryUser.ascx.cs" Inherits="MAT.WebApp.App.Administration.Security.User.UserControl.ucActiveDirectoryUser" %>

<div id="modalform" runat="server" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" runat="server" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false">&times;</button>
                <h4 class="blue bigger">
                    <MAT:Literal runat="server" Text="ActiveDirectoryUser" />
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <Metronic:SearchPanel ID="ucSearchPanel" runat="server" AssociatedGridViewId="gvActiveDirectoryUser" ShowAddButton="false" ShowExportCvsButton="false"
                        ShowExportPdfButton="false" ShowFilterButton="false" ShowPrintPreviewButton="false">
                    </Metronic:SearchPanel>
                </div>
                <div class="table-responsive">
                    <Metronic:GridView ID="gvActiveDirectoryUser" runat="server" SelectMethod="gvActiveDirectoryUser_GetData" ItemType="MAT.App.Security.User.ActiveDirectoryUserViewModel"
                        OnRowCommand="gvActiveDirectoryUser_RowCommand" OnSelectedIndexChanged="gvActiveDirectoryUser_SelectedIndexChanged" DataKeyNames="LogonName,FirstName,LastName,Email">
                        <Columns>
                            <MAT:ButtonField ButtonType="Link" CommandName="Select" DataTextField="LogonName" HeaderText="LogonName" SortExpression="LogonName" />
                            <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName" />
                        </Columns>
                    </Metronic:GridView>
                </div>
            </div>

            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
