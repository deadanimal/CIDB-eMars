<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.Add" %>

<%@ Register Src="~/TicketManagement/ModalLookup/ucEntity.ascx" TagPrefix="UserControl" TagName="ucEntity" %>
<%@ Register Src="~/TicketManagement/ModalLookup/ucTicketAssignUser.ascx" TagPrefix="UserControl" TagName="ucTicketAssignUser" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucTicketCategory.ascx" TagPrefix="UserControl" TagName="ucTicketCategory" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucCustomFields.ascx" TagPrefix="UserControl" TagName="ucCustomFields" %>
<%@ Register Src="~/TicketManagement/Ticket/UserControls/ucAttachment.ascx" TagPrefix="UserControl" TagName="ucAttachment" %>
<%@ Register Src="~/TicketManagement/ModalLookup/ucTicketOwner.ascx" TagPrefix="UserControl" TagName="ucTicketOwner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnAction" SkinID="ButtonSave" AssociatedFormViewId="fvParent" 
        OnClientClick="ClearLocalStorage();" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server" ID="upPanel" UpdateMode="Conditional">
        <ContentTemplate>
            <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="TicketId" DefaultMode="Insert" ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketViewModel"
                InsertMethod="fvParent_InsertItem" OnItemCreated="fvParent_ItemCreated">
                <InsertItemTemplate>
                    <div class="m-portlet">
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Category" AssociatedControlID="ucTicketCategory" />
                                        <div class="col-sm-7">
                                            <UserControl:ucTicketCategory ID="ucTicketCategory" runat="server" IsRequired="true" Value='<%# Bind("TicketCategoryCId") %>' />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Entity" AssociatedControlID="lblEntity" />
                                        <div class="col-sm-7">
                                            <asp:UpdatePanel ID="upEntity" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Label ID="lblEntity" runat="server" SkinID="FormValue"></asp:Label>
                                                    <asp:HiddenField ID="hfEntity" runat="server" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ucTicketOwner" EventName="TextChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Subject" AssociatedControlID="Subject" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="Subject" Mandatory="true" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Description" AssociatedControlID="Description" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="Description" TextMode="MultiLine" Rows="5" Width="100%" data-offline="true" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="KPIRef" AssociatedControlID="KPIRef"></MAT:Label>
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList runat="server" ID="KPIRef" DataTextField="Value" DataValueField="Key" Mandatory="true"
                                                SelectMethod="KPIRef_GetData" OnSelectedIndexChanged="KPIRef_SelectedIndexChanged" AutoPostBack="true"></Metronic:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="IssueOwner" AssociatedControlID="ucTicketOwner" />
                                        <div class="col-sm-7">
                                            <UserControl:ucTicketOwner ID="ucTicketOwner" runat="server" IsRequired="true"
                                                Value='<%# Bind("TicketOwnerUId") %>' OnTextChanged="ucTicketOwner_TextChanged" />
                                            <asp:Label ID="ltTicketOwner" runat="server" SkinID="FormValue"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Priority" AssociatedControlID="Priority" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList runat="server" ID="Priority" Mandatory="true" DataTextField="Key" DataValueField="Value" Width="100%" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="IncidentDate" AssociatedControlID="IncidentDate" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="IncidentDate" SkinID="DatePicker" Mandatory="true" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="IncidentTime" AssociatedControlID="IncidentTime" />
                                        <div class="col-sm-7 timepicker">
                                            <Metronic:TextBox runat="server" ID="IncidentTime" SkinID="TimePicker" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="DueDate" AssociatedControlID="DueDate" />
                                        <div class="col-sm-7">
                                            <Metronic:TextBox runat="server" ID="DueDate" SkinID="DatePicker" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upAssignment" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="m-portlet">
                                <div class="m-portlet__head">
                                    <div class="m-portlet__head-caption">
                                        <div class="m-portlet__head-title">
                                            <h3 class="m-portlet__head-text">
                                                <MAT:Literal runat="server" Text="Assignment"></MAT:Literal>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-portlet__body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="AssignTo" AssociatedControlID="ucAssignTo" />
                                                <div class="col-sm-7">
                                                    <UserControl:ucTicketAssignUser ID="ucAssignTo" runat="server" IsRequired="true" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group m-form__group mat-form-group">
                                                <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status" />
                                                <div class="col-sm-7">
                                                    <Metronic:DropDownList ID="Status" runat="server" DataTextField="Value" DataValueField="Key" SelectMethod="Status_Get" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </InsertItemTemplate>
            </MAT:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <UserControl:ucAttachment runat="server" ID="ucAttachment" Mode="Insert" Title="Attachments" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
