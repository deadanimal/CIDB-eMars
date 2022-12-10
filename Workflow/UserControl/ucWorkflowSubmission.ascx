<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucWorkflowSubmission.ascx.cs" Inherits="MAT.WebApp.App.Workflow.UserControl.ucWorkflowSubmission" %>
<Metronic:LinkButton ID="btnSubmit" runat="server" Text="Submit"
    CausesValidation="false" OnClick="btnSubmit_Click" SkinID="ButtonFreeText"></Metronic:LinkButton>
<div class="modal fade" id="modalform" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <MAT:Literal ID="ltTitle" runat="server" Text="Confirmation"></MAT:Literal>
                </h5>
                <button type="button" class="close" runat="server" id="btnClose" onserverclick="btnClose_ServerClick" causesvalidation="false">&times;</button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label ID="ltMessage" runat="server" Text="Message_AreYouSure" CssClass="col-sm-12 col-form-label"></MAT:Label>
                        </div>
                        <div class="form-group m-form__group mat-form-group" id="divManualAssignment" runat="server" visible="false">
                            <MAT:Label runat="server" CssClass="col-sm-3 col-form-label" Text="AssignTo" />
                            <div class="col-sm-9">
                                <Metronic:DropDownList ID="AssignTo" runat="server" DataValueField="Key" DataTextField="Value" Mandatory="true">
                                </Metronic:DropDownList>
                            </div>
                        </div>
                        <div class="form-group m-form__group mat-form-group">
                            <div class="col-sm-12">
                                <div class="pull-right">
                                    <Metronic:LinkButton ID="btnCancel" runat="server" Text="Cancel"
                                        CausesValidation="false" OnClick="btnCancel_Click" SkinID="ButtonFreeText"></Metronic:LinkButton>
                                    <Metronic:LinkButton ID="btnOk" runat="server" Text="OK"
                                        ValidationGroup="WorkflowSubmission" OnClick="btnOk_Click" SkinID="ButtonFreeText"></Metronic:LinkButton>
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
