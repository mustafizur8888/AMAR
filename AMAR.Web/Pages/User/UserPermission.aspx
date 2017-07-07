<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPermission.aspx.cs" Inherits="AMAR.Web.Pages.User.UserPermission" %>

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
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="ddlCpGroup" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Group</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCpGroup" AutoPostBack="True" OnSelectedIndexChanged="ddlCpGroup_OnSelectedIndexChanged" />
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="ddlCompRefNo" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCompRefNo" AutoPostBack="True" OnSelectedIndexChanged="ddlCompRefNo_OnSelectedIndexChanged" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="ddlMenu" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Menu</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlMenu" AutoPostBack="True" OnSelectedIndexChanged="ddlMenu_OnSelectedIndexChanged" />
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="ddlSubMenu" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Sub Menu</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSubMenu" AutoPostBack="True" OnSelectedIndexChanged="ddlSubMenu_OnSelectedIndexChanged" />
                </div>
            </div>
        </div>
    </div>
    <br /> 
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="ddlUser" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">User</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlUser" AutoPostBack="True" OnSelectedIndexChanged="ddlUser_OnSelectedIndexChanged" />
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
         
        </div>
    </div>
    <br />  
   

</asp:Content>
