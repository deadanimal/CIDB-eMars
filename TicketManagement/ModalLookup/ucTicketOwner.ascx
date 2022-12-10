<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTicketOwner.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.ModalLookup.ucTicketOwner" %>

<%@ Register Src="~/TicketManagement/WebControls/ucAutoCompleteSearch.ascx" TagPrefix="MAT" TagName="ucAutoCompleteSearch" %>

<MAT:ucAutoCompleteSearch runat="server" ID="ucAutoCompleteSearch" SearchType="TicketOwner" OnSearchClick="ucAutoCompleteSearch_SearchClick" OnTextChanged="ucAutoCompleteSearch_TextChanged" />

<asp:Panel runat="server" ID="modalPanel" CssClass="modal fade" TabIndex="-1">
    <div class="modal-dialog" style="max-width: 1024px;">
        <asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal runat="server" ID="Title" Text="Search"></MAT:Literal>
                        </h3>
                        <button runat="server" id="btnModalClose" type="button" class="close" causesvalidation="false" onserverclick="btnModalClose_ServerClick" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvUserList" ShowAddButton="false"
                            ShowExportCvsButton="false" ShowExportPdfButton="false" ShowPrintPreviewButton="false">
                            <SearchTemplate>
                                <div class="m-portlet">
                                    <div class="m-portlet__body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <%--<div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="EmployeeNo" AssociatedControlID="EmployeeNo"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="EmployeeNo"></Metronic:TextBox>
                                                    </div>
                                                </div>--%>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Entity" AssociatedControlID="Department"></MAT:Label>
                                                    <div class="col-sm-8">
                                                        <Metronic:DropDownList runat="server" ID="Department" DataValueField="Key" DataTextField="Value" SelectMethod="Department_Get"></Metronic:DropDownList>
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
                        <div class="table-responsive">
                            <Metronic:GridView runat="server" ID="gvUserList" ItemType="MAT.App.Employee.EmployeeViewModel" DataKeyNames="UserId" SelectMethod="gvUserList_Get">
                                <Columns>
                                    <MAT:TemplateField ItemStyle-Width="20px">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <MAT:LinkButton runat="server" ID="lbSelect" CssClass="blue" FrontIconCss="ace-icon fa fa-hand-o-right bigger-130" CommandArgument='<%# Item.UserId %>' OnClick="lbSelect_Click" CausesValidation="false"></MAT:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </MAT:TemplateField>
                                    <%--<MAT:BoundField DataField="EmployeeNo" HeaderText="Code" SortExpression="EmployeeNo"></MAT:BoundField>--%>
                                    <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName"></MAT:BoundField>
                                    <MAT:BoundField DataField="Department" HeaderText="Entity" SortExpression="Department"></MAT:BoundField>
                                </Columns>
                            </Metronic:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Panel>
