<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCustomFields.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.UserControls.ucCustomFields" %>

<%@ Register Src="~/TicketManagement/ModalLookup/ucDealerBySalesPerson.ascx" TagPrefix="UserControl" TagName="ucDealerBySalesPerson" %>

<asp:UpdatePanel runat="server" ID="upCustomFields" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Repeater runat="server" ID="rptCustomFields" SelectMethod="rptCustomFields_GetData" ItemType="MAT.App.Scorecard.TicketManagement.CustomField.CustomFieldValueViewModel"
            OnItemDataBound="rptCustomFields_ItemDataBound" OnPreRender="rptCustomFields_PreRender">
            <ItemTemplate>
                <asp:Panel runat="server" ID="pnlDynamic" Visible='<%# Item.FieldCategory == MAT.App.Scorecard.TicketManagement.CustomField.FieldCategory.Dynamic %>'>
                    <div class="form-group">
                        <asp:HiddenField ID="hfCustomFieldId" runat="server" Value='<%# Item.CustomFieldId %>' />
                        <asp:HiddenField ID="hfFieldCategory" runat="server" Value='<%# (int)Item.FieldCategory %>' />
                        <asp:HiddenField ID="hfFieldType" runat="server" Value='<%# (int)Item.FieldType %>' />
                        <asp:Label ID="lblFieldName" runat="server" SkinID="FormLabel" Text='<%# Item.FieldName %>' />
                        <div class="col-sm-8 col-xs-12">
                            <asp:Panel ID="pnlCfAction" runat="server" Wrap="false" Visible='<%# FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId ) %>'>
                                <asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# Item.IsMandatory %>'></asp:Literal>
                                <Metronic:TextBox runat="server" SkinID="DefaultTextBox" data-offline="true" ID="CustomTextBox" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Text || Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Decimal || Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Integer%>' Text='<%# Item.Value %>' />
                                <Metronic:DropDownList runat="server" SkinID="Select2" data-offline="true" ID="CustomDropDownList" Visible="false" DataTextField="Value" DataValueField="Key" Text='<%# Item.Value %>' />
                                <Metronic:TextBox runat="server" SkinID="DefaultTextBox" data-offline="true" ID="CustomTextBoxLongText" TextMode="MultiLine" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.LongText %>' Text='<%# Item.Value %>' />
                                <Metronic:TextBox runat="server" SkinID="TimePicker" data-offline="true" ID="CustomTimePicker" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Time %>' Text='<%# Item.Value %>' />
                                <Metronic:TextBox runat="server" SkinID="DatePicker" data-offline="true" ID="CustomDatePicker" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Date %>' Text='<%# Item.Value %>' />
                                <asp:Literal runat="server" Text="</div>" Visible='<%# Item.IsMandatory%>'></asp:Literal>
                                <asp:RegularExpressionValidator ID="rDecimal" runat="server" Text="Input must be a valid decimal." ControlToValidate="CustomTextBox" ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$" Display="Dynamic" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Decimal  && Item.IsMandatory %>' />
                                <asp:RegularExpressionValidator ID="rInteger" runat="server" Text="Input must be a valid integer." ControlToValidate="CustomTextBox" ValidationExpression="^[0-9]+$" Display="Dynamic" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Integer  && Item.IsMandatory %>' />
                                <asp:RequiredFieldValidator ID="rfvTextBox" runat="server" Text="Input required." ControlToValidate="CustomTextBox" Enabled="false" Display="Dynamic" Visible='<%# (Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Text || Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Decimal || Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Integer) && Item.IsMandatory %>' />
                                <asp:RequiredFieldValidator ID="rfvDropDownList" runat="server" ControlToValidate="CustomDropDownList" ErrorMessage="Input required." Display="Dynamic" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.List && Item.IsMandatory %>' />
                                <asp:RequiredFieldValidator ID="rfvLongText" runat="server" Text="Input required." ControlToValidate="CustomTextBoxLongText" Display="Dynamic" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.LongText  && Item.IsMandatory %>' />
                                <asp:RequiredFieldValidator ID="rfvTimePicker" runat="server" Text="Input required." ControlToValidate="CustomTimePicker" Display="Dynamic" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Time && Item.IsMandatory %>' />
                                <asp:RequiredFieldValidator ID="rfvDatePicker" runat="server" Text="Input required." ControlToValidate="CustomDatePicker" Display="Dynamic" Visible='<%# Item.FieldType == MAT.App.Scorecard.TicketManagement.CustomField.FieldType.Date && Item.IsMandatory %>' />
                            </asp:Panel>
                            <asp:Label ID="lblValue" SkinID="FormValue" runat="server" Text='<%# Item.Value %>' Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlSpecial" runat="server" Visible='<%# Item.FieldCategory == MAT.App.Scorecard.TicketManagement.CustomField.FieldCategory.Special %>'>
                    <asp:Panel ID="pnlDealer" runat="server" Visible='<%# Item.FieldName == MAT.App.Scorecard.TicketManagement.CustomField.SpecialFields.DEALER %>'>
                        <div class="form-group">
                            <asp:Label runat="server" SkinID="FormLabel" Text='<%# Item.FieldName %>' />
                            <div class="col-sm-8 col-xs-12">
                                <UserControl:ucDealerBySalesPerson id="DealerBySalesPersonLookup" runat="server" isrequired='<%# Item.IsMandatory %>'
                                    ontextchanged="DealerBySalesPersonLookup_TextChanged" userid='<%# TicketModel?.TicketOwnerUId %>' value='<%# TicketModel?.DealerEId %>'
                                    visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>' />
                                <asp:Label ID="lblDealer" SkinID="FormValue" runat="server" Text='<%# TicketModel?.DealerName %>' Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlAddress" runat="server" Visible='<%# Item.FieldName == MAT.App.Scorecard.TicketManagement.CustomField.SpecialFields.INCIDENT_ADDRESS %>'>
                        <asp:UpdatePanel ID="upAddress" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Address" AssociatedControlID="txtAddress1" />
                                    <div class="col-sm-8 col-xs-12">
                                        <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                            <asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <Metronic:TextBox runat="server" ID="txtAddress1" data-offline="true" SkinID="DefaultTextBox" MaxLength="100" Text='<%# TicketModel?.Address1 %>' />
                                            <asp:Literal runat="server" Text="</div>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic" Text="Input required."
                                                ControlToValidate="txtAddress1" Visible='<%# (bool)Eval("IsMandatory") %>' />
                                        </div>
                                        <asp:HiddenField ID="hfAddress1" runat="server" Value='<%# TicketModel?.Address1 %>' />
                                        <asp:Label ID="lblAddress1" SkinID="FormValue" runat="server" Text='<%# TicketModel?.Address1 %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="txtAddress2" />
                                    <div class="col-sm-8 col-xs-12">
                                        <Metronic:TextBox runat="server" ID="txtAddress2" data-offline="true" SkinID="DefaultTextBox" MaxLength="100" Text='<%# TicketModel?.Address2 %>'
                                            Visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>' />
                                        <asp:HiddenField ID="hfAddress2" runat="server" Value='<%# TicketModel?.Address2 %>' />
                                        <asp:Label ID="lblAddress2" SkinID="FormValue" runat="server" Text='<%# TicketModel?.Address2 %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" AssociatedControlID="txtAddress3" />
                                    <div class="col-sm-8 col-xs-12">
                                        <Metronic:TextBox runat="server" ID="txtAddress3" data-offline="true" SkinID="DefaultTextBox" MaxLength="100" Text='<%# TicketModel?.Address3 %>'
                                            Visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>' />
                                        <asp:HiddenField ID="hfAddress3" runat="server" Value='<%# TicketModel?.Address3 %>' />
                                        <asp:Label ID="lblAddress3" SkinID="FormValue" runat="server" Text='<%# TicketModel?.Address3 %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Postcode" AssociatedControlID="txtPostcode" />
                                    <div class="col-sm-8 col-xs-12">
                                        <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                            <%--<asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>--%>
                                            <Metronic:TextBox runat="server" ID="txtPostcode" data-offline="true" SkinID="DefaultTextBox" MaxLength="20" Text='<%# TicketModel?.Postcode %>' />
                                            <%--<asp:Literal runat="server" Text="</div>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>--%>
                                            <%--<asp:RequiredFieldValidator ID="rfvPostcode" runat="server" Display="Dynamic" Text="Input required."
                                                ControlToValidate="txtPostcode" Visible='<%# (bool)Eval("IsMandatory") %>' />--%>
                                        </div>
                                        <asp:HiddenField ID="hfPostcode" runat="server" Value='<%# TicketModel?.Postcode %>' />
                                        <asp:Label ID="lblPostcode" SkinID="FormValue" runat="server" Text='<%# TicketModel?.Postcode %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="City" AssociatedControlID="txtCity" />
                                    <div class="col-sm-8 col-xs-12">
                                        <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                            <asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <Metronic:TextBox runat="server" ID="txtCity" data-offline="true" SkinID="DefaultTextBox" MaxLength="200" Text='<%# TicketModel?.CityName %>' />
                                            <asp:Literal runat="server" Text="</div>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic" Text="Input required."
                                                ControlToValidate="txtCity" Visible='<%# (bool)Eval("IsMandatory") %>' />
                                        </div>
                                        <asp:HiddenField ID="hfCity" runat="server" Value='<%# TicketModel?.CityName %>' />
                                        <asp:Label ID="lblCity" SkinID="FormValue" runat="server" Text='<%# TicketModel?.CityName %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <MAT:Label ID="Label7" runat="server" SkinID="FormLabel" Text="State" AssociatedControlID="ddlState" />
                                    <div class="col-sm-8 col-xs-12">
                                        <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                            <asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <Metronic:DropDownList ID="ddlState" runat="server" data-offline="true" CssClass="select2" DataValueField="Key" DataTextField="Value" SkinID="Select2"
                                                SelectMethod="GetState" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true">
                                            </Metronic:DropDownList>
                                            <asp:Literal runat="server" Text="</div>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <asp:RequiredFieldValidator ID="rfvState" runat="server" Style="display: none;" ControlToValidate="ddlState" InitialValue=""
                                                ErrorMessage="Input required." Display="Dynamic" Visible='<%# (bool)Eval("IsMandatory") %>' />
                                        </div>
                                        <asp:HiddenField ID="hfState" runat="server" Value='<%# TicketModel?.StateName %>' />
                                        <asp:Label ID="lblState" SkinID="FormValue" runat="server" Text='<%# TicketModel?.StateName %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <MAT:Label ID="Label8" runat="server" SkinID="FormLabel" Text="District" AssociatedControlID="ddlDistrict" />
                                    <div class="col-sm-8 col-xs-12">
                                        <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                            <%--<asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>--%>
                                            <Metronic:DropDownList ID="ddlDistrict" runat="server" data-offline="true" CssClass="select2" DataValueField="Key" DataTextField="Value" SkinID="Select2"
                                                OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true">
                                            </Metronic:DropDownList>
                                            <%--<asp:Literal runat="server" Text="</div>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="ddlDistrict" InitialValue=""
                                                ErrorMessage="Input required." Display="Dynamic" Visible='<%# (bool)Eval("IsMandatory") %>' />--%>
                                        </div>
                                        <asp:HiddenField ID="hfDistrict" runat="server" Value='<%# TicketModel?.DistrictName %>' />
                                        <asp:Label ID="lblDistrict" SkinID="FormValue" runat="server" Text='<%# TicketModel?.DistrictName %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <MAT:Label ID="Label3" runat="server" SkinID="FormLabel" Text="Mukim" AssociatedControlID="ddlMukim" />
                                    <div class="col-sm-8 col-xs-12">
                                        <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                            <%--<asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>--%>
                                            <Metronic:DropDownList ID="ddlMukim" runat="server" data-offline="true" CssClass="select2" DataValueField="Key" DataTextField="Value" SkinID="Select2"></Metronic:DropDownList>
                                            <%--<asp:Literal runat="server" Text="</div>" Visible='<%# (bool)Eval("IsMandatory") %>'></asp:Literal>
                                            <asp:RequiredFieldValidator ID="rfvMukim" runat="server" ControlToValidate="ddlMukim" InitialValue=""
                                                ErrorMessage="Input required." Display="Dynamic" Visible='<%# (bool)Eval("IsMandatory") %>' />--%>
                                        </div>
                                        <asp:HiddenField ID="hfMukim" runat="server" Value='<%# TicketModel?.MukimName %>' />
                                        <asp:Label ID="lblMukim" SkinID="FormValue" runat="server" Text='<%# TicketModel?.MukimName %>'
                                            Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlState" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:Panel runat="server" ID="pnlLongLat" Visible='<%# Item.FieldName == MAT.App.Scorecard.TicketManagement.CustomField.SpecialFields.LONGITUTE_LATITUTE %>'>
                        <div class="form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Longitude" AssociatedControlID="Longitude" />
                            <div class="col-sm-8 col-xs-12">
                                <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                    <asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# Item.IsMandatory %>'></asp:Literal>
                                    <Metronic:TextBox runat="server" ID="Longitude" data-offline="true" SkinID="DefaultTextBox" Text='<%# TicketModel?.Longitude %>' />
                                    <asp:Literal runat="server" Text="</div>" Visible='<%# Item.IsMandatory%>'></asp:Literal>
                                    <asp:RequiredFieldValidator ID="rfvLongitude" runat="server" Display="Dynamic" Text="Input required." ControlToValidate="Longitude" Visible='<%# Item.IsMandatory %>' />
                                    <asp:RegularExpressionValidator ID="rDecimalLong" runat="server" Text="Input must be a valid decimal." ControlToValidate="Longitude" ValidationExpression="^-?([1-9]?[0-9])\.{1}\d{1,6}" Enabled="false" Display="Dynamic" />
                                </div>
                                <asp:HiddenField ID="hfLongitude" runat="server" Value='<%# TicketModel?.Longitude %>' />
                                <asp:Label ID="lblLongitude" SkinID="FormValue" runat="server" Text='<%# TicketModel?.Longitude %>'
                                    Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="Latitude" AssociatedControlID="Latitude" />
                            <div class="col-sm-8 col-xs-12">
                                <div runat="server" visible='<%# (FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'>
                                    <asp:Literal runat="server" Text="<div class='input-group'><span class='input-group-addon'><i class='ace-icon fa fa-asterisk smaller-50 red'></i></span>" Visible='<%# Item.IsMandatory %>'></asp:Literal>
                                    <Metronic:TextBox runat="server" ID="Latitude" data-offline="true" SkinID="DefaultTextBox" Text='<%# TicketModel?.Latitude %>' />
                                    <asp:Literal runat="server" Text="</div>" Visible='<%# Item.IsMandatory%>'></asp:Literal>
                                    <asp:RequiredFieldValidator ID="rfvLatitude" runat="server" Display="Dynamic" Text="Input required." ControlToValidate="Latitude" Visible='<%# Item.IsMandatory %>' />
                                    <asp:RegularExpressionValidator ID="rDecimalLat" runat="server" Text="Input must be a valid decimal." ControlToValidate="Latitude" ValidationExpression="^-?([1-9]?[0-9])\.{1}\d{1,6}" Enabled="false" Display="Dynamic" />
                                </div>
                                <asp:HiddenField ID="hfLatitude" runat="server" Value='<%# TicketModel?.Latitude %>' />
                                <asp:Label ID="lblLatitude" SkinID="FormValue" runat="server" Text='<%# TicketModel?.Latitude %>'
                                    Visible='<%# !(FormMode == FormViewMode.Insert || (FormMode == FormViewMode.Edit && TicketModel?.TicketOwnerUId == MAT.Context.Profile.UserId)) %>'></asp:Label>
                                <MAT:LinkButton ID="btnGoogleMap" runat="server" Text="ViewGoogleMap" CausesValidation="false"
                                    CssClass="btn btn-info" FrontIconCss="ace-icon fa fa-map-marker red bigger-110" />
                                <MAT:LinkButton ID="btnArcGISMap" runat="server" Text="ViewArcGISMap" CausesValidation="false"
                                    CssClass="btn btn-info" FrontIconCss="ace-icon fa fa-map-marker red bigger-110" />
                            </div>
                        </div>
                    </asp:Panel>
                </asp:Panel>
            </ItemTemplate>
        </asp:Repeater>
    </ContentTemplate>
</asp:UpdatePanel>
