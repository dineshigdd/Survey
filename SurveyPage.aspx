﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SurveyPage.aspx.cs" Inherits="SurveyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Label ID="lblFocusGroup" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SurveyQuestions" Height="179px" Width="800px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns >
            <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
            <asp:BoundField DataField="Catagory" HeaderText="Catagory" SortExpression="Catagory" />
            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" >
            <ControlStyle Width="200px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Response">
                <ItemTemplate>
                    <asp:RadioButtonList ID="rdbResponse" runat="server" OnSelectedIndexChanged="rdbResponse_SelectedIndexChanged" RepeatDirection="Horizontal" Height="40px" Width="282px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
     <br />
     <br />

    &nbsp;

    <asp:Label ID="lblSubmitMessage" runat="server" Visible="False"></asp:Label>
    <br /><br />
    <asp:SqlDataSource ID="SurveyQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Catagory], [Question] FROM [Question] WHERE ([Focus_Group] = @Focus_Group) OR Focus_Group='All' ORDER BY [Catagory]">
        <SelectParameters>
            <asp:SessionParameter Name="Focus_Group" SessionField="Focus_Group" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Height="35px" Width="140px" /><br /><br />
    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel Survey" Height="35px" Width="140px" /><br /><br />
     
    <asp:Button ID="btnDisplaySummary" runat="server" OnClick="btnDisplaySummary_Click" Text="Display Summary" BorderStyle="None" Visible="False" Height="35px" style="font-weight: 700; color: #0066FF; background-color: #85e085" Width="140px" /><br /><br />

     <asp:Button ID="btnStartOver" runat="server" OnClick="btnStartOver_Click" Text="Start Over the Survey" Height="33px" Width="140px" Visible="False" />&nbsp;<br /><br />

    </div>
    </form>
</body>
</html>
