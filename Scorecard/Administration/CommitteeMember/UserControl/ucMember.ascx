<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMember.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.Administration.CommitteeMember.UserControl.ucMember" %>

<div class="m-portlet">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <h3 class="m-portlet__head-text">
                    <MAT:Literal runat="server" ID="Title"></MAT:Literal>
                </h3>
            </div>
        </div>
        <div class="m-portlet__head-tools">
            <Metronic:LinkButton runat="server" ID="btnAdd" SkinID="ButtonAdd"
                CausesValidation="false" OnClick="btnAdd_Click"></Metronic:LinkButton>
        </div>
    </div>
    <div class="m-portlet__body">
        <asp:UpdatePanel runat="server" ID="upGrid">
            <ContentTemplate>
                <div class="row" runat="server" visible='<%# MemberType == MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.Member %>'>
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                            <div class="col-sm-8">
                                <Metronic:DropDownList runat="server" ID="Status" DataTextField="Value" DataValueField="Key" SelectMethod="Status_Get"
                                    OnSelectedIndexChanged="Status_SelectedIndexChanged" CausesValidation="false" AutoPostBack="true">
                                </Metronic:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <Metronic:GridView runat="server" ID="gvList" SkinID="Custom" AllowSorting="false"
                    OnRowCommand="gvList_RowCommand" SelectMethod="gvList_Get" OnDataBound="gvList_DataBound"
                    ItemType="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberViewModel">
                    <Columns>
                        <MAT:TemplateField ItemStyle-Width="45px">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <Metronic:LinkButton runat="server" ID="btnSelect" CommandName="Select" FunctionAccessControlCode="Edit" 
                                        SkinID="ButtonViewIcon" CausesValidation="false" CommandArgument='<%# Item.CommitteeMemberId %>'></Metronic:LinkButton>
                                </div>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:BoundField DataField="EffectiveDate" HeaderText="StartDate" DataFormatString="{0:dd/MM/yyyy}"></MAT:BoundField>
                        <MAT:BoundField DataField="EndDate" HeaderText="EndDate" DataFormatString="{0:dd/MM/yyyy}"></MAT:BoundField>
                        <MAT:BoundField DataField="Organization" HeaderText="Organization"></MAT:BoundField>
                        <MAT:TemplateField HeaderText="Salutation">
                            <ItemTemplate>
                                <%# GetSalutation_String(Item.MemberId) %>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:BoundField DataField="Member" HeaderText="Member"></MAT:BoundField>
                        <MAT:EnumBoundField DataField="Status" HeaderText="Status" EnumName="MAT.Enumerate.Status"></MAT:EnumBoundField>
                        <MAT:TemplateField HeaderText="DisplaySequence" Visible="false">
                            <ItemTemplate>
                                <%# Item.SeqNo %>
                            </ItemTemplate>
                        </MAT:TemplateField>
                        <MAT:TemplateField ItemStyle-Width="45px">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <Metronic:LinkButton runat="server" ID="btnDelete" CommandName="Remove" FunctionAccessControlCode="Delete" SkinID="ButtonDeleteIcon"
                                        OnClientClick="sweetConfirm(this, true);return false;" CausesValidation="false" CommandArgument='<%# Item.CommitteeMemberId %>'></Metronic:LinkButton>
                                </div>
                            </ItemTemplate>
                        </MAT:TemplateField>
                    </Columns>
                </Metronic:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>

<div class="modal fade" id="modalForm" runat="server" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <asp:UpdatePanel runat="server" ID="upForm">
            <ContentTemplate>

                <MAT:FormView runat="server" ID="fvParent" RenderOuterTable="false" DefaultMode="Insert"
                    SelectMethod="fvParent_SelectItem" InsertMethod="fvParent_InsertItem" UpdateMethod="fvParent_UpdateItem"
                    ItemType="MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberViewModel">
                    <InsertItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Add</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="StartDate" AssociatedControlID="StartDate"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="StartDate" SkinID="DatePicker"
                                                    Text='<%# BindItem.EffectiveDate %>' Mandatory="true" ValidationGroup='<%# ValidationGroup %>'></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Organization" AssociatedControlID="Organization"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="Organization" SelectMethod="Organization_Get"
                                                    OnSelectedIndexChanged="Organization_SelectedIndexChanged" AutoPostBack="true"
                                                    DataTextField="Value" DataValueField="Key" Text='<%# BindItem.OrganizationEId %>'
                                                    Mandatory="true" ValidationGroup='<%# ValidationGroup %>'>
                                                </Metronic:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Member" AssociatedControlID="Member"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="Member" DataTextField="Value" DataValueField="Key"
                                                    OnSelectedIndexChanged="Member_SelectedIndexChanged" AutoPostBack="true"
                                                    Mandatory="true" ValidationGroup='<%# ValidationGroup %>'>
                                                </Metronic:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="Status" DataTextField="Value" DataValueField="Key"
                                                    Text='<%# BindItem.Status %>' SelectMethod="Status_Get" Mandatory="true" ValidationGroup='<%# ValidationGroup %>'>
                                                </Metronic:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Salutation" AssociatedControlID="Salutation"></MAT:Label>
                                            <div class="col-sm-8">
                                                <MAT:Label runat="server" ID="Salutation" SkinID="FormValue"></MAT:Label>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group" runat="server"
                                            visible='<%# MemberType == MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.Member %>'>
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="SequenceNo" AssociatedControlID="SeqNo"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="SeqNo" Text='<%# BindItem.SeqNo %>'
                                                    ValidationGroup='<%# ValidationGroup  %>'></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave"
                                        CommandName="Insert" ValidationGroup='<%# ValidationGroup %>'></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <EditItemTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="smaller lighter blue no-margin">Edit</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="StartDate" AssociatedControlID="StartDate"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="StartDate" SkinID="DatePicker" Text='<%# Item.EffectiveDate.ToShortDateString() %>' 
                                                    Mandatory="true" ValidationGroup='<%# ValidationGroup %>'></Metronic:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Organization" AssociatedControlID="Organization"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="Organization" SelectMethod="Organization_Get"
                                                    DataTextField="Value" DataValueField="Key" Text='<%# Item.OrganizationEId %>' Visible="false">
                                                </Metronic:DropDownList>
                                                <MAT:Label runat="server" SkinID="FormValue" Text='<%# GetOrganizationNameById(Item.OrganizationEId) %>'></MAT:Label>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Member" AssociatedControlID="Member"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="Member" DataTextField="Value" DataValueField="Key"
                                                    Text='<%# Item.MemberId %>' Visible="false">
                                                </Metronic:DropDownList>
                                                <MAT:Label runat="server" SkinID="FormValue" Text='<%# GetDisplayNameByMemberId(Item.MemberId) %>'></MAT:Label>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Status" AssociatedControlID="Status"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:DropDownList runat="server" ID="Status" DataTextField="Value" DataValueField="Key"
                                                    Text='<%# BindItem.Status %>' SelectMethod="Status_Get" Mandatory="true" ValidationGroup='<%# ValidationGroup %>'>
                                                </Metronic:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group">
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="Salutation" AssociatedControlID="Salutation"></MAT:Label>
                                            <div class="col-sm-8">
                                                <MAT:Label runat="server" ID="Salutation" SkinID="FormValue" Text='<%# GetSalutation_String(Item.MemberId) %>'></MAT:Label>
                                            </div>
                                        </div>
                                        <div class="form-group m-form__group mat-form-group" runat="server"
                                            visible='<%# MemberType == MAT.App.Scorecard.Scorecard.Administration.CommitteeMember.MemberType.Member %>'>
                                            <MAT:Label runat="server" SkinID="FormLabel" Text="SequenceNo" AssociatedControlID="SeqNo"></MAT:Label>
                                            <div class="col-sm-8">
                                                <Metronic:TextBox runat="server" ID="SeqNo" Text='<%# BindItem.SeqNo %>'
                                                    ValidationGroup='<%# ValidationGroup %>'></Metronic:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="pull-right">
                                    <Metronic:FormViewButton runat="server" ID="btnSave" SkinID="ButtonSave"
                                        CommandName="Update" ValidationGroup='<%# ValidationGroup %>'></Metronic:FormViewButton>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                </MAT:FormView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
