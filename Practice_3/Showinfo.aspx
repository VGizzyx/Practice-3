<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Showinfo.aspx.cs" Inherits="Practice_3.Showinfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                    <asp:BoundField DataField="YearOfBirth" HeaderText="Год рождения" SortExpression="YearOfBirth" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" SelectCommand="SELECT * FROM [Customers]" DeleteCommand="Delete from Customers where Id = @Id" InsertCommand="Insert into Customers(Name,Surname,YearOfBirth) values (@Name, @Surname, @YearOfBirth)" UpdateCommand="Update Customers set Name=@Name, Surname=@Surname,YearOfBirth=@YearOfBirth where Id=@Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox4" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox5" Name="Surname" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox6" Name="YearOfBirth" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="Name" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="Surname" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="YearOfBirth" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Добавить заказчика" />
&nbsp;<asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Редактировать заказчиков" />
&nbsp;<asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Удалить заказчиков" />
&nbsp;<asp:Panel ID="Panel2" runat="server" Visible="False">
                Имя заказчика:
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                Фамилия заказчика:
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <br />
                Год рождения заказчика:
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Добавить" />
                &nbsp;<asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Отменить" />
            </asp:Panel>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Название товара" SortExpression="Title" />
                    <asp:BoundField DataField="idCust" HeaderText="Номер заказчика" ReadOnly="True" SortExpression="idCust" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Quant" HeaderText="Количество" SortExpression="Quant" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" DeleteCommand="Delete from Orders where id = @id" InsertCommand="Insert into Orders (Title,idCust,Price,Quant) values (@Title, @idCust, @Price, @Quant)" SelectCommand="SELECT * FROM [Orders] WHERE ([idCust] = @idCust)" UpdateCommand="Update Orders set Title=@Title,idCust=@idCust,Price=@Price,Quant=@Quant where id =@id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView1" Name="idCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Quant" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="idCust" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView1" Name="idCust" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Price" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Quant" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView2" Name="id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Добавить заказ" />
&nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Редактировать заказы" />
&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Удалить заказ" />
            <br />
            <br />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            <asp:Panel ID="Panel1" runat="server" Visible="False">
                Название товара:&nbsp;
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                Цена:&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                Количество:&nbsp;
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Добавить" />
                &nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Отменить" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
