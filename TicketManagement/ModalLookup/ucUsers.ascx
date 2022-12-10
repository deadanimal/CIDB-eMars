<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucUsers.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.ModalLookup.ucUsers" %>

<%@ Register Src="~/TicketManagement/WebControls/ucAutoCompleteSearch.ascx" TagPrefix="UserControl" TagName="ucAutoCompleteSearch" %>
<%@ Register Src="~/TicketManagement/ModalLookup/ucEntity.ascx" TagPrefix="UserControl" TagName="ucEntity" %>

<UserControl:ucAutoCompleteSearch runat="server" ID="ucAutoCompleteSearch" SearchType="User" OnSearchClick="ucAutoCompleteSearch_SearchClick" />

<asp:Panel runat="server" ID="modalPanel" CssClass="modal fade" TabIndex="-1">
    <div class="modal-dialog" style="max-width: 1024px;">
        <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal ID="Title" runat="server" Text="Search"></MAT:Literal></h3>
                        <button id="btnModalClose" type="button" class="close" runat="server" causesvalidation="false" onserverclick="btnModalClose_ServerClick" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvUserList" ShowAddButton="false" ShowExportCvsButton="false" ShowExportPdfButton="false" ShowPrintPreviewButton="false">
                            <SearchTemplate>
                                <div class="m-portlet">
                                    <div class="m-portlet__body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <%--<div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="EmployeeNo" AssociatedControlID="EmployeeNo" />
                                                    <div class="col-sm-7">
                                                        <Metronic:TextBox ID="EmployeeNo" runat="server"></Metronic:TextBox>
                                                    </div>
                                                </div>--%>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="EntityGroup" AssociatedControlID="UserGroup" />
                                                    <div class="col-sm-7">
                                                        <Metronic:DropDownList ID="UserGroup" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="UserGroup_Get"></Metronic:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name" />
                                                    <div class="col-sm-7">
                                                        <Metronic:TextBox ID="Name" runat="server"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Entity" AssociatedControlID="ucEntity" />
                                                    <div class="col-sm-7">
                                                        <UserControl:ucEntity runat="server" ID="ucEntity" ShowModalSearch="true" IsRequired="true" />
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
                            <Metronic:GridView ID="gvUserList" runat="server" ItemType="MAT.App.Employee.EmployeeViewModel" DataKeyNames="UserId" SelectMethod="gvUserList_Get" AutoGenerateColumns="false">
                                <Columns>
                                    <MAT:TemplateField ItemStyle-Width="20px">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <MAT:LinkButton ID="lbSelect" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-hand-o-right bigger-130"
                                                    CommandArgument='<%# Item.UserId %>' OnClick="lbSelect_Click" CausesValidation="false"></MAT:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </MAT:TemplateField>
                                    <%--<MAT:BoundField DataField="EmployeeNo" HeaderText="Code" SortExpression="EmployeeNo" />--%>
                                    <MAT:BoundField DataField="DisplayName" HeaderText="Name" SortExpression="DisplayName" />
                                    <MAT:EnumBoundField DataField="UserGroup" HeaderText="UserGroup" SortExpression="UserGroup"
                                        EnumName="MAT.App.Security.User.UserGroup" />
                                    <MAT:BoundField DataField="Department" HeaderText="Entity" SortExpression="Department" />
                                </Columns>
                            </Metronic:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Panel>
