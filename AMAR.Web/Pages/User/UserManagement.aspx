<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="UserManagement.aspx.cs" MasterPageFile="~/Site.Master" Inherits="AMAR.Web.Pages.User.UserManagement" %>

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
                <label for="ddlCpGroup" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">User CG Code</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCgCode" AutoPostBack="True" />
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPWeb" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">User CP Code</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCpCode" AutoPostBack="True" />

                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
      
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPCell" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">User Name</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUserName"></asp:TextBox>
                </div>
            </div>
        </div>
        
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPEmail" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">User Email</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUserEmail"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row">


        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtCPName" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">Password</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtpwd"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtUserCell" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">User Cell no.</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUserCell"></asp:TextBox>
                </div>
            </div>
        </div>
     
      
    </div>
    <br />
    <div class="row">


        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtUserCode" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">UserCode</label>
                <div class="col-lg-8 col-md-8 col-sm-12">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUserCode"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-lg-6">
            <div class="form-group">
                <label for="txtRemarks" class="col-lg-4 col-md-4 col-sm-12 control-label text-right">User Status</label>
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
    <br />
    <div class="row">
        <div class="col-md-12 col-lg-12 col-sm-12">
            <asp:GridView ID="grdUserList" runat="server" CssClass="table table-striped table-hover  table-condensed " AutoGenerateColumns="False" GridLines="None" OnRowCreated="grdUserList_OnRowCreated" OnSelectedIndexChanged="grdUserList_OnSelectedIndexChanged">
                <Columns>

                    <asp:TemplateField HeaderText="Group Code">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hideUserRef" Value='<%# Bind("UserRef") %>' />
                            <asp:Label runat="server" ID="lblCGCode" Text='<%# Bind("UserCGCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Company Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCpCode" Text='<%# Bind("UserCPCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblUserName" Text='<%# Bind("UserName") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Cell">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblUserCell" Text='<%# Bind("UserCell") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Email">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblUserEmail" Text='<%# Bind("UserEmail") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Code">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbluserCode" Text='<%# Bind("UserCode") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        <asp:HiddenField runat="server" ID="hidRoleID" />
    </div>


</asp:Content>
