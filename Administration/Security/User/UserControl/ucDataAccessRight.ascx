<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDataAccessRight.ascx.cs" Inherits="MAT.WebApp.App.Administration.Security.User.UserControl.ucDataAccessRight" %>

<div class="m-portlet__head">
    <div class="m-portlet__head-caption">
        <div class="m-portlet__head-title">
            <span class="m-portlet__head-icon m--hide">
                <i class="la la-gear"></i>
            </span>
            <h3 class="m-portlet__head-text">
                <MAT:Literal runat="server" Text="DataAccessRight"></MAT:Literal>
            </h3>
        </div>
    </div>
</div>
<div class="m-portlet__body">
    <div class="row">
        <div class="col-md-12">
            <asp:TreeView ID="TreeView1" runat="server" ShowLines="true" ShowCheckBoxes="All"></asp:TreeView>
        </div>
    </div>
</div>

<script lang="javascript" type="text/javascript">
   $(function () {
        $("#<%# TreeView1.ClientID %> input[type=checkbox]").bind("click", function () {
            // check all childrens if have any
            var li = $(this).closest("li");
            var isChecked = $(this).is(":checked");
            $("input[type=checkbox]", li.find("ul")).each(function (index) {
                $(this).prop("checked", isChecked);
            });

            // set parent to checked if all children is check
            var parentLi = $(this).closest("ul").closest("li");
            while (parentLi.length > 0) {
                var parentCheckbox = $("input[type=checkbox]", parentLi.find("div"))[0];
                var parentChecked = true;
                $("input[type=checkbox]", parentLi.find("ul")).each(function (index) {
                    if (!$(this).is(":checked"))
                        parentChecked = false;
                });
                $(parentCheckbox).prop("checked", parentChecked);

                parentLi = $(parentLi).closest("ul").closest("li");
            }
        });
    })
</script>