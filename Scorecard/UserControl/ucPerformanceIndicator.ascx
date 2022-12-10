<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucPerformanceIndicator.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.UserControl.ucPerformanceIndicator" %>

<%@ Register Src="~/WebControls/ColorPicker.ascx" TagPrefix="UserControl" TagName="ColorPicker" %>

<asp:UpdatePanel runat="server" ID="upDisplay">
    <ContentTemplate>
        <div class="row">
            <div class="col-md-6">
                <Metronic:LinkButton runat="server" ID="HigherTheBetter" SkinID="ButtonFreeLink" Text="+ Indicator" 
                    OnClick="HigherTheBetter_Click" CausesValidation="false"></Metronic:LinkButton>
                &nbsp;|&nbsp;
        <Metronic:LinkButton runat="server" ID="LowerTheBetter" SkinID="ButtonFreeLink" Text="- Indicator" 
            OnClick="LowerTheBetter_Click" CausesValidation="false"></Metronic:LinkButton>
            </div>
            <div class="col-md-6">
                <div class="pull-right">
                    <Metronic:LinkButton runat="server" ID="btnAdd" SkinID="ButtonAddIcon" FunctionAccessControlCode="Create"
                        CausesValidation="false" OnClick="btnAdd_Click" ShowLoader="false"></Metronic:LinkButton>
                </div>
            </div>
        </div>
        <Metronic:GridView runat="server" ID="gvPerformanceIndicator" SkinID="Custom" SelectMethod="gvPerformanceIndicator_Get"
            OnDataBound="gvPerformanceIndicator_DataBound" OnRowCommand="gvPerformanceIndicator_RowCommand"
            ItemType="MAT.App.Scorecard.Scorecard.Shared.PerformanceIndicatorViewModel">
            <Columns>
                <MAT:TemplateField ItemStyle-Width="45px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <Metronic:LinkButton runat="server" ID="btnSelect" CommandName="Select" FunctionAccessControlCode="Edit" SkinID="ButtonViewIcon"
                                CausesValidation="false" CommandArgument='<%# Item.ScorecardAchievementIndicatorId %>'></Metronic:LinkButton>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:BoundField DataField="From" HeaderText="From"></MAT:BoundField>
                <MAT:BoundField DataField="To" HeaderText="To"></MAT:BoundField>
                <MAT:TemplateField HeaderText="Color">
                    <ItemTemplate>
                        <UserControl:ColorPicker runat="server" ID="cp" Text='<%# Item.ColorCode %>' ReadOnly="true" Mandatory="false" />
                    </ItemTemplate>
                </MAT:TemplateField>
                <MAT:EnumBoundField HeaderText="ScoreType" DataField="ScoreType" EnumName="MAT.App.Scorecard.Enumerate.ScoreType"></MAT:EnumBoundField>
                <MAT:TemplateField ItemStyle-Width="45px">
                    <ItemTemplate>
                        <div class="action-buttons">
                            <Metronic:LinkButton runat="server" ID="btnDelete" CommandName="Remove" FunctionAccessControlCode="Edit" SkinID="ButtonDeleteIcon"
                                OnClientClick="sweetConfirm(this, true);return false;" CausesValidation="false" CommandArgument='<%# Item.ScorecardAchievementIndicatorId %>'></Metronic:LinkButton>
                        </div>
                    </ItemTemplate>
                </MAT:TemplateField>
            </Columns>
        </Metronic:GridView>
    </ContentTemplate>
</asp:UpdatePanel>

<div class="modal fade" id="modalForm" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upForm">
            <ContentTemplate>

                <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Insert"
                    SelectMethod="fvParent_SelectItem" UpdateMethod="fvParent_UpdateItem" InsertMethod="fvParent_InsertItem"
                    ItemType="MAT.App.Scorecard.Scorecard.Shared.PerformanceIndicatorViewModel">
                    <InsertItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Add Performance Indicator</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="From" AssociatedControlID="From"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="From" Text='<%# BindItem.From %>' TextMode="Number"
                                                    Mandatory="true" ValidationGroup="PerformanceIndicator"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="To" AssociatedControlID="To"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="To" Text='<%# BindItem.To %>' TextMode="Number"
                                                    Mandatory="true" ValidationGroup="PerformanceIndicator"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="ColorCode" AssociatedControlID="ColorCode"></MAT:Label>
                                            <div class="col-sm-8">
                                                <UserControl:ColorPicker runat="server" ID="ColorCode" Text='<%# BindItem.ColorCode %>'
                                                    Mandatory="true" ValidationGroup="PerformanceIndicator" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave"
                                        ValidationGroup="PerformanceIndicator" CommandName="Insert"></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>

                    <EditItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Edit Performance Indicator</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="From" AssociatedControlID="From"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="From" Text='<%# BindItem.From %>' TextMode="Number"
                                                    Mandatory="true" ValidationGroup="PerformanceIndicator"></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="To" AssociatedControlID="To"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="To" Text='<%# BindItem.To %>'
                                                    Mandatory="true" ValidationGroup="PerformanceIndicator"></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="ColorCode" AssociatedControlID="ColorCode"></MAT:Label>
                                            <div class="col-sm-8">
                                                <UserControl:ColorPicker runat="server" ID="ColorCode" Text='<%# BindItem.ColorCode %>'
                                                    Mandatory="true" ValidationGroup="PerformanceIndicator" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnUpdate" SkinID="ButtonFreeText" Text="Update"
                                        CommandName="Update" ValidationGroup="PerformanceIndicator"></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                </MAT:FormView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
