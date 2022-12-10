<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="MAT.WebApp.App.Administration.AuditLog.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .numberCircle {
            border-radius: 50%;
            behavior: url(PIE.htc); /* remove if you don't care about IE8 */
            /*Use fixed width & height if you want fixed radius*/
            width: 34px;
            height: 34px;
            /*Use Inherit if you want to match it with element's height & width*/
            /*width : inherit;
            height : inherit;*/
            padding: 2px;
            border: 2px solid;
            text-align: center;
            display: inline-block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
    <Metronic:LinkButton ID="btnBack" runat="server" SkinID="ButtonBack" OnClick="btnBack_Click" CausesValidation="false"></Metronic:LinkButton>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" DefaultMode="ReadOnly" ItemType="MAT.App.AuditLog.AuditLogViewModel"
        SelectMethod="fvParent_Get">
        <ItemTemplate>
            <div class="m-portlet">
                <div class="m-portlet__body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="Date" AssociatedControlID="Date" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="CreatedDate" ID="Date" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group m-form__group mat-form-group">
                                <MAT:Label runat="server" SkinID="FormLabel" Text="User" AssociatedControlID="User" />
                                <div class="col-sm-7">
                                    <asp:DynamicControl runat="server" Mode="ReadOnly" DataField="UserName" ID="User" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </MAT:FormView>
    <%-- Audit Log Information with Proper Indentation & Serial No --%>
    <div runat="server" id="auditLogDiv"></div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
