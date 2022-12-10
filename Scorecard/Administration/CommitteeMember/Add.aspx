<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.CommitteeMember.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave" AssociatedFormViewId="fvParent" CommandName="Insert" CausesValidation="true"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Insert" ItemType="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.CommitteeViewModel"
        InsertMethod="fvParent_InsertItem">
        <InsertItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="txtCode"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtCode" Mandatory="true" Text='<%# BindItem.Code %>'></Metronic:TextBox>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="txtName"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtName" Mandatory="true" Text='<%# BindItem.Name %>'></Metronic:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
