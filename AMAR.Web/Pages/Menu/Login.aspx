<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AMAR.Web.Pages.Menu.Login" %>

<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Flat HTML5/CSS3 Login Form</title>
  
  
  
    <%--<link rel="stylesheet" href="css/style.css">--%>
<link href="../../Content/styleLogin.css" rel="stylesheet" />
  
</head>

<body>
<div class="login-page">
    <div class="form">
        <div class="row">


            <div class="alert  alert-danger text-center" runat="server" id="divError">
                <asp:Label runat="server" Text="Wrong info given" ForeColor="red" ID="lblError"></asp:Label>
            </div>
           

        </div>
        <form class="register-form">
            <input type="text" placeholder="name"/>
            <input type="password" placeholder="password"/>
            <input type="text" placeholder="email address"/>
            <button>create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
        </form>

        <form class="login-form" runat="server">
            <input type="text" runat="server" id="txtUname" placeholder="username"/>
            <input type="password" runat="server" id="txtpwd" placeholder="password"/>
            <asp:Button runat="server" Text="LoginTEST" ID="loging" OnClick="loging_OnClick"/>
           
           
        </form>
    </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<%--<script src="js/index.js"></script>--%>
<script src="../../Content/login.js"></script>
</body>
</html>
