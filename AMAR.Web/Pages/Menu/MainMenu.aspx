<%@ Page Title="Main Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="AMAR.Web.Pages.Menu.MainMenu" %>

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
            <label for="txtMenuCode" class="col-lg-2 col-md-2 control-label text-right">Menu Code</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMenuCode"></asp:TextBox>
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtMenuName" class="col-lg-2 col-md-2 control-label text-right">Menu Name</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtMenuName"></asp:TextBox>
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
                <asp:TextBox runat="server" CssClass="form-control" ID="txtRemarks" TextMode="MultiLine"></asp:TextBox>
            </div>

        </div>

    </div>

    <br />
    <div class="row">
        <div class="form-group col-lg-offset-3 col-md-offset-3">
         
                <button type="reset" class="btn btn-danger">Cancel</button>
                <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_OnClick" />
           

        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-8 col-lg-8 col-sm-12 col-lg-offset-1 col-md-offset-1">
            <asp:GridView ID="grdMenu" runat="server" CssClass="table table-striped table-hover  table-condensed " AutoGenerateColumns="False" GridLines="None">
                <Columns>

                    <asp:TemplateField HeaderText="Menu Code">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblMenuCode" Text='<%# Bind("MenuCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Menu Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblMenuName" Text='<%# Bind("MenuName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" Text='<%# Bind("MenuStatus") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hidRefNo" Value='<%# Bind("RefNo") %>' />
                            <asp:HiddenField runat="server" ID="hidRemarks" Value='<%# Bind("MenuRemarks") %>' />
                            <div class="btn-group btn-group-sm">
                                <asp:Button runat="server" CssClass="btn btn-primary btn-sm " Text="Edit" ID="btnEdit" OnClick="btnEdit_OnClick" />
                                <asp:Button runat="server" CssClass="btn btn-danger  btn-sm" Text="Delete" ID="btnDelete" OnClick="btnDelete_OnClick" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField runat="server" ID="hidRoleID" />
    </div>


</asp:Content>

