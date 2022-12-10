<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDealerBySalesPerson.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.ModalLookup.ucDealerBySalesPerson" %>
<%@ Register Src="~/TicketManagement/WebControls/ucAutoCompleteSearch.ascx" TagPrefix="MAT" TagName="ucAutoCompleteSearch" %>

<MAT:ucAutoCompleteSearch runat="server" ID="ucAutoCompleteSearch" SearchType="DealerBySalesPerson" OnSearchClick="ucAutoCompleteSearch_SearchClick" OnTextChanged="ucAutoCompleteSearch_TextChanged" />
<asp:Panel runat="server" ID="modalPanel" CssClass="modal fade" TabIndex="-1">
    <div class="modal-dialog" style="max-width: 1024px;">
        <asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal runat="server" ID="Title" Text="Search"></MAT:Literal>
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <Metronic:SearchPanel runat="server" ID="SearchPanel" AssociatedGridViewId="gvList" AddNavigateUrl="Add.aspx"
                            ShowAddButton="false" ShowExportCvsButton="false" ShowExportPdfButton="false" ShowPrintPreviewButton="false">
                            <SearchTemplate>
                                <div class="m-portlet">
                                    <div class="m-portlet__body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code"></MAT:Label>
                                                    <div class="col-sm-7">
                                                        <Metronic:TextBox runat="server" ID="Code"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name"></MAT:Label>
                                                    <div class="col-sm-7">
                                                        <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                                    </div>
                                                </div>
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
                        <div class="table-responsive">
                            <Metronic:GridView runat="server" ID="gvList" ItemType="MAT.App.Scorecard.TicketManagement.Search.ModalLookup.EntityModel"
                                DataKeyNames="EntityId" SelectMethod="gvList_Get" AutoGenerateColumns="false" OnPageIndexChanged="gvList_PageIndexChanged">
                                <Columns>
                                    <MAT:TemplateField ItemStyle-Width="20px">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <MAT:LinkButton runat="server" ID="lbSelect" CssClass="blue" FrontIconCss="ace-icon fa fa-hand-o-right bigger-130"
                                                    CommandArgument='<%# Item.EntityId %>' OnClick="lbSelect_Click" CausesValidation="false"></MAT:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </MAT:TemplateField>
                                    <MAT:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                                    <MAT:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <MAT:BoundField DataField="EntitySalesPerson" HeaderText="SalesPerson" SortExpression="EntitySalesPerson" />
                                </Columns>
                            </Metronic:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="SearchPanel" EventName="SearchClick" />--%>
                <asp:AsyncPostBackTrigger ControlID="ucAutoCompleteSearch" EventName="SearchClick" />
                <asp:AsyncPostBackTrigger ControlID="ucAutoCompleteSearch" EventName="TextChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Panel>
