<%@ Page Title="Module Setup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules.aspx.cs" Inherits="AMAR.Web.Pages.Menu.Modules" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row">
        <div class="alert  alert-danger text-center" runat="server" id="divError">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <asp:Label runat="server" ID="lblError"></asp:Label>
        </div>
        <div class="alert  alert-success text-center" runat="server" id="divSucc">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <asp:Label runat="server" ID="lblSuccess"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="ddlMenu" class="col-lg-2 col-md-2 control-label text-right">Menu</label>
            <div class="col-lg-4 col-md-6">
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlMenu"></asp:DropDownList>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="ddlSubMenu" class="col-lg-2 col-md-2 control-label text-right">Sub-Menu</label>
            <div class="col-lg-4 col-md-6">
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSubMenu"></asp:DropDownList>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtMdCode" class="col-lg-2 col-md-2 control-label text-right">Module Code</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMdCode"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtMdName" class="col-lg-2 col-md-2 control-label text-right">Module Name</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMdName"></asp:TextBox>
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtMdUrl" class="col-lg-2 col-md-2 control-label text-right">Module Url</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMdUrl"></asp:TextBox>
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtRemarks" class="col-lg-2 col-md-2 control-label text-right">Status</label>
            <div class="col-lg-4 col-md-6">
                <div class="radio-inline">
                    <asp:RadioButton runat="server" ID="rdYes" Text="Active" GroupName="rdStatus" Checked="True"></asp:RadioButton>
                </div>
                <div class="radio-inline">
                    <asp:RadioButton runat="server" ID="rdNo" Text="InActive" GroupName="rdStatus"></asp:RadioButton>
                </div>
            </div>
        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtRemarks" class="col-lg-2 col-md-2 control-label text-right">Remarks</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtRemarks"></asp:TextBox>
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-3 col-md-offset-3">
            <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_OnClick" />
            <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_OnClick" />
        </div>
    </div>
    <br />

</asp:Content>
