<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CountryState.ascx.cs" Inherits="MAT.WebApp.App.Administration.General.AreaMaster.UserControl.CountryState" %>

<asp:UpdatePanel ID="upAreaMaster" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="form-group m-form__group mat-form-group">
            <MAT:Label ID="Label6" runat="server" SkinID="FormLabel" Text="Country" AssociatedControlID="ddlCountry" />
            <div class="col-sm-7">
                <Metronic:DropDownList ID="ddlCountry" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="GetCountry" AutoPostBack="true"
                    OnSelectedIndexChanged="Country_SelectedIndexChanged">
                </Metronic:DropDownList>
                <asp:Label ID="lblCountry" runat="server" SkinID="FormValue"></asp:Label>
            </div>
        </div>
        <div class="form-group m-form__group mat-form-group">
            <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="State" AssociatedControlID="ddlState" />
            <div class="col-sm-7">
                <Metronic:DropDownList ID="ddlState" runat="server" DataValueField="Key" DataTextField="Value" SelectMethod="GetState"></Metronic:DropDownList>
                <asp:Label ID="lblState" runat="server" SkinID="FormValue"></asp:Label>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
