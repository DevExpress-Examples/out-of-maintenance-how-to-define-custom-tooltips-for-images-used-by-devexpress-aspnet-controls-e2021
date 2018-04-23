Imports Microsoft.VisualBasic
Imports System
Imports System.Configuration

Public Class DemoSettings
	Private Shared isSiteMode_Renamed As Object
	Public Const ReadOnlyErrorMessage As String = "<b>Data modifications are not allowed in the online demo.</b><br>" & "If you need to test data editing functionality, please install the " & "ASPxGridView on your machine and run the demo locally."

	Public Shared ReadOnly Property IsSiteMode() As Boolean
		Get
			If isSiteMode_Renamed IsNot Nothing Then
				Return CBool(isSiteMode_Renamed)
			End If
			Dim val As String = ConfigurationManager.AppSettings("SiteMode")
			isSiteMode_Renamed = val = "true"
			Return CBool(isSiteMode_Renamed)
		End Get
	End Property

	Public Shared Sub AssertNotReadOnly()
		If IsSiteMode Then
			Throw New InvalidOperationException(ReadOnlyErrorMessage)
		End If
	End Sub
End Class