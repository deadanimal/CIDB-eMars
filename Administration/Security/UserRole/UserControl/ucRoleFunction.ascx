<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRoleFunction.ascx.cs" Inherits="MAT.WebApp.App.Administration.Security.UserRole.UserControl.ucRoleFunction" %>

<div class="col-xs-12">
    <div class="form-horizontal">
        <h4 class="header smaller blue no-margin-top">
            <MAT:Literal runat="server" Text="AccessRight"></MAT:Literal>
        </h4>
        <p></p>
        <asp:TreeView ID="TreeView1" ShowCheckBoxes="All" runat="server" NodeIndent="10" ShowLines="true">
        </asp:TreeView>
        <asp:HiddenField ID="hfValue" runat="server" />
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

           // set selected value to hidden field
           var values = "";
           $("#<%# TreeView1.ClientID %> input[type=checkbox][name='last']").each(function (index) {
                if ($(this).is(':checked')) {
                    if (values == "")
                        values = $(this).val();
                    else
                        values = values + ";" + $(this).val();
                }
            });
            $("#<%# hfValue.ClientID %>").val(values);
        });
    })
</script>