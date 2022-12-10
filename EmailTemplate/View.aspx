<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.EmailTemplate.View" %>

<%@ Register Src="~/EmailTemplate/TagQuery.ascx" TagPrefix="MAT" TagName="TagQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnEdit" runat="server" SkinID="ButtonEdit" FunctionAccessControlCode="Edit" OnClick="btnEdit_Click"></Metronic:LinkButton>
    <Metronic:FormViewButton ID="btnDelete" runat="server" SkinID="ButtonDelete" FunctionAccessControlCode="Delete" AssociatedFormViewId="fvParent" CommandName="Delete" CausesValidation="false"></Metronic:FormViewButton>
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DataKeyNames="EmailTemplateId" DefaultMode="ReadOnly" ItemType="MAT.App.EmailTemplate.EmailTemplateViewModel"
        SelectMethod="fvParent_GetItem" DeleteMethod="fvParent_DeleteItem">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label5" runat="server" SkinID="FormLabel" Text="Name" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Name" ID="Name" />
                                </div>
                            </div>

                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="Subject" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="Subject" ID="Subject" />
                                </div>
                            </div>
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="Tag" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="BodyQueryId" ID="BodyQueryId" />
                                    <MAT:TagQuery runat="server" ID="TagQuery1" QueryId="<%# Item.BodyQueryId %>" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="form-group m-form__group mat-form-group">
                                <div class="col-sm-7">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label ID="Label8" runat="server" SkinID="FormLabel2" Text="Body" />
                                <div class="col-sm-7 col-md-9 col-lg-9 col-xl-9">
                                    <asp:Literal ID="Literal1" runat="server" Text="<%# Server.HtmlDecode(Item.Body) %>"></asp:Literal>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </ItemTemplate>
    </MAT:FormView>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
