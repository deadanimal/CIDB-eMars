<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.CommitteeMember.Edit" %>

<%@ Register Src="~/Administration/UserControl/ucDataInformation.ascx" TagPrefix="UserControl" TagName="ucDataInformation" %>
<%@ Register Src="~/Scorecard/Administration/CommitteeMember/UserControl/ucMember.ascx" TagPrefix="UserControl" TagName="ucMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton runat="server" ID="btnSave_fv" SkinID="ButtonSave" AssociatedFormViewId="fvParent"
        FunctionAccessControlCode="Edit" CommandName="Update" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Edit"
        ItemType="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.CommitteeViewModel"
        SelectMethod="fv_SelectItem" UpdateMethod="fv_UpdateItem" DataKeyNames="CommitteeId">
        <EditItemTemplate>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="Code" Text='<%# BindItem.Code %>'></Metronic:TextBox>
                            <%--<MAT:Label runat="server" ID="Code" SkinID="FormValue" Text='<%# Item.Code %>'></MAT:Label>--%>
                        </div>
                    </div>
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:DropDownList runat="server" ID="Status" SelectMethod="Status_Get"
                                DataTextField="Value" DataValueField="Key" Text='<%# BindItem.Status %>'>
                            </Metronic:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group m-form__group mat-form-group">
                        <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="txtName"></MAT:Label>
                        <div class="col-sm-8">
                            <Metronic:TextBox runat="server" ID="txtName" Text='<%# BindItem.Name %>'></Metronic:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <UserControl:ucMember runat="server" ID="ucChairperson" CommitteeId='<%# Item.CommitteeId %>' ReadOnly="false"
                MemberType='<%# MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.Chairman %>' ValidationGroup="Chairperson" />
            <UserControl:ucMember runat="server" ID="ucDeputyChairperson" CommitteeId='<%# Item.CommitteeId %>' ReadOnly="false"
                MemberType='<%# MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.DeputyChairman %>' ValidationGroup="DeputyChairperson" />
            <UserControl:ucMember runat="server" ID="ucMember" CommitteeId='<%# Item.CommitteeId %>' ReadOnly="false"
                MemberType='<%# MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.Member %>' ValidationGroup="Member" />
            <UserControl:ucDataInformation runat="server" ID="ucDataInformation" TableName="Committee" PrimaryKeyName="CommitteeId"
                PrimaryKeyValue='<%# Item.CommitteeId %>' />
        </EditItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
