<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCurrencyConversionRate.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.UserControl.ucCurrencyConversionRate" %>

<asp:UpdatePanel ID="upExchangeRate" runat="server" UpdateMode="Conditional">
    <ContentTemplate>

        <div class="m-portlet">
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">
                                <MAT:Literal runat="server" Text="ExchangeRate"></MAT:Literal>
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div class="table-responsive">
                        <Metronic:GridView ID="GridView1" runat="server" ItemType="MAT.App.General.CurrencyConversionRate.CurrencyConversionRateViewModel" DataKeyNames="ForeignCurrencyId"
                            SelectMethod="GridView1_Get" AutoGenerateColumns="false" AllowSorting="false" SkinID="pagelessGridView" OnDataBound="GridView1_DataBound">
                            <Columns>
                                <%-- View Button --%>
                                <MAT:TemplateField ItemStyle-Width="25px">
                                    <ItemTemplate>
                                        <Metronic:LinkButton ID="btnView" runat="server" SkinID="ButtonViewIcon"
                                            FunctionAccessControlCode="Edit" OnClick="btnView_Click"></Metronic:LinkButton>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <%-- Unit Column --%>
                                <MAT:TemplateField HeaderText="ForeignCurrency" SortExpression="ForeignCurrencyCode">
                                    <ItemTemplate>
                                        <MAT:Label ID="lbl_CurrencyUnit" runat="server" Text='<%# string.Format("{0} {1} {2}", Item.Units, Item.ForeignCurrencyCode, Item.ForeignCurrencyName) %>' />
                                        <span class="pull-right" style="vertical-align: middle; text-align: center;">=</span>
                                    </ItemTemplate>
                                </MAT:TemplateField>
                                <%-- Conversion Rate --%>
                                <MAT:TemplateField HeaderText="ExchangeRate" SortExpression="ConversionRate">
                                    <ItemTemplate>
                                        <MAT:Label ID="lbl_Unit_2" runat="server" Text="<%# Item.ConversionRate %>" />
                                    </ItemTemplate>
                                </MAT:TemplateField>
                            </Columns>
                        </Metronic:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%-- Modal Pop Up --%>
        <div class="modal fade" id="modalform" runat="server" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            <MAT:Literal runat="server" Text="ExchangeRate" />
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <MAT:FormView ID="fv_Modal" runat="server" ItemType="MAT.App.General.CurrencyConversionRate.CurrencyConversionRateViewModel"
                        DataKeyNames="ForeignCurrencyId" SelectMethod="fv_Modal_Get" DefaultMode="Edit" UpdateMethod="fv_Modal_UpdateItem">
                        <EditItemTemplate>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" AssociatedControlID="dc_fc" Text="ForeignCurrency" SkinID="FormLabel" />
                                            <div class="col-sm-3">
                                                <asp:DynamicControl ID="dc_fc" runat="server" Mode="Edit" DataField="Units" />
                                            </div>
                                            <div class="col-sm-4" style="padding-top: 0.65rem; padding-left: 0px;">
                                                <%# string.Format("{0} {1}", Item.ForeignCurrencyCode, Item.ForeignCurrencyName)%>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="dc_fc_rate" Text="ExchangeRate"></MAT:Label>
                                            <div class="col-sm-7">
                                                <asp:DynamicControl ID="dc_fc_rate" runat="server" DataField="ConversionRate" Mode="Edit" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" CommandName="Update"></Metronic:FormViewButton>
                            </div>
                        </EditItemTemplate>
                    </MAT:FormView>
                </div>
            </div>
        </div>

    </ContentTemplate>
</asp:UpdatePanel>
