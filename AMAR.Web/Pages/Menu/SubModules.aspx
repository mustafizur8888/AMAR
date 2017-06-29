<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubModules.aspx.cs" MasterPageFile="~/Site.Master" Inherits="AMAR.Web.Pages.Menu.SubModules" %>

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
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlMenu" AutoPostBack="True" OnSelectedIndexChanged="ddlMenu_OnSelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="ddlSubMenu" class="col-lg-2 col-md-2 control-label text-right">Sub-Menu</label>
            <div class="col-lg-4 col-md-6">
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlSubMenu" AutoPostBack="True" OnSelectedIndexChanged="ddlSubMenu_OnSelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="ddlSubMenu" class="col-lg-2 col-md-2 control-label text-right">Module</label>
            <div class="col-lg-4 col-md-6">
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlModule" AutoPostBack="True" OnSelectedIndexChanged="ddlModule_OnSelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtSubMdCode" class="col-lg-2 col-md-2 control-label text-right">SubModule Code</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtSubMdCode"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtSubMdName" class="col-lg-2 col-md-2 control-label text-right">SubModule Name</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtSubMdName"></asp:TextBox>
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtSubMdUrl" class="col-lg-2 col-md-2 control-label text-right">SubModule Url</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtSubMdUrl"></asp:TextBox>
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
            <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_OnClick" />
            <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_OnClick" />
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-8 col-lg-8 col-sm-12 col-lg-offset-1 col-md-offset-1">
            <asp:GridView ID="grdSubModules" runat="server" CssClass="table table-striped table-hover  table-condensed " AutoGenerateColumns="False" GridLines="None">
                <Columns>

                    <asp:TemplateField HeaderText="SubModule Code">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblMdCode" Text='<%# Bind("MSCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SubModule Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblMdName" Text='<%# Bind("MSName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblStatus" Text='<%# Bind("MSStatus") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hidRefNo" Value='<%# Bind("RefNo") %>' />
                            <asp:HiddenField runat="server" ID="hidRemarks" Value='<%# Bind("MSRemarks") %>' />
                            <asp:HiddenField runat="server" ID="hidMdUrl" Value='<%# Bind("MSUrl") %>' />
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
