<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.HolidayCalendar.Edit" %>

<%@ Register Src="~/Administration/General/HolidayCalendar/UserControl/ucHoliday.ascx" TagPrefix="UserControl" TagName="ucHoliday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Edit" CommandName="Update"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="HolidayCalendarId" ItemType="MAT.App.General.HolidayCalendar.HolidayCalendarViewModel"
        SelectMethod="fvParent_GetItem" UpdateMethod="fvParent_UpdateItem" DefaultMode="Edit">
        <EditItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Name" ID="Name" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Description" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Edit" DataField="Description" ID="Description" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">

                                <div class="col-sm-7">
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">

                                <div class="col-sm-7">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <UserControl:ucHoliday ID="ucHoliday" HolidayCalendarID="<%# Item.HolidayCalendarId %>" runat="server"
                    DataSet='<%# Bind("HolidayList") %>' Mode="Edit" />
            </div>
            <%-- Holidays Grid View & Modal Pop Up--%>


            <%-- Data Information --%>
            <MAT:DataInformation runat="server" ID="ucDataInformation" TableName="[HolidayCalendar]" PrimaryKeyName="[HolidayCalendarId]"
                PrimaryKeyValue="<%# Item.HolidayCalendarId %>" />
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
