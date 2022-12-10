<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.HolidayCalendar.View" %>

<%@ Register Src="~/Administration/General/HolidayCalendar/UserControl/ucHoliday.ascx" TagPrefix="UserControl" TagName="ucHoliday" %>
<%@ Register Src="~/Administration/General/HolidayCalendar/UserControl/ucClone.ascx" TagPrefix="UserControl" TagName="ucClone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">

    <UserControl:ucClone ID="ucClone" runat="server" Visible="true" OnGetCurrentClick="ucClone_GetCurrentClick" />
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" AssociatedFormViewId="fvParent" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="HolidayCalendarId" DefaultMode="ReadOnly" ItemType="MAT.App.General.HolidayCalendar.HolidayCalendarViewModel"
        SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Name" ID="Name" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Description" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Description" ID="Description" />
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
                <UserControl:ucHoliday ID="ucHoliday" HolidayCalendarID="<%# Item.HolidayCalendarId %>" runat="server" DataSet='<%# Bind("HolidayList") %>' Mode="ReadOnly" ReadOnly="true" />
            </div>
            <%-- Holiday Grid View & Modal Pop Up--%>

            <%-- Date Created and Modifyed  --%>
            <MAT:DataInformation runat="server" ID="ucDataInformation" TableName="[HolidayCalendar]" PrimaryKeyName="[HolidayCalendarId]"
                PrimaryKeyValue="<%# Item.HolidayCalendarId %>" />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
