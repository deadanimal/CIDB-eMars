<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucEmployeeEmploymentHistory.ascx.cs" Inherits="MAT.WebApp.App.Administration.Security.User.UserControl.ucEmployeeEmploymentHistory" %>

<asp:UpdatePanel ID="upList" runat="server" UpdateMode="Conditional">
    <ContentTemplate>

        <div class="m-portlet__head">
            <div class="m-portlet__head-caption">
                <div class="m-portlet__head-title">
                    <span class="m-portlet__head-icon m--hide">
                        <i class="la la-gear"></i>
                    </span>
                    <h3 class="m-portlet__head-text">
                        <MAT:Literal runat="server" Text="EmploymentInfo"></MAT:Literal>
                    </h3>
                </div>
            </div>
        </div>
        <div class="m-portlet__body">
            <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvEmployeeEmploymentHistory" ShowKeywordSearch="false" ShowFilterButton="false" EncloseRowDiv="false"
                OnAddClick="SearchPanel_AddClick">
            </Metronic:SearchPanel>
            <Metronic:GridView ID="gvEmployeeEmploymentHistory" runat="server" ItemType="MAT.App.Employee.EmploymentHistory.EmploymentHistoryViewModel" DataKeyNames="EmployeeEmploymentHistoryId"
                SelectMethod="gvEmployeeEmploymentHistory_GetData" OnRowCommand="gvEmployeeEmploymentHistory_RowCommand">
                <Columns>
                    <MAT:TemplateField ItemStyle-Width="20px">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:LinkButton ID="lbSelect" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130" CausesValidation="false"
                                    FunctionAccessControlCode="Edit" CommandName="MySelect" CommandArgument='<%# Eval("EmployeeEmploymentHistoryId") %>'></MAT:LinkButton>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>
                    <MAT:BoundField DataField="EffectiveDate" HeaderText="EffectiveDate" SortExpression="EffectiveDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <MAT:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                    <MAT:BoundField DataField="UserCategoriesText" HeaderText="UserCategory" SortExpression="UserCategoriesText" />
                    <MAT:BoundField DataField="Supervisor" HeaderText="Supervisor" SortExpression="Supervisor" />

                    <MAT:BoundField DataField="HolidayCalendarName" HeaderText="HolidayCalendar" SortExpression="HolidayCalendarName" />
                    <MAT:BoundField DataField="CostCenter" HeaderText="CostCenter" SortExpression="CostCenter" />
                </Columns>
            </Metronic:GridView>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<%--Add/Edit--%>
<div class="modal fade" id="modalform" runat="server" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            <MAT:Literal ID="lblTitle" runat="server" />
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <MAT:FormView ID="fvEmployeeEmploymentHistory" runat="server" RenderOuterTable="false" DataKeyNames="EmployeeEmploymentHistoryId"
                        ItemType="MAT.App.Employee.EmploymentHistory.EmploymentHistoryViewModel" SelectMethod="fvEmployeeEmploymentHistory_SelectItem"
                        InsertMethod="fvEmployeeEmploymentHistory_InsertItem" UpdateMethod="fvEmployeeEmploymentHistory_UpdateItem"
                        DeleteMethod="fvEmployeeEmploymentHistory_DeleteItem">
                        <InsertItemTemplate>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="EffectiveDate" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Insert" DataField="EffectiveDate" ID="EffectiveDate" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Department" AssociatedControlID="Department" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Insert" DataField="BelongsToEId" ID="Department" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <%--  MultiSelection  --%>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="UserCategory" AssociatedControlID="ms_userCategory" />
                                            <div class="col-sm-7">
                                                <Metronic:MultiSelect runat="server" ID="ms_userCategory" SelectMethod="UserCategory_Get"
                                                    DataValueField="Key" DataTextField="Value" SelectedValues="<%# BindItem.UserCategoriesStr %>" ValidationGroup="EmploymentHistory">
                                                </Metronic:MultiSelect>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Supervisor" AssociatedControlID="Supervisor" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Insert" DataField="SupervisorEmpId" ID="Supervisor" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="HolidayCalendar" AssociatedControlID="HolidayCalendar" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Insert" DataField="HolidayCalendarId" ID="HolidayCalendar" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Currency" AssociatedControlID="Currency" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Insert" DataField="CurrencyId" ID="Currency" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="CostCenter" AssociatedControlID="CostCenter" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Insert" DataField="CostCenterCId" ID="CostCenter" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <div class="col-sm-12">
                                                <div class="pull-right">
                                                    <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Insert" ValidationGroup="EmploymentHistory" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="EffectiveDate" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Edit" DataField="EffectiveDate" ID="EffectiveDate" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Department" AssociatedControlID="Department" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Edit" DataField="BelongsToEId" ID="Department" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <%--  MultiSelection  --%>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="UserCategory" AssociatedControlID="ms_userCategory" />
                                            <div class="col-sm-7">
                                                <Metronic:MultiSelect runat="server" ID="ms_userCategory" SelectMethod="UserCategory_Get"
                                                    DataValueField="Key" DataTextField="Value" SelectedValues="<%# BindItem.UserCategoriesStr %>" ValidationGroup="EmploymentHistory">
                                                </Metronic:MultiSelect>
                                            </div>
                                        </div>

                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Supervisor" AssociatedControlID="Supervisor" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Edit" DataField="SupervisorEmpId" ID="Supervisor" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="HolidayCalendar" AssociatedControlID="HolidayCalendar" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Edit" DataField="HolidayCalendarId" ID="HolidayCalendar" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Currency" AssociatedControlID="Currency" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Edit" DataField="CurrencyId" ID="Currency" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="CostCenter" AssociatedControlID="CostCenter" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="Edit" DataField="CostCenterCId" ID="CostCenter" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="col-sm-12">
                                    <div class="pull-right">
                                        <Metronic:LinkButton ID="btnDelete" runat="server" SkinID="ButtonDelete" CommandName="Delete" CausesValidation="false"
                                            OnClientClick="return confirm('Are you sure?');" />
                                        <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Update" ValidationGroup="EmploymentHistory" />
                                    </div>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="EffectiveDate" AssociatedControlID="EffectiveDate" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="EffectiveDate" ID="EffectiveDate" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Department" AssociatedControlID="Department" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="BelongsToEId" ID="Department" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="UserCategory" AssociatedControlID="UserCategory" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="UserCategoriesText" ID="UserCategory" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Supervisor" AssociatedControlID="Supervisor" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="SupervisorEmpId" ID="Supervisor" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="HolidayCalendar" AssociatedControlID="HolidayCalendar" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="HolidayCalendarId" ID="HolidayCalendar" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Currency" AssociatedControlID="Currency" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="CurrencyId" ID="Currency" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="CostCenter" AssociatedControlID="CostCenter" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="CostCenterCId" ID="CostCenter" ValidationGroup="EmploymentHistory" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </ItemTemplate>
                    </MAT:FormView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
