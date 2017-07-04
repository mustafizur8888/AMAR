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
                <label for="txtCGCode" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Group Code</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGCode"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGPerson" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Person</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGPerson"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGName" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Group Name</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGName"></asp:TextBox>
                </div>
            </div>

        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGEmail" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Email</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGEmail"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">


        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGCountry" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Country</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGCountry"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGWeb" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Website</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGWeb"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGAddress" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Address</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGAddress" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGRemarks" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Remarks</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGRemarks" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCGCell" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Cell</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCGCell"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6 col-lg-offset-2 col-md-offset-2" style="padding-left: 2%">
            <div class="form-group ">
                <div class="btn-group">
                    <%--<button type="reset" class="btn btn-danger">Cancel</button>--%>
                    <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-primary" Text="Cancel" OnClick="btnCancel_OnClick"/>
                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_OnClick" />
                    <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdate_OnClick"/>
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_OnClick"/>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-11 col-lg-11 col-sm-12 col-lg-offset-1 col-md-offset-1">
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
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField runat="server" ID="hidRoleID" />
    </div>


</asp:Content>
