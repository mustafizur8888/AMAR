<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyGroup.aspx.cs" 
    Inherits="AMAR.Web.Pages.Company.CompanyGroup" %>

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
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="ddlCpGroup" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Group</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCpGroup" AutoPostBack="True" />

                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPWeb" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Web</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPWeb"></asp:TextBox>
                </div>
            </div>
        </div>


    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPCode" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Code</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPCode"></asp:TextBox>
                </div>
            </div>

        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPCell" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Cell</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPCell"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">


        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPName" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Name</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPName"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPEmail" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Email</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPEmail"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPCountry" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Country</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPCountry"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCpRemarks" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Remarks</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCpRemarks" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPAddress" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Address</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPAddress" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
        </div>
    </div>
    <br />



</asp:Content>
