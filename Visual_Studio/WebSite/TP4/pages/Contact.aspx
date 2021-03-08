<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TP4.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Contact Page</title>

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
  
                <div id="bandeTitre" class="row">
                    <div class="col-12">
                        <div class="row">
                            <div  class="col-10 titre" >
                                    
      
                    </div>
                    <div id="btn" class="col-2 titre">
                        <form>
                            <button id="btnRecherche" type="submit"><i style="font-size:medium;" class="fas fa-search"></i></button>

                        </form>
                            
                    </div>

                        </div>

                    </div>
                        
                </div>

                <div class ="row" id="containerContact">
                    <div class="col-4" id="infosContact">
                        <div class="row" id="adressRow">
                            <div class="col">
                                <div class="row">
                                    <h6 id="titreAdress">ADRESS: </h6><br />
                                </div>
                                <div class="row">
                                    <p id="textAdress"><i class="fas fa-home" id="iconhome"></i>3030 Rue Hochelaga, Montréal, QC H1W 1G2</p><br />
                                </div>
                            </div>    
                        </div>

                        <div class="row" id="phonesRow">
                            <div class="col">
                                <div class="row">
                                    <h6 id="titrePhones">PHONES: </h6><br />
                                </div>
                                <div class="row">
                                    <p id="textPhones"><i class="fas fa-phone-alt" id="iconPhone"></i> (514) 526-2501</p><br />
                                </div>
                                <div class="row">
                                    <p id="textFax"><i class="fas fa-fax" id="iconFax"></i> 1-514-526-9192 </p><br />
                                </div>
                            </div>    
                        </div>

                        <div class="row" id="emailRow">
                                <div class="col">
                                <div class="row">
                                    <h6 id="titreEmail">ADRESS:</h6><br />
                                </div>
                                <div class="row">
                                    <p id="textEmail"><i class="fas fa-envelope" id="iconEmail"></i> info@teccart.com</p><br />
                                </div>
                                <div class="row">
                                    <p id="textEmail2"> INFO </p><a id="vcardLink"href="https://www.facebook.com/teccart">F</a><br />
                                </div>
                            </div>        
                        </div>
                    </div>


                    <div class="col-8">
                        <form name="contact" id="formContact">
                                <div class="row">
                                    <div class="col-12">
                                        <h6 id="titreContact">MISCELLANEOUS INFORMATION: </h6>
                                        <p id="textContact">Email us with any questions or inquiries or use our contact data.</p>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <input type="text" class="form-control" id="inputName" placeholder="Name"required />
                                    </div>

                                    <div class="form-group col-md-4">
                                        <input type="email" class="form-control" id="inputEmail" placeholder="Email"required />
                                    </div>

                                    <div class="form-group col-md-4">
                                        <input type="tel" class="form-control" id="inputTel" placeholder="Phone" required />
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-12">
                                        <textarea class="form-control" rows="3" id="inputMessage" placeholder="Message" required></textarea>
                                    </div>     
                                </div>
                                <%--boutons --%>
                                <div class="row" id="boutonsRow">
                                        <input type="button"id="btnSend" value="Send" onclick="validate();" class="btn btn-warning">
                                        <input id="btnClear" type="button" onclick="clearMsg();" value="Clear" class="btn btn-warning">
                                </div>
                        </form>
                    </div>
            </div>    
                    
        </div>
        <div class="col-2 d-none d-lg-block tests"></div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="../scripts/function.js"></script>

</body>
</html>
