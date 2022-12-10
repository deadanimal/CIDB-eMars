<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="MAT.WebApp.App.Administration.General.AreaMaster.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:FormViewButton ID="btnSave" runat="server" SkinID="ButtonSave" AssociatedFormViewId="FormView1" FunctionAccessControlCode="Create" CommandName="Insert"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="FormView1" runat="server" RenderOuterTable="false" DefaultMode="Insert" ItemType="MAT.App.General.AreaMaster.AreaMasterViewModel"
        InsertMethod="FormView1_InsertItem">
        <InsertItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label1" runat="server" SkinID="FormLabel" AssociatedControlID="ParentAreaMasterId" Text="ParentArea" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="ParentAreaMasterId" ID="ParentAreaMasterId" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label2" runat="server" SkinID="FormLabel" AssociatedControlID="AreaType" Text="AreaType" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="AreaType" ID="AreaType" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label9" runat="server" SkinID="FormLabel" AssociatedControlID="Code" Text="Code" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Code" ID="Code" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label10" runat="server" SkinID="FormLabel" AssociatedControlID="Name" Text="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="Insert" DataField="Name" ID="Name" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                </div>
            </div>
        </InsertItemTemplate>
    </MAT:FormView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
