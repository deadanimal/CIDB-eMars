<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataSecurityAccessEntity.ascx.cs" Inherits="MAT.WebApp.App.Scorecard.Security.DataSecurityAccessEntity" %>
<MAT:Panel ID="pnlStructure" runat="server" GroupingText="EntityDataAccess">
    <%--  <asp:TreeView ID="TreeView1" runat="server" ExpandDepth="0" ImageSet="Msdn" NodeIndent="10"
        Width="200px" ShowCheckBoxes="All" ShowExpandCollapse="true" onclick="OnTreeClick(event);">
        <ParentNodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
            NodeSpacing="0px" VerticalPadding="0px" />
        <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
            NodeSpacing="0px" VerticalPadding="0px" />
        <LeafNodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px"
            NodeSpacing="0px" VerticalPadding="0px" />
    </asp:TreeView>--%>

    <div class="m-portlet__body">
        <div class="row">
            <div class="col-md-12">
                <asp:TreeView ID="TreeView1" runat="server" ShowLines="true" ShowCheckBoxes="All"></asp:TreeView>
            </div>
        </div>
    </div>

</MAT:Panel>

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
