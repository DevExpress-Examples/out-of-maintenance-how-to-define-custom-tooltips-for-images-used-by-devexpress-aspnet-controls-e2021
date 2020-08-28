<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=B88D1754D700E49A" Namespace="DevExpress.Web" TagPrefix="dx" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Tooltips example</title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    ASPxNavBar (A tooltip for the item image is defined - "Discount 5%"):
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxNavBar ID = "navBar" runat = "server">
                        <Groups>
                            <dx:NavBarGroup Text="Mitsubishi">
                                <Items>
                                    <dx:NavBarItem Text="Outlander" />
                                    <dx:NavBarItem Text="Lancer" />
                                    <dx:NavBarItem Text="Colt">
                                        <Image ToolTip="Discount 5%" Url="img/discount.png"/>
                                    </dx:NavBarItem>
                                </Items>
                            </dx:NavBarGroup>
                            <dx:NavBarGroup Expanded="False" Text="Mercedes"/>
                            <dx:NavBarGroup Text="BMW"/>
                       </Groups>
                   </dx:ASPxNavBar>
                </td>
            </tr>
            <tr>
                <td>
                    <br /><br /><br />ASPxCalendar (Tooltips for navigation buttons are defined - "Prev Year", "Prev Month", "Next Month", "Next Year", "Next Ten Years", "Prev Ten Years"):
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxCalendar ID = "calendar" runat = "server">
                        <NextMonthImage ToolTip="Next Month"/>
                        <PrevYearImage ToolTip="Prev Year"/>
                        <PrevMonthImage ToolTip="Prev Month"/>
                        <NextYearImage ToolTip="Next Year"/>
                        <FastNavNextYearImage ToolTip="Next Ten Years"/>
                        <FastNavPrevYearImage ToolTip="Prev Ten Years" />
                    </dx:ASPxCalendar>
                 </td>
            </tr>
            <tr>
                <td>
                    <br /><br /><br />ASPxSpinEdit (Tooltips for the editor's custom button and spin buttons are defined - "Clear Value", "Increment Value", "Decrement Value"):
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxSpinEdit ID = "ASPxSpinEdit1" runat = "server" ClientInstanceName = "clientSpinEdit">
                        <SpinButtons>
                            <IncrementImage ToolTip="Increnemt Value"/>
                            <DecrementImage ToolTip="Decrenent Value"/>
                        </SpinButtons>
                        <Buttons>
                            <dx:EditButton>
                                <Image ToolTip="Clear Value" Url="img/clear-value.png"  />
                            </dx:EditButton>
                        </Buttons>
                        <ClientSideEvents ButtonClick="function(s, e) {
	                        if(e.buttonIndex == 0) s.SetValue(null);
                        }" />
                    </dx:ASPxSpinEdit>
                </td>
            </tr>
            <tr>
                <td>
                    <br /><br /><br />ASPxGridView (Tooltips for the command column's buttons are defined - "Edit", "Clone Record", "Update", "Cancel"):
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" 
                                     KeyFieldName="EmployeeID" AutoGenerateColumns="False" Width="100%" 
                                     OnCustomButtonCallback="grid_CustomButtonCallback" OnInitNewRow="grid_InitNewRow">
                        <Columns>
                            <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" ShowEditButton="True">
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="Copy" Text="Clone">
                                        <Image ToolTip="Clone Record" Url="img/clone.png"/>
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                                <EditFormSettings VisibleIndex="0" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataColumn FieldName="Title" VisibleIndex="4">
                                <EditFormSettings VisibleIndex="1" />
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataMemoColumn FieldName="Notes" Visible="False">
                                <EditFormSettings RowSpan="4" Visible="True" VisibleIndex="2" />
                            </dx:GridViewDataMemoColumn>
                            <dx:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
                                <EditFormSettings VisibleIndex="3" />
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
                                <EditFormSettings VisibleIndex="4" />
                            </dx:GridViewDataColumn>
                            <dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
                                <EditFormSettings VisibleIndex="5" />
                            </dx:GridViewDataColumn>
                        </Columns>
                        <SettingsEditing EditFormColumnCount="3" />
                        <SettingsPager PageSize="5" >
                            <FirstPageButton>
                                <Image ToolTip="First Page">
                                </Image>
                            </FirstPageButton>
                            <LastPageButton>
                                <Image ToolTip="Last Page">
                                </Image>
                            </LastPageButton>
                            <NextPageButton>
                                <Image ToolTip="Next Page">
                                </Image>
                            </NextPageButton>
                            <PrevPageButton>
                                <Image ToolTip="Prev Page">
                                </Image>
                            </PrevPageButton>
                        </SettingsPager>        
                        <Styles>
                            <CommandColumn Spacing="2px" />
                        </Styles>
                        <SettingsCommandButton>
                            <EditButton>
                                <Image ToolTip="Edit" Url="img/edit.png"/>
                            </EditButton>
                            <CancelButton>
                                <Image ToolTip="Cancel" Url="img/cancel.png"/>
                            </CancelButton>
                            <UpdateButton>
                                <Image ToolTip="Update" Url="img/update.png"/>
                            </UpdateButton>
                        </SettingsCommandButton>
                   </dx:ASPxGridView>
                             
                   <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
                                         OnDeleting="AccessDataSource1_Modifying" OnInserting="AccessDataSource1_Modifying" OnUpdating="AccessDataSource1_Modifying"
                                         SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Photo], [Extension], [Notes] FROM [Employees]" 
                                         DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = ?" 
                                         InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [BirthDate], [HireDate], [Notes]) VALUES (?, ?, ?, ?, ?, ?)" 
                                         UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [Title] = ?, [BirthDate] = ?, [HireDate] = ?, [Notes] = ? WHERE [EmployeeID] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="EmployeeID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="BirthDate" Type="DateTime" />
                            <asp:Parameter Name="HireDate" Type="DateTime" />
                            <asp:Parameter Name="Notes" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="BirthDate" Type="DateTime" />
                            <asp:Parameter Name="HireDate" Type="DateTime" />
                            <asp:Parameter Name="Notes" Type="String" />
                        </InsertParameters>
                   </asp:AccessDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
