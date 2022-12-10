<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAutoCompleteSearch.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.WebControls.ucAutoCompleteSearch" %>

<asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
    <ContentTemplate>       
        <div class="input-group">
            <Metronic:TextBox ID="txtInput" runat="server"></Metronic:TextBox>
            <div class="input-group-append" runat="server" id="modalSearch">
                <MAT:LinkButton ID="btnSearch" runat="server" SkinID="ButtonSearchSmallFreeText" OnClick="btnSearch_Click" CausesValidation="false" />
            </div>
            <asp:HiddenField ID="hfValue" runat="server" />
            <asp:HiddenField ID="hfFilters" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="rfvInput" ControlToValidate="txtInput"
                CssClass="DDControl DDValidator help-block" Display="Dynamic" Enabled="true" />
            <asp:LinkButton ID="btnTextChange" runat="server" Style="display: none;" OnClick="btnTextChange_Click" CausesValidation="false"></asp:LinkButton>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>