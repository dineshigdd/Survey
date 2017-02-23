<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParticipantEntry.aspx.cs" Inherits="SurveyQuestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
    <h1>Please Select your focus group</h1>
    <asp:DropDownList ID="ddlFocusGroup" runat="server" DataSourceID="SqlDSFocusGroup" DataTextField="Focus_Group" DataValueField="Focus_Group" Height="30px" Width="154px">
    </asp:DropDownList>
    &nbsp;&nbsp;<asp:Button ID="btnTakeSurvey" runat="server" text="Take a Survey" OnClick="btnTakeSurvey_Click" Height="30px" Width="100px"/>
    <asp:SqlDataSource ID="SqlDSFocusGroup" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Focus_Group] FROM [Question] WHERE [Focus_Group] &lt;&gt;'All'"></asp:SqlDataSource>
        
    <br /><br /><br />
    <asp:Button ID="btnAdmin" runat="server" BorderStyle="Solid" OnClick="btnAdmin_Click" Text="Go to Administrion " Height="30px" Width="154px" />
        
    </div>
    </form>
</body>
</html>
