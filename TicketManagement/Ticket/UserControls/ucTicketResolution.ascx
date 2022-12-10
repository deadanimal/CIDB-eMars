<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTicketResolution.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.UserControls.ucTicketResolution" %>


    <asp:UpdatePanel runat="server" ID="upGrid" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="pull-right">
                <Metronic:LinkButton runat="server" ID="btnAdd" SkinID="ButtonAdd" CausesValidation="false" OnClick="btnAdd_Click"></Metronic:LinkButton>
            </div>
                <Metronic:GridView runat="server" ID="gvList" ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketResolutionViewModel" DataKeyNames="TicketResolutionId" SelectMethod="gvList_Get">
                    <Columns>
                        <MAT:TemplateField HeaderText="Resolution">
                            <ItemTemplate>
                                <%# Truncate(Item.Resolution).Replace("\n", "<br/>")  %>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:EnumBoundField DataField="ReviewStatus" HeaderText="ReviewStatus" EnumName="MAT.App.Scorecard.TicketManagement.Ticket.ReviewStatus"></MAT:EnumBoundField>
                        <MAT:BoundField DataField="CreatedDateTime" HeaderText="CreatedDate"></MAT:BoundField>
                        <MAT:BoundField DataField="CreatedByName" HeaderText="CreatedBy"></MAT:BoundField>
                        <MAT:TemplateField ItemStyle-Width="65px">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <Metronic:LinkButton runat="server" ID="btnEdit" ClientIDMode="AutoID" SkinID="ButtonViewIcon" CommandArgument='<%# Eval("TicketResolutionId") %>'
                                        CausesValidation="false" OnClick="btnEdit_Click"></Metronic:LinkButton>
                                    <Metronic:LinkButton runat="server" ID="btnDelete" ClientIDMode="AutoID" SkinID="ButtonDeleteIcon" CommandArgument='<%# Eval("TicketResolutionId") %>'
                                        OnClientClick="sweetConfirm(this, true);return false;" OnClick="btnDelete_Click" CausesValidation="true" Visible='<%# !ReadOnly %>'></Metronic:LinkButton>
                                </div>
                            </ItemTemplate>
                        </MAT:TemplateField>
                    </Columns>
                </Metronic:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="fvParent" EventName="ItemInserted" />
            <asp:AsyncPostBackTrigger ControlID="fvParent" EventName="ItemUpdated" />
        </Triggers>
    </asp:UpdatePanel>
<div class="modal fade" id="modalform" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Edit" DataKeyNames="TicketResolutionId"
                        ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketResolutionViewModel"
                        SelectMethod="fvParent_Select" InsertMethod="fvParent_Insert" UpdateMethod="fvParent_Update"
                        OnItemInserted="fvParent_ItemInserted" OnItemUpdated="fvParent_ItemUpdated">
                        <InsertItemTemplate>
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">
                                    <MAT:Literal ID="ltTitle" runat="server" Text="Add"></MAT:Literal>
                                </h5>
                                <button type="button" class="close" runat="server" id="btnCancel" onserverclick="btnCancel_ServerClick" causesvalidation="false">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="ReviewStatus" AssociatedControlID="ReviewStatus"></MAT:Label>
                                            <div class="col-sm-7">
                                                <asp:DynamicControl ID="ReviewStatus" runat="server" Mode="Insert" DataField="ReviewStatus" ValidationGroup="SaveResolution" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">                                            
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Resolution" AssociatedControlID="Resolution" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl ID="Resolution" runat="server" Mode="Insert" DataField="Resolution" ValidationGroup="SaveResolution" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CausesValidation="true" CommandName="Insert"
                                    ValidationGroup="SaveResolution"></Metronic:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">
                                    <MAT:Literal ID="ltTitle" runat="server" Text="Edit"></MAT:Literal>
                                </h5>
                                <button type="button" class="close" runat="server" id="btnCancel" onserverclick="btnCancel_ServerClick" causesvalidation="false">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="col-md-12">
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="ReviewStatus" AssociatedControlID="ReviewStatus"></MAT:Label>
                                        <div class="col-sm-7">
                                            <asp:DynamicControl runat="server" ID="ReviewStatus" Mode="Edit" DataField="ReviewStatus" ValidationGroup="SaveResolution" />
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group mat-form-group">
                                        <MAT:Label runat="server" SkinID="FormLabel" Text="Resolution" AssociatedControlID="Resolution" />
                                        <div class="col-sm-7">
                                            <asp:DynamicControl ID="Resolution" runat="server" Mode="Insert" DataField="Resolution" ValidationGroup="SaveResolution" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <Metronic:LinkButton ID="btnSave" runat="server" SkinID="ButtonSave" CausesValidation="true" CommandName="Update"
                                    ValidationGroup="SaveResolution"></Metronic:LinkButton>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">
                                    <MAT:Literal ID="ltTitle" runat="server" Text="View"></MAT:Literal>
                                </h5>
                                <button type="button" class="close" runat="server" id="btnCancel" onserverclick="btnCancel_ServerClick" causesvalidation="false">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="ReviewStatus" AssociatedControlID="ReviewStatus"></MAT:Label>
                                            <div class="col-sm-7">
                                                <asp:DynamicControl runat="server" ID="ReviewStatus" Mode="ReadOnly" DataField="ReviewStatus" />
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Resolution" AssociatedControlID="Resolution" />
                                            <div class="col-sm-7">
                                                <asp:DynamicControl ID="Resolution" runat="server" Mode="ReadOnly" DataField="Resolution" ValidationGroup="SaveResolution" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </MAT:FormView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
