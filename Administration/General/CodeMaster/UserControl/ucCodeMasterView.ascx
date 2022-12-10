<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCodeMasterView.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.CodeMaster.UserControl.ucCodeMasterView" %>

<MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="CodeMasterId" DefaultMode="ReadOnly"
    ItemType="MAT.App.General.CodeMaster.CodeMasterViewModel" SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
    <ItemTemplate>
        <div class="m-portlet">
            <div class="m-portlet__body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group" runat="server" visible="<%# this.ShowCode %>">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Code" AssociatedControlID="Code" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Code" ID="Code" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Name" AssociatedControlID="Description" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Desc" ID="Description" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Sequence" AssociatedControlID="Sequence" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="SeqNo" ID="Sequence" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Data Information User Control --%>
        <MAT:DataInformation runat="server" TableName='[CodeMaster]' PrimaryKeyName='[CodeMasterId]' PrimaryKeyValue='<%# Eval("CodeMasterId") %>' />
    </ItemTemplate>
</MAT:FormView>
