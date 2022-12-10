<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Scorecard.PerformanceScorecard.UnitMaster.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TreeView runat="server" ID="tv" OnSelectedNodeChanged="tv_SelectedNodeChanged">
        <SelectedNodeStyle BackColor="Yellow" Font-Bold="true" Font-Underline="true" />
    </asp:TreeView>

    <Metronic:SearchPanel runat="server" ID="SearchPanel" AddNavigateUrl="Add.aspx">
        <SearchTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Name"></MAT:Label>
                                <div class="col-sm-8">
                                    <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                </div>
                            </div>
                        </div>                        
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-12">
                                    <div class="pull-right">
                                        <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" OnClick="btnSearch_Click"></Metronic:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </SearchTemplate>
    </Metronic:SearchPanel>

    <Metronic:GridView runat="server" ID="gvList" SelectMethod="gvList_Get" ItemType="MAT.App.Scorecard.DbModels.ScorecardUnit" DataKeyNames="ScorecardUnitId">
        <Columns>
            <MAT:TemplateField ItemStyle-Width="20px">
                <ItemTemplate>
                    <Metronic:LinkButton runat="server" ID="lb" SkinID="ButtonFreeLink" Text="Select" FunctionAccessControlCode="View" PostBackUrl='<%# string.Format("View.aspx?id={0}", Item.ScorecardUnitId) %>'></Metronic:LinkButton>
                </ItemTemplate>
            </MAT:TemplateField>
            <MAT:BoundField DataField="Name" HeaderText="Name"></MAT:BoundField>
            <MAT:EnumBoundField DataField="MeasureType" HeaderText="MeasureType" EnumName="MAT.App.Scorecard.Enumerate.ScorecardUnit"></MAT:EnumBoundField>
            <MAT:BoundField DataField="SeqNo" HeaderText="SeqNo"></MAT:BoundField>            
        </Columns>
    </Metronic:GridView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
