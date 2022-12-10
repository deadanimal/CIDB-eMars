<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTicketAssignUser.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.ModalLookup.ucTicketAssignUser" %>

<%@ Register Src="~/TicketManagement/WebControls/ucAutoCompleteSearch.ascx" TagPrefix="MAT" TagName="ucAutoCompleteSearch" %>

<MAT:ucAutoCompleteSearch runat="server" ID="ucAutoCompleteSearch" SearchType="TicketAssignUser" OnSearchClick="ucAutoCompleteSearch_SearchClick" />
<div class="modal fade" id="modalForm" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 1024px;">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="smaller lighter blue no-margin" id="exampleModalLabel">
                    <MAT:Literal runat="server" ID="Title" Text="Search"></MAT:Literal>
                </h3>
                <button runat="server" id="btnModalClose" type="button" class="close" causesvalidation="false" data-dismiss="modal"></button>
            </div>
            <div class="modal-body">

                <div class="m-scrollable mCustomScrollbar _mCS_4 mCS-autoHide" data-scrollbar-shown="true" data-scrollable="true" data-max-height="400" style="max-height: 400px; height: 400px; position: relative; overflow: visible;">
                    <div id="mCSB_4" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0">
                        <div id="mCSB_4_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">

                            <asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvUserList" ShowAddButton="false"
                                        ShowExportCvsButton="false" ShowExportPdfButton="false" ShowPrintPreviewButton="false">
                                        <SearchTemplate>
                                            <div class="m-portlet">
                                                <div class="m-portlet__body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group m-form__group mat-form-group">
                                                                <MAT:Label runat="server" SkinID="FormLabel" Text="EmployeeNo" AssociatedControlID="EmployeeNo"></MAT:Label>
                                                                <div class="col-sm-8">
                                                                    <Metronic:TextBox runat="server" ID="EmployeeNo"></Metronic:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group m-form__group mat-form-group">
                                                                <MAT:Label runat="server" SkinID="FormLabel" Text="EntityGroup" AssociatedControlID="UserGroup"></MAT:Label>
                                                                <div class="col-sm-8">
                                                                    <Metronic:DropDownList runat="server" ID="UserGroup" DataValueField="Key" DataTextField="Value" SelectMethod="UserGroup_Get"></Metronic:DropDownList>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group m-form__group mat-form-group">
                                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                                                <div class="col-sm-8">
                                                                    <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="form-group m-form__group mat-form-group">
                                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Entity" AssociatedControlID="Entity"></MAT:Label>
                                                                <div class="col-sm-8">
                                                                    <Metronic:TextBox runat="server" ID="Entity"></Metronic:TextBox>
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
                                        <Metronic:GridView runat="server" ID="gvUserList" ItemType="MAT.App.Employee.EmployeeViewModel" DataKeyNames="UserId"
                                            SelectMethod="gvUserList_Get" AutoGenerateColumns="false">
                                            <Columns>
                                                <MAT:TemplateField ItemStyle-Width="20px">
                                                    <ItemTemplate>
                                                        <div class="action-buttons">
                                                            <MAT:LinkButton runat="server" ID="lbSelect" CssClass="blue" FrontIconCss="ace-icon fa fa-hand-o-right bigger-130"
                                                                CommandArgument='<%# Item.UserId %>' OnClick="lbSelect_Click" CausesValidation="false"></MAT:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                </MAT:TemplateField>
                                                <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName"></MAT:BoundField>
                                                <MAT:BoundField DataField="UserRole" HeaderText="UserRole" SortExpression="UserRole"></MAT:BoundField>
                                                <MAT:BoundField DataField="Department" HeaderText="Entity" SortExpression="Department"></MAT:BoundField>
                                            </Columns>
                                        </Metronic:GridView>
                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div id="mCSB_4_scrollbar_vertical" class="mCSB_scrollTools mCSB_4_scrollbar mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
                        <div class="mCSB_draggerContainer">
                            <div id="mCSB_4_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 50px; top: 0px; display: block; height: 57px; max-height: 180px;">
                                <div class="mCSB_dragger_bar" style="line-height: 50px;"></div>
                            </div>
                            <div class="mCSB_draggerRail"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
