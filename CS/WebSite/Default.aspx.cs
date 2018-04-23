using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Collections;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e) {
     
    }
    Hashtable copiedValues = null;
    string[] copiedFields = new string[] { "FirstName", "Title", "Notes", "LastName", "BirthDate", "HireDate" };
    protected void AccessDataSource1_Modifying(object sender, SqlDataSourceCommandEventArgs e) {
        DemoSettings.AssertNotReadOnly();
    }

    protected void grid_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e) {
        if(e.ButtonID != "Copy")
            return;
        copiedValues = new Hashtable();
        foreach(string fieldName in copiedFields) {
            copiedValues[fieldName] = grid.GetRowValues(e.VisibleIndex, fieldName);
        }
        grid.AddNewRow();

    }
    protected void grid_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e) {
        if(copiedValues == null)
            return;
        foreach(string fieldName in copiedFields) {
            e.NewValues[fieldName] = copiedValues[fieldName];
        }
    }



}
