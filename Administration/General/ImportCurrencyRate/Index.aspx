<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.ImportCurrencyRate.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="m-portlet">
        <div class="m-portlet__body">
            <asp:UpdatePanel ID="upParent" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="GridView1" AddNavigateUrl="Add.aspx">
                        <SearchTemplate>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" AssociatedControlID="BaseCurrency" Text="BaseCurrency" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <Metronic:DropDownList ID="BaseCurrency" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="BaseCurrency_Get"></Metronic:DropDownList>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" AssociatedControlID="DateFrom" Text="Date" SkinID="FormLabel" />
                                        <div class="col-sm-7">
                                            <div class="input-daterange input-group">
                                                <Metronic:TextBox ID="DateFrom" runat="server" name="start"></Metronic:TextBox>
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <i class="la la-ellipsis-h"></i>
                                                    </span>
                                                </div>
                                                <Metronic:TextBox ID="DateTo" runat="server" name="end"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <div class="col-sm-12">
                                            <div class="pull-right">
                                                <Metronic:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearch" CausesValidation="false" OnClick="btnSearch_Click"></Metronic:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </SearchTemplate>
                    </Metronic:SearchPanel>

                    <div class="table-responsive">
                        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.CurrencyRate.CurrencyRateViewModel" DataKeyNames="CurrencyRateId" SelectMethod="GridView1_Get"
                            AutoGenerateColumns="false">
                            <Columns>
                                <MAT:TemplateField ItemStyle-Width="25px">
                                    <ItemTemplate>
                                        <Metronic:LinkButton ID="btnView" runat="server" SkinID="ButtonViewIcon"
                                            CommandArgument='<%# Item.CurrencyRateId %>' OnClick="btnView_Click"></Metronic:LinkButton>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <MAT:BoundField DataField="EffectiveDate" HeaderText="EffectiveDate" SortExpression="EffectiveDate" DataFormatString="{0:dd/MM/yyyy}" />
                                <MAT:TemplateField HeaderText="BaseCurrency" SortExpression="BaseCurrencyCode">
                                    <ItemTemplate>
                                        <%# string.Format("{0} {1}", Eval("BaseCurrencyCode"), Eval("BaseCurrencyName")) %>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                            </Columns>
                            <PagerStyle CssClass="m-datatable__pager" />
                        </Metronic:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
