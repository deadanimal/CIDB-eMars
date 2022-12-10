<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.Salutation.View" %>

<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" SkinID="ButtonEdit" FunctionAccessControlCode="Edit"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" AssociatedFormViewId="fvParent" CommandName="Delete"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DataKeyNames="CodeMasterId" DefaultMode="ReadOnly" ItemType="MAT.App.Scorecard.Scorecard.Administration.Salutation.SalutationViewModel"
        SelectMethod="fvParent_SelectItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <MAT:Label runat="server" SkinID="FormValue" ID="Name" Text='<%# Item.Description %>'></MAT:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <UserControl:ucDataInformation runat="server" id="ucDataInformation" TableName="CodeMaster" PrimaryKeyName="CodeMasterId" PrimaryKeyValue='<%# Item.CodeMasterId %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
