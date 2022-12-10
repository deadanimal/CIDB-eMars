<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMessage.ascx.cs" Inherits="MAT.WebApp.App.TicketManagement.Ticket.UserControls.ucMessage" %>

<asp:UpdatePanel runat="server" ID="upForm" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="row">
            <div class="col-md-12">
                <div class="m-portlet" runat="server" id="newMessageBox">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">
                                    <MAT:Literal runat="server" Text="New Message"></MAT:Literal>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="m-portlet__body">
                        <div class="row">

                            <div class="col-md-12" style="max-height: 300px; overflow-y: auto; flex-direction: column-reverse; display: flex;">


                                <asp:Repeater runat="server" ID="rptMessage" SelectMethod="rptMessage_GetData"
                                    ItemType="MAT.App.Scorecard.TicketManagement.Ticket.TicketMessageViewModel"
                                    OnItemDataBound="rptMessage_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="messagebox">
                                            <div class="messagebox__img">                                                
                                                <asp:HiddenField runat="server" ID="hfProfileImagePath" Value='<%# Item.ProfileImagePath %>' />
                                                <asp:Image runat="server" ID="imgProfile" Style="max-width: 70px;" />
                                            </div>
                                            <div class="messagebox__msg">
                                                <div class="time pull-right">
                                                    <i class="ace-icon fa fa-clock-o"></i>
                                                    <span style="color: green"><%# Eval("CreatedDateTime") %></span>
                                                </div>
                                                <div class="name">
                                                    <span style="color: blue"><%# Eval("CreatedByName") %></span>
                                                </div>
                                                <div class="text"><%# Item.Message.Replace("\n","<br/>") %></div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>


                            </div>

                            <div class="col-md-12">
                                <div class="form-group m-form__group mat-form-group">
                                    <Metronic:TextBox runat="server" ID="txtMessage" TextMode="MultiLine" Rows="3" placeholder="Type your message here ..." Mandatory="true"
                                        ValidationGroup="SendMessage"></Metronic:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="pull-right">
                                    <MAT:LinkButton runat="server" ID="btnSend" CssClass="btn btn-minier btn-primary" FrontIconCss="ace-icon fa fa-share bigger-110"
                                        Text="Send" ValidationGroup="SendMessage" OnClick="btnSend_Click"></MAT:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div runat="server" id="divNoRecords" class="well well-sm">No records found</div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
