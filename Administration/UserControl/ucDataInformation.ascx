<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDataInformation.ascx.cs" Inherits="MAT.WebApp.App.Administration.UserControl.ucDataInformation" %>

<MAT:FormView ID="fvParent" runat="server" RenderOuterTable="false" SelectMethod="fvParent_GetItem" ItemType="MAT.App.General.DataInformation.DataViewModel">
    <ItemTemplate>
        <div class="m-portlet">
            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <span class="m-portlet__head-icon m--hide">
                            <i class="la la-gear"></i>
                        </span>
                        <h3 class="m-portlet__head-text">
                            <MAT:Literal runat="server" Text="DataInformation"></MAT:Literal>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="CreatedBy" AssociatedControlID="CreatedBy" />
                            <div class="col-sm-7">
                                <asp:Label ID="CreatedBy" runat="server" Text='<%# string.Format("{0} {1:dd/MM/yyyy HH:mm}", Eval("CreatedByName"), Eval("CreatedDate"))%>' SkinID="FormValue" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group m-form__group mat-form-group">
                            <MAT:Label runat="server" SkinID="FormLabel" Text="ModifiedBy" AssociatedControlID="ModifiedBy" />
                            <div class="col-sm-7">
                                <asp:Label ID="ModifiedBy" runat="server" Text='<%# string.Format("{0} {1:dd/MM/yyyy HH:mm}", Eval("ModifiedByName"), Eval("ModifiedDate"))%>' SkinID="FormValue" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
    <EmptyDataTemplate>
    </EmptyDataTemplate>
</MAT:FormView>
