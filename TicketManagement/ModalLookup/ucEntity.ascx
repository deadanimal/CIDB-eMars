<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucEntity.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.ModalLookup.ucEntity" %>

<%@ Register Src="~/TicketManagement/WebControls/ucAutoCompleteSearch.ascx" TagPrefix="MAT" TagName="ucAutoCompleteSearch" %>

<MAT:ucAutoCompleteSearch runat="server" ID="ucAutoCompleteSearch" SearchType="Entity" OnSearchClick="ucAutoCompleteSearch_SearchClick" />

<asp:Panel ID="modalPanel" runat="server" CssClass="modal fade" TabIndex="-1">
    <div class="modal-dialog" style="max-width: 1024px;">
        <asp:UpdatePanel ID="upForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="smaller lighter blue no-margin">
                            <MAT:Literal ID="Title" runat="server" Text="Search"></MAT:Literal></h3>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <Metronic:SearchPanel ID="SearchPanel" runat="server" AssociatedGridViewId="gvEntityList" ShowAddButton="false" ShowExportCvsButton="false" ShowExportPdfButton="false" ShowPrintPreviewButton="false">
                            <SearchTemplate>
                                <div class="m-portlet">
                                    <div class="m-portlet__body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code" />
                                                    <div class="col-sm-7">
                                                        <Metronic:TextBox runat="server" ID="Code"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Name" />
                                                    <div class="col-sm-7">
                                                        <Metronic:TextBox runat="server" ID="Name"></Metronic:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group m-form__group mat-form-group">
                                                    <MAT:Label runat="server" SkinID="FormLabel" Text="EntityGroup" AssociatedControlID="EntityGroup" />
                                                    <div class="col-sm-7">
                                                        <Metronic:DropDownList runat="server" ID="EntityGroup" DataValueField="Key" DataTextField="Value" SelectMethod="EntityGroup_Get"></Metronic:DropDownList>
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
                                    </div>
                                </div>
                            </SearchTemplate>
                        </Metronic:SearchPanel>
                        <div class="table-responsive">
                            <Metronic:GridView ID="gvEntityList" runat="server" ItemType="MAT.App.Scorecard.TicketManagement.Search.ModalLookup.EntityModel" DataKeyNames="EntityId" SelectMethod="gvList_Get" AutoGenerateColumns="false">
                                <Columns>
                                    <MAT:TemplateField ItemStyle-Width="20px">
                                        <ItemTemplate>
                                            <div class="action-buttons">
                                                <MAT:LinkButton ID="lbSelect" runat="server" CssClass="blue" FrontIconCss="ace-icon fa fa-hand-o-right bigger-130"
                                                    CommandArgument='<%# Item.EntityId %>' OnClick="lbSelect_Click" CausesValidation="false"></MAT:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </MAT:TemplateField>
                                    <MAT:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                                    <MAT:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <MAT:EnumBoundField DataField="EntGroup" HeaderText="EntityGroup" SortExpression="EntGroup" EnumName="MAT.App.General.Entity.EntityGroup" />
                                </Columns>
                            </Metronic:GridView>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Panel>
