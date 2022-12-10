<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.CommitteeMember.View" %>

<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>
<%@ Register Src="~/Scorecard/Administration/CommitteeMember/UserControl/ucMember.ascx" TagPrefix="UserControl" TagName="ucMember" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" SkinID="ButtonEdit" CausesValidation="false" FunctionAccessControlCode="Edit"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" CausesValidation="false"
        AssociatedFormViewId="fvParent" CommandName="Delete" FunctionAccessControlCode="Delete"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="ReadOnly" 
        ItemType="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.CommitteeViewModel" 
        DataKeyNames="CommitteeId" SelectMethod="fvParent_SelectItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                        <div class="col-sm-8">
                            <MAT:Label runat="server" ID="Code" SkinID="FormValue" Text='<%# Item.Code %>'></MAT:Label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                        <div class="col-sm-8">
                            <MAT:Label runat="server" ID="Name" SkinID="FormValue" Text='<%# Item.Name %>'></MAT:Label>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <UserControl:ucMember runat="server" ID="ucCP" CommitteeId='<%# Item.CommitteeId %>' ReadOnly="true" 
                MemberType='<%# MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.Chairman %>' ValidationGroup="Chairperson" />
            <UserControl:ucMember runat="server" ID="ucDCP" CommitteeId='<%# Item.CommitteeId %>' ReadOnly="true"
                MemberType='<%# MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.DeputyChairman %>' ValidationGroup="DeputyChairperson" />
            <UserControl:ucMember runat="server" ID="ucM" CommitteeId='<%# Item.CommitteeId %>' ReadOnly="true"
                MemberType='<%# MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.Member %>' ValidationGroup="Member" />
            <UserControl:ucDataInformation runat="server" ID="ucDataInformation" TableName="Committee" 
                PrimaryKeyName="CommitteeId" PrimaryKeyValue='<%# Item.CommitteeId %>' />
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
