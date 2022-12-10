<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucClone.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.HolidayCalendar.UserControl.ucClone" %>

<Metronic:LinkButton ID="btnClone" runat="server" CssClass="btn btn-info m-btn m-btn--custom m-btn--icon" FrontIconCss="fa fa-files-o padding_right_1" Text="Clone"
    CausesValidation="false" OnClick="btnClone_Click">
</Metronic:LinkButton>

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
                <MAT:FormView ID="fv_Modal" runat="server" RenderOuterTable="false" DataKeyNames="HolidayId" ItemType="MAT.App.General.HolidayCalendar.HolidayCalendarViewModel"
                    SelectMethod="fv_Modal_Get" InsertMethod="fv_HolidayCalendar_InsertItem">
                    <InsertItemTemplate>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label3" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="name" Text="Name" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="name" runat="server" DataField="Name" Mode="Insert" ValidationGroup="AddCloneHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <MAT:Label ID="Label4" runat="server" CssClass="col-sm-12 control-label no-padding-right" AssociatedControlID="description" Text="Description" SkinID="FormLabel"></MAT:Label>
                                    <div class="col-sm-7">
                                        <asp:DynamicControl ID="description" runat="server" DataField="Description" Mode="Insert" ValidationGroup="AddCloneHoliday" />
                                    </div>
                                </div>

                                <div class="form-group m-form__group mat-form-group">
                                    <div class="col-sm-12">
                                        <div class="clearfix">
                                            <div class="pull-right tableTools-container">
                                                <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Insert" ValidationGroup="AddCloneHoliday"></Metronic:LinkButton>
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
