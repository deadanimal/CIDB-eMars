<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.UnitMaster.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton runat="server" ID="btnEdit" SkinID="ButtonEdit" FunctionAccessControlCode="Edit"></Metronic:LinkButton>
    <Metronic:FormViewButton runat="server" ID="btnDelete" SkinID="ButtonDelete" AssociatedFormViewId="fvParent" CommandName="Delete"></Metronic:FormViewButton>
    <Metronic:LinkButton runat="server" ID="btnBack" CausesValidation="false" SkinID="ButtonBack" PostBackUrl="Index.aspx"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="ReadOnly" ItemType="MAT.App.Scorecard.DbModels.ScorecardUnit" SelectMethod="fvParent_SelectItem" DeleteMethod="fvParent_DeleteItem" DataKeyNames="ScorecardUnitId">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Name" Text='<%# Item.Name %>' ReadOnly="true" Enabled="false"></Metronic:TextBox>
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="MeasureType"></MAT:Label>                                
                                <div class="col-sm-8">
                                    <Metronic:DropDownList runat="server" ID="MeasureType" SelectMethod="MeasureType_Get" DataTextField="Value" DataValueField="Key" Text='<%# Item.MeasureType %>' Enabled="false"></Metronic:DropDownList>
                                </div>
                            </div>                            
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="SeqNo"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="SeqNo" Text='<%# Item.SeqNo %>' TextMode="Number" ReadOnly="true" Enabled="false"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
