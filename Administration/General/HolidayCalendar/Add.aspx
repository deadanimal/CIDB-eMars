<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.HolidayCalendar.Add" %>

<%@ Register Src="~/Administration/General/HolidayCalendar/UserControl/ucHoliday.ascx" TagPrefix="UserControl" TagName="ucHoliday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert" ValidationGroup="AddSave"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" CausesValidation="false" OnClick="btnBack_Click"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row form-horizontal" role="form">
        <div class="col-sm-6 col-xs-12">
        </div>
    </div>

    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="HolidayCalendarId" ItemType="MAT.App.General.HolidayCalendar.HolidayCalendarViewModel"
        InsertMethod="fvParent_InsertItem" DefaultMode="Insert">
        <InsertItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" Text="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Name" ID="name" ValidationGroup="AddSave" />
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" Text="Description" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Description" ID="description" ValidationGroup="AddSave" />
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
                <%-- Holidays Grid View & Modal Pop Up--%>
                <UserControl:ucHoliday ID="ucHoliday" runat="server" DataSet='<%# Bind("HolidayList") %>' Mode="Insert" />
            </div>
        </InsertItemTemplate>
    </MAT:FormView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
