<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHoliday.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.HolidayCalendar.UserControl.ucHoliday" %>
<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <span class="m-portlet__head-icon m--hide">
                <i class="la la-gear"></i>
            </span>
            <h3 class="m-portlet__head-text">
                <MAT:Literal runat="server" Text="Holidays"></MAT:Literal>
            </h3>
        </div>
    </div>
</div>
<div class="m-portlet__body">
    <div class="row">
        <div class="table-responsive">
            <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" ShowKeywordSearch="false"
                ShowFilterButton="false" EncloseRowDiv="false" OnAddClick="PopAdd_Click">
            </Metronic:SearchPanel>

            <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.HolidayCalendar.Holiday.HolidayViewModel" DataKeyNames="HolidayId"
                SelectMethod="GridView1_Get" AutoGenerateColumns="false" AllowSorting="false">
                <Columns>
                    <%-- View Button --%>
                    <MAT:TemplateField>
                        <ItemTemplate>
                            <div class="action-buttons">
                                <MAT:LinkButton ID="HyperLink1" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-search-plus bigger-130" CausesValidation="false"
                                    FunctionAccessControlCode="Edit" OnClick="HyperLink1_Click" CommandArgument='<%# Eval("HolidayId") %>'></MAT:LinkButton>
                            </div>
                        </ItemTemplate>
                    </MAT:TemplateField>

                    <%-- Name holidays,StartDate and EndDate --%>
                    <MAT:BoundField DataField="HolidayName" HeaderText="Name" SortExpression="HolidayName" />
                    <MAT:BoundField DataField="HolidayDescription" HeaderText="Description" SortExpression="HolidayDescription" />
                    <MAT:BoundField DataField="StartD" HeaderText="StartDate" SortExpression="StartD" DataFormatString="{0:dd/MM/yyyy}" />
                    <MAT:BoundField DataField="EndD" HeaderText="EndDate" SortExpression="EndD" DataFormatString="{0:dd/MM/yyyy}" />

                </Columns>
            </Metronic:GridView>

        </div>
    </div>
</div>

<%-- Modal Pop Up Edit OR insert--%>
<div class="modal fade" id="modalform" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <MAT:Literal ID="lblTitle" runat="server" />
                </h5>
                <button type="button" class="close" runat="server" id="btnCancel" onserverclick="btnCancel_ServerClick" causesvalidation="false">&times;</button>
            </div>
            <div class="modal-body">
                <MAT:FormView ID="fv_Modal" runat="server" RenderOuterTable="false" DataKeyNames="HolidayId" ItemType="MAT.App.General.HolidayCalendar.Holiday.HolidayViewModel"
                    SelectMethod="fv_Modal_Get"
                    UpdateMethod="fv_HolidayCalendar_UpdateItem" OnItemUpdating="fv_HolidayCalendar_ItemUpdating"
                    InsertMethod="fv_HolidayCalendar_InsertItem" OnItemInserting="fv_HolidayCalendar_ItemInserting"
                    DeleteMethod="fv_HolidayCalendar_DeleteItem">
                    <EditItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label3" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="name" Text="Name" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="name" runat="server" DataField="HolidayName" Mode="Edit" ValidationGroup="EditHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label4" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="description" Text="Description" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="description" runat="server" DataField="HolidayDescription" Mode="Edit" ValidationGroup="EditHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label1" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="sd" Text="StartDate" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="sd" runat="server" DataField="StartD" Mode="Edit" ValidationGroup="EditHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label2" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="ed" Text="EndDate" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="ed" runat="server" DataField="EndD" Mode="Edit" ValidationGroup="EditHoliday" />
                                    </div>
                                </div>
                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-12">
                                        <div class="clearfix">
                                            <div class="pull-right tableTools-container">
                                                <Metronic:LinkButton ID="btnDelete" runat="server" SkinID="ButtonDelete" CommandName="Delete" CausesValidation="false"
                                                    OnClientClick="return confirm('Are you sure?');" />
                                                <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Update" ValidationGroup="EditHoliday"></Metronic:LinkButton>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label3" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="name" Text="Name" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="name" runat="server" DataField="HolidayName" Mode="Insert" ValidationGroup="AddHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label4" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="description" Text="Description" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="description" runat="server" DataField="HolidayDescription" Mode="Insert" ValidationGroup="AddHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label1" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="sd" Text="StartDate" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="sd" runat="server" DataField="StartD" Mode="Insert" ValidationGroup="AddHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label2" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="ed" Text="EndDate" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="ed" runat="server" DataField="EndD" Mode="Insert" ValidationGroup="AddHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-12">
                                        <div class="clearfix">
                                            <div class="pull-right tableTools-container">
                                                <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Insert" ValidationGroup="AddHoliday"></Metronic:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                </MAT:FormView>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
