<%@ Page Title="Company" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs"
    Inherits="AMAR.Web.Pages.Company.Company"  EnableEventValidation="false" %>

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
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCpGroup" AutoPostBack="True" OnSelectedIndexChanged="ddlCpGroup_OnSelectedIndexChanged" />

                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPPerson" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Person</label>
                <div class="col-lg-8 col-md-8 col-sm-12">

                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPPerson"></asp:TextBox>
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
                <label for="txtCPName" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Name</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPName"></asp:TextBox>
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
                <label for="txtCPCountry" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Country</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPCountry"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPEmail" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Email</label>
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
                <label for="txtCPAddress" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Company Address</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCPAddress" TextMode="MultiLine"></asp:TextBox>
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
    <br />
    <div class="row">
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
        <div class="col-md-6 col-sm-12 col-lg-6">
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
    <div class="row">
        <div class="col-md-12 col-lg-12 col-sm-12" style="overflow: auto">
            <asp:GridView ID="grdCompany" runat="server" CssClass="table table-striped table-hover  table-condensed " AutoGenerateColumns="False" GridLines="None" OnRowCreated="grdCompany_OnRowCreated" OnSelectedIndexChanged="grdCompany_OnSelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Code">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hideCPRef" Value='<%# Bind("CPRef") %>' />
                            <asp:Label runat="server" ID="lblCPCode" Text='<%# Bind("CPCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCPName" Text='<%# Bind("CPName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCPCountry" Text='<%# Bind("CPCountry") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Person">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCPPerson" Text='<%# Bind("CPPerson") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cell">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCPCell" Text='<%# Bind("CPCell") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCPEmail" Text='<%# Bind("CPEmail") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Web">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCPWeb" Text='<%# Bind("CPWeb") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCPStatus" Text='<%# Bind("CPStatus") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>
        </div>

    </div>


</asp:Content>
