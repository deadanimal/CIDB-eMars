<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SR002v2.aspx.cs" Inherits="MAT.WebApp.App.Reports.SR002v2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphButtons" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="SearchDiv">
            <div id="divParameters" runat="server">
                <div id="divSelectYear">
                    <div id="DivSelectLabelYear"></div>
                    <div id="divSelectDropDownListYear">
                        <asp:DropDownList ID="ddlYear" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="divSelectQuarter">
                    <div id="DivSelectLabelQuarter"></div>
                    <div id="divSelectDropDownListQuarter">
                        <asp:DropDownList ID="ddlQuarter" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                 <div id="divSubmit">
                    <div id="divSubmitButton">
                       <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                    </div>
                </div>
            </div>
            <div id="divReports" runat="server"></div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderScript" runat="server">
</asp:Content>
