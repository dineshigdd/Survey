<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SummaryDisplay.aspx.cs" Inherits="SummaryDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Results Screen</h1>
    <asp:DropDownList ID="ddlFocusgroup" runat="server" Height="16px" Width="150px">
    </asp:DropDownList>
    &nbsp;&nbsp;<br />

    <asp:DropDownList ID="ddlCatagory" runat="server" Height="16px" Width="148px">
    </asp:DropDownList>

      &nbsp;&nbsp;&nbsp;

      <asp:Button ID="btnReport" runat="server" OnClick="Button1_Click" Text="Report" />


    <asp:SqlDataSource ID="JoinTable1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Focus_Group FROM Question WHERE (Focus_Group &lt;&gt; 'All')">
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="JoinTable2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Catagory  FROM Question ">
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="SqlDataAllforFocusGroup" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Question.ID, Question.Question ,COUNT(Responses.Response) AS 'Total submissions', AVG(Responses.Response) AS 'Average Response Value'FROM Responses INNER JOIN Question ON Responses.ID = Question.ID WHERE (Question.Catagory = @Catagory) GROUP BY Question.Question,Question.ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCatagory" Name="Catagory" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataAllforCatagory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Question.ID, Question.Question ,COUNT(Responses.Response) AS 'Total submissions', AVG(Responses.Response) AS 'Average Response Value'FROM Responses INNER JOIN Question ON Responses.ID = Question.ID WHERE (Question.Focus_Group = @Focus_Group) GROUP BY Question.Question ,Question.ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFocusgroup" Name="Focus_Group" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="ShowAll" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Question.ID, Question.Question ,COUNT(Responses.Response) AS 'Total submissions', CAST(AVG(Responses.Response) AS DECIMAL(10,2)) AS 'Average Response Value' FROM Responses INNER JOIN Question ON Responses.ID = Question.ID GROUP BY Question.Question,Question.ID">
    </asp:SqlDataSource>


    <br />
    <asp:SqlDataSource ID="CountResponse" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT COUNT(Responses.Response) AS 'Total submissions' FROM Responses INNER JOIN Question ON Responses.ID = Question.ID WHERE (Question.Focus_Group= @Focus_Group) AND (Question.Catagory= @Catagory)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFocusgroup" Name="Focus_Group" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlCatagory" Name="Catagory" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="ShowAll" DataKeyNames="ID" Visible="False">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
            <asp:BoundField DataField="Total submissions" HeaderText="Total submissions" ReadOnly="True" SortExpression="Total submissions" />
            <asp:BoundField DataField="Average Response Value" HeaderText="Average Response Value" ReadOnly="True" SortExpression="Average Response Value" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDSDummary" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Question.ID, Question.Question ,COUNT(Responses.Response) AS 'Total submissions', AVG(Responses.Response) AS 'Average Response Value'FROM Responses INNER JOIN Question ON Responses.ID = Question.ID WHERE (Question.Focus_Group = @Focus_Group) AND (Question.Catagory = @Catagory) GROUP BY Question.Question,Question.ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlFocusgroup" Name="Focus_Group" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlCatagory" Name="Catagory" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Chart ID="Chart2" runat="server" DataSourceID="ShowAll" Visible="False" Height="299px" Width="380px">
        <Series>
            <asp:Series Name="Series1" XValueMember="ID" YValueMembers="Average Response Value">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <br />
    <asp:Button ID="btnBargraph" runat="server" OnClick="btnBargraph_Click" Text="Graph the Average" Height="30px" Width="198px" Visible="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnDetaildDispplay" runat="server" Height="29px" Text="Detail Analysis" Width="196px" OnClick="btnDetaildDispplay_Click" Visible="False" />
    <br /><br />
    <br />
    <asp:Button ID="btnClear" runat="server" BackColor="#999999" BorderColor="#666666" BorderStyle="None" Height="32px" OnClick="btnClear_Click" Text="Clear Summary" Visible="False" Width="103px" style="text-align: left" />
     

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     

    </asp:Content>

