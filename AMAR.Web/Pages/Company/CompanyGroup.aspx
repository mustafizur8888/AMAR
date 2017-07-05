<%@ Page Title="Company Group Setup" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CompanyGroup.aspx.cs"
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
            <div class="form-group">
                <label for="txtRemarks" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Status</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <div class="radio-inline">
                        <asp:RadioButton runat="server" ID="rdYes" Text="Active" GroupName="rdStatus" Checked="True"></asp:RadioButton>
                    </div>
                    <div class="radio-inline">
                        <asp:RadioButton runat="server" ID="rdNo" Text="InActive" GroupName="rdStatus"></asp:RadioButton>
                    </div>

                </div>


            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-6 col-sm-12 col-lg-6 col-lg-offset-2 col-md-offset-2" style="padding-left: 2%">
            <div class="form-group ">
                <div class="btn-group">
                    <%--<button type="reset" class="btn btn-danger">Cancel</button>--%>
                    <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-primary" Text="Cancel" OnClick="btnCancel_OnClick" />
                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary" Text="Save" OnClick="btnSave_OnClick" />
                    <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_OnClick" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12 col-lg-12 col-sm-12">
            <asp:GridView ID="grdCompanyGroup" runat="server" CssClass="table table-striped table-hover  table-condensed " AutoGenerateColumns="False" GridLines="None" OnRowCreated="grdCompanyGroup_OnRowCreated" OnSelectedIndexChanged="grdCompanyGroup_OnSelectedIndexChanged">
                <Columns>

                    <asp:TemplateField HeaderText="Group Code">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hideCgRef" Value='<%# Bind("CGRef") %>' />
                            <asp:Label runat="server" ID="lblCGCode" Text='<%# Bind("CGCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Group Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCGName" Text='<%# Bind("CGName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCGCountry" Text='<%# Bind("CGCountry") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Person">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCGPerson" Text='<%# Bind("CGPerson") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cell">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCGCell" Text='<%# Bind("CGCell") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCGEmail" Text='<%# Bind("CGEmail") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Web">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCGWeb" Text='<%# Bind("CGWeb") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField runat="server" ID="hidRoleID" />
    </div>


</asp:Content>
