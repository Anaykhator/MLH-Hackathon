<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminDisp.aspx.cs" Inherits="AdminDisp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
    <Columns>
    <asp:BoundField DataField="cat" HeaderText="Category" />
    <asp:BoundField DataField="lat" HeaderText="Latitude" />
    <asp:BoundField DataField="long" HeaderText="Longitude" />
    <asp:BoundField DataField="Img" HeaderText="Image" />

    <%--<asp:BoundField DataField="freq" HeaderText="Complaints"  />--%>

    <asp:TemplateField HeaderText="Action">
        <ItemTemplate>
        
        <asp:Image ID="img1" runat=server ImageUrl='<%# "Img/"+Eval("Img").ToString() %>' Width="150px" Height="150px" />
        
            
        </ItemTemplate>
        
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
    
    <br />
    <asp:Button ID="Button1" runat="server" Text="See Complaints" onclick="Button1_Click" />
</asp:Content>



