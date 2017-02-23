<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DetailedDisplay.aspx.cs" Inherits="DetailedDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDSQuestionForDropDownList" DataTextField="Question" DataValueField="ID" Height="61px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="300px">
    </asp:DropDownList><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDSGridviewAndChart" Visible="False">
        <Columns>
            <asp:BoundField DataField="Number of Response" HeaderText="Number of Response" ReadOnly="True" SortExpression="Number of Response" />
            <asp:BoundField DataField="Response Value" HeaderText="Response Value" SortExpression="Response Value" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDSGridviewAndChart" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Responses.ID) AS 'Number of Response' , Response AS 'Response Value' FROM Question INNER JOIN Responses ON Question.ID = Responses.ID WHERE (Question.ID=@ID) GROUP BY Response">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSQuestionForDropDownList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Question.ID, Question.Question FROM Question INNER JOIN Responses ON Question.ID = Responses.ID GROUP BY Question.ID,Question.Question"></asp:SqlDataSource>
    <br /><br /><br />
    <asp:Chart ID="barChart" runat="server" DataSourceID="SqlDSGridviewAndChart" Visible="False">
        <Series>
            <asp:Series Name="Series1" XValueMember="Response Value" YValueMembers="Number of Response">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
<br />


    <asp:Button ID="btnTakeAsurvey" runat="server" BackColor="#999999" BorderColor="#666666" BorderStyle="None" Height="32px" onClick="btnTakeSurvey" Text="Take a Survey" Width="103px" style="text-align: left" />


</asp:Content>

