Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Collections
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxHeadline
Imports DevExpress.Web.ASPxCallback
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Private copiedValues As Hashtable = Nothing
	Private copiedFields() As String = { "FirstName", "Title", "Notes", "LastName", "BirthDate", "HireDate" }
	Protected Sub AccessDataSource1_Modifying(ByVal sender As Object, ByVal e As SqlDataSourceCommandEventArgs)
		DemoSettings.AssertNotReadOnly()
	End Sub

	Protected Sub grid_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
		If e.ButtonID <> "Copy" Then
			Return
		End If
		copiedValues = New Hashtable()
		For Each fieldName As String In copiedFields
			copiedValues(fieldName) = grid.GetRowValues(e.VisibleIndex, fieldName)
		Next fieldName
		grid.AddNewRow()

	End Sub
	Protected Sub grid_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)
		If copiedValues Is Nothing Then
			Return
		End If
		For Each fieldName As String In copiedFields
			e.NewValues(fieldName) = copiedValues(fieldName)
		Next fieldName
	End Sub



End Class
