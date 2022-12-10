<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCodeMasterEdit.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.CodeMaster.UserControl.ucCodeMasterEdit" %>

<MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="CodeMasterId" DefaultMode="Edit" ItemType="MAT.App.General.CodeMaster.CodeMasterViewModel"
    UpdateMethod="fvParent_UpdateItem" SelectMethod="fvParent_GetItem">
    <EditItemTemplate>
        <div class="m-portlet">
            <div class="m-portlet__body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group" runat="server" visible="<%# this.ShowCode %>">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="txtCode" />
                            <div class="col-sm-7">
                                 <Metronic:TextBox ID="txtCode" runat="server" Text='<%# Bind("Code") %>' />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Description" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Edit" DataField="Desc" ID="Description" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Sequence" AssociatedControlID="Sequence" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Edit" DataField="SeqNo" ID="Sequence" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Data Information User Control --%>
        <MAT:DataInformation runat="server" TableName='CodeMaster' PrimaryKeyName='CodeMasterId' PrimaryKeyValue='<%# Eval("CodeMasterId") %>' />
    </EditItemTemplate>
</MAT:FormView>