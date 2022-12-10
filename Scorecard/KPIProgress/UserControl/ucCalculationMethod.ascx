<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCalculationMethod.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.KPIProgress.UserControl.ucCalculationMethod" %>

<a href="#" style="font-size: 18px; align-self: center;">
    <i class="ace-icon fa fa-info-circle" data-toggle="modal" data-target="#modalpanel"></i>
</a>

<div class="modal fade" id="modalpanel" aria-hidden="true" style="display: none">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="smaller lighter blue no-margin">Performance
                </h3>
                <button id="btnModalClose" type="button" class="close" aria-hidden="true" data-dismiss="modal">x</button>
            </div>
            <div class="modal-body">
                <ul runat="server" visible='<%# CalculationDisplayType == MAT.App.Scorecard.Enumerate.CalculationDisplayType.ThisQuarter %>'>
                    <li>Performance = Progress / Target
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>