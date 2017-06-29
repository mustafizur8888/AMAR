<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubMenu.aspx.cs" MasterPageFile="~/Site.Master" Inherits="AMAR.Web.Pages.Menu.SubMenu" %>

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
            <label for="txtSmcode" class="col-lg-2 col-md-2 control-label text-right">SM Code</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtSmcode"></asp:TextBox>
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtSmName" class="col-lg-2 col-md-2 control-label text-right">SM Name</label>
            <div class="col-lg-4 col-md-6">
                <asp:TextBox runat="server" CssClass="form-control" ID="txtSmName"></asp:TextBox>
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="ddlMenu" class="col-lg-2 col-md-2 control-label text-right">Menu Name</label>
            <div class="col-lg-4 col-md-6">
                <%--<asp:TextBox runat="server" CssClass="form-control" ID="TextBox1"></asp:TextBox>--%>
                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlMenu" />
            </div>

        </div>

    </div>
    <br />
    <div class="row">
        <div class="form-group col-lg-offset-1 col-md-offset-1">
            <label for="txtRemarks" class="col-lg-2 col-md-2 control-label text-right">SubMenu Status</label>
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

            <%--<button type="reset" class="btn btn-danger">Cancel</button>--%>
            <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_OnClick" />
            <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_OnClick" />


        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-8 col-lg-8 col-sm-12 col-lg-offset-1 col-md-offset-1">
            <asp:GridView ID="grdSubMenu" runat="server" CssClass="table table-striped table-hover  table-condensed " AutoGenerateColumns="False" GridLines="None">
                <Columns>

                    <asp:TemplateField HeaderText="SM Code">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblSubMenuCode" Text='<%# Bind("SMCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SM Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblSubMenuName" Text='<%# Bind("SMName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblSubStatus" Text='<%# Bind("SMStatus") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hidRefNo" Value='<%# Bind("RefNo") %>' />
                            <asp:HiddenField runat="server" ID="hidMenuCode" Value='<%# Bind("MenuCode") %>' />
                            <asp:HiddenField runat="server" ID="hidMenuRef" Value='<%# Bind("MenuRef") %>' />
                            <asp:HiddenField runat="server" ID="hidRemarks" Value='<%# Bind("SMRemarks") %>' />
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

