<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AbortControl.ascx.cs" Inherits="MAT.WebApp.App.Workflow.Console.AbortControl" %>


<%--Add/Edit/View--%>
<div id="modalform" runat="server" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" runat="server" id="btnCancel" onserverclick="btnCancel_ServerClick" causesvalidation="false">&times;</button>
                <h4 class="blue bigger">
                    <%: MAT.Resources.GlobalResource.AbortWorkflowProcess %>
                </h4>
            </div>
            <div class="modal-body">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-horizontal" role="form">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <MAT:Label runat="server" SkinID="FormLabel" Text="Remarks" AssociatedControlID="Remarks" ValidationGroup="Condition" />
                                    <div class="col-sm-8">
                                        <MAT:TextBox ID="Remarks" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></MAT:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Remarks" ErrorMessage="" ValidationGroup="Condition"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="align-right">
                                    <MAT:LinkButton ID="btnAbort" runat="server" Text="Confirm" ValidationGroup="Condition" OnClick="btnAbort_Click" CssClass="btn btn-info" FrontIconCss="ace-icon fa fa-floppy-o bigger-110" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
