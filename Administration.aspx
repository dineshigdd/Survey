<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Administration.aspx.cs" Inherits="Administration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="Select Focus Group" Width="130px"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlFocusGroup" runat="server" DataSourceID="SqlDSFocusGroup" DataTextField="Focus_Group" DataValueField="Focus_Group" Height="30px" Width="154px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDSFocusGroup" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Focus_Group] FROM [Question]"></asp:SqlDataSource>
    <br /><br />
    <asp:Label ID="Label2" runat="server" Text="Select Catagory" Width="130px"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlCatagory" runat="server" Height="30px" Width="154px" DataSourceID="SqlDSCatagory" DataTextField="Catagory" DataValueField="Catagory"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDSCatagory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Catagory] FROM [Question]"></asp:SqlDataSource>
    <br /><br />
    <asp:Label ID="Label3" runat="server" Height="30px" Width="130px">Enter New Question</asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtQuestion" runat="server" Height="30px" style="margin-left: 0px" Width="285px"></asp:TextBox>
   <br /> <br /> <asp:Button ID="btnAdd" runat="server" Text="Add Data" OnClick="btnAdd_Click" Height="30px" Width="100px" />
    <br />
    <br /><br />
    <asp:Button ID="btnXMLImport" runat="server" OnClick="btnXMLImport_Click" Text="Import Data From XML File" Height="30px" Width="175px" />
        

    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="QuestionTable" Visible="False">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Focus_Group" HeaderText="Focus_Group" SortExpression="Focus_Group" />
            <asp:BoundField DataField="Catagory" HeaderText="Catagory" SortExpression="Catagory" />
            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="QuestionTable" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Button ID="btnHome" Text="Home" runat="server" Height="30px" OnClick="btnHome_Click" Width="100px" />
    </div>
    </form>
</body>
</html>
