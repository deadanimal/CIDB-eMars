<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.PerformanceScorecard.Add" %>

<%@ Register Src="~/WebControls/ColorPicker.ascx" TagPrefix="UserControl" TagName="ColorPicker" %>
<%@ Register Src="~/Workflow/UserControl/ucWorkflowSubmission.ascx" TagPrefix="UserControl" TagName="ucWorkflowSubmission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .rbl table {
            display: inline;
        }

        .rbl tbody {
            display: inline;
        }

        .rbl tr {
            display: inline;
        }

        .rbl td {
            display: inline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" FunctionAccessControlCode="Create" CommandName="Insert" CausesValidation="true"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" SkinID="ButtonBack" CausesValidation="false" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="form-group m-form__group mat-form-group">
                <div class="col-sm-6">
                    <Metronic:DropDownList runat="server" ID="ddlStatus" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" CausesValidation="false">
                        <asp:ListItem Text="Create New" Value="1" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Clone From" Value="2"></asp:ListItem>
                    </Metronic:DropDownList>
                </div>
                <div class="col-sm-6">
                    <Metronic:DropDownList runat="server" ID="ddlPerformanceScorecard" SelectMethod="Scorecard_Get" DataTextField="Value" DataValueField="Key" Visible="false"
                        OnSelectedIndexChanged="ddlPerformanceScorecard_SelectedIndexChanged" AutoPostBack="true" CausesValidation="false">
                    </Metronic:DropDownList>
                </div>
            </div>
        </div>
    </div>
    <br />
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Insert" ItemType="MAT.App.Scorecard.DbModels.Scorecard" InsertMethod="fvParent_InsertItem">
        <InsertItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Code" MaxLength="50" Text='<%# Bind("Code") %>' Mandatory="true"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Name" MaxLength="200" Text='<%# Bind("Name") %>' Mandatory="true"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Frequency" AssociatedControlID="ddlFrequency"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="ddlFrequency" SelectMethod="Frequency_Get" DataTextField="Value" DataValueField="Key" Mandatory="true"></Metronic:DropDownList>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Period" AssociatedControlID="StartDate"></MAT:Label>
                                <div class="col-sm-8">
                                    <div class="input-daterange input-group">
                                        <Metronic:TextBox runat="server" ID="StartDate" SkinID="DatePicker" Text='<%# Bind("StartDate") %>' Mandatory="true"></Metronic:TextBox>
                                        <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="la la-ellipsis-h"></i>
                                            </span>
                                        </div>
                                        <Metronic:TextBox runat="server" ID="EndDate" SkinID="DatePicker" Text='<%# Bind("EndDate") %>' Mandatory="true"></Metronic:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Objective" AssociatedControlID="Objective"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Objective" TextMode="MultiLine" Rows="3" MaxLength="2000" Text='<%# Bind("Objectives") %>'></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
