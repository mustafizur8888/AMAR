using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AMAR.Web.Models;

namespace AMAR.Web.Pages.Company
{
    public partial class CompanyGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;
            if (!IsPostBack)
            {

            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {

            }
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {


        }

        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtCGCode.Text))
            {
                msg += "Group code is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGName.Text))
            {
                msg += "Group name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGCountry.Text))
            {
                msg += "Country is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGAddress.Text))
            {
                msg += "Address is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGCell.Text))
            {
                msg += "Cell is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtCGCell.Text))
            {
                if (!Helper.IsPhoneNumber(txtCGCell.Text))
                {
                    msg += "Cell number is not valid" + "<br>";
                }
            }
            if (string.IsNullOrWhiteSpace(txtCGPerson.Text))
            {
                msg += "Contact person is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtCGEmail.Text))
            {
                msg += "Email is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(txtCGEmail.Text))
            {
                if (!Helper.IsEmail(txtCGEmail.Text))
                {
                    msg += "Email address is not valid" + "<br>";

                }
            }
            if (string.IsNullOrWhiteSpace(txtCGEmail.Text))
            {
                msg += "Website is empty" + "<br>";
            }

            if (!string.IsNullOrWhiteSpace(msg))
            {
                result = false;
                ShowErrorMsg(msg);
            }



            return result;
        }

        private void Clear()
        {
            txtCGCode.Text = string.Empty;
            txtCGName.Text = string.Empty;
            txtCGCountry.Text = string.Empty;
            txtCGAddress.Text = string.Empty;
            txtCGCell.Text = string.Empty;
            txtCGPerson.Text = string.Empty;
            txtCGEmail.Text = string.Empty;
            txtCGWeb.Text = string.Empty;
            txtCGRemarks.Text = string.Empty;



        }
        private void ShowErrorMsg(string msg)
        {
            lblError.Text = msg;
            divError.Visible = true;
        }
        private void ShowSuccMsg(string msg)
        {
            lblSuccess.Text = msg;
            divSucc.Visible = true;
        }

    }
}