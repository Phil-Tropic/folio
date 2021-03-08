<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TP4.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
       <title>Login Page</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"/>

    <link href="../styles/style.css" rel="stylesheet" />
</head>

<body>
    <div class="row">
        <div class="col-2 d-none d-lg-block tests"></div>
        <div class="col" id="section">
            <div class="row" id="rowNav">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="../Default.aspx" aria-haspopup="true" aria-expanded="false">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Gallery</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Blog</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Contact.aspx">Contact</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="Login.aspx">Login</a>
        </li>
    </ul>
    </div>
</nav>
</div>

            <form id="formLogin" runat="server">
                <div id="divLogin">

                    <div id="divUsername">
                        <asp:Label  ID="lblUsername" runat="server" Text="Username"/>
                        <asp:TextBox ID="txtboxUsername" runat="server" type="text"/>
                    </div>
                  
                    <div id="divPassword">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"/>
                        <asp:TextBox ID="txtboxPassword" runat="server" type="password"/>
                    </div>
     
                    <asp:Button ID="btnLogin" type="submit" runat="server" Text="Sign In" OnClick="btnLogin_Click"/>
                </div>
             </form>
        </div>
        <div class="col-2 d-none d-lg-block tests"></div>
    </div>


 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>
