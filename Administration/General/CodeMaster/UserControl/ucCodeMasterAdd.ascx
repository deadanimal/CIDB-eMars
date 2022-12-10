<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCodeMasterAdd.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.CodeMaster.UserControl.ucCodeMasterAdd" %>

<MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="CodeMasterId" DefaultMode="Insert"
    ItemType="MAT.App.General.CodeMaster.CodeMasterViewModel" InsertMethod="fvParent_InsertItem">
    <InsertItemTemplate>
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
                                <asp:DynamicControl runat="server" Mode="Insert" DataField="Desc" ID="Description" />
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Sequence" AssociatedControlID="Sequence" />
                            <div class="col-sm-7">
                                <asp:DynamicControl runat="server" Mode="Insert" DataField="SeqNo" ID="Sequence" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </InsertItemTemplate>
</MAT:FormView>
