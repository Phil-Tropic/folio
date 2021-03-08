<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP4.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Accueil</title>
    <meta charset="utf-8" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link href="../styles/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
 <div id="divcentre">
             
              <nav class="navbar navbar-expand-lg navbar-light bg-light">
           
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Default.aspx" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home</a>
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
                        <a class="nav-link" href="pages/Contact.aspx">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="pages/Login.aspx">Login</a>
                    </li>
                </ul>
             </div>
            </nav>

     
              <div id="divsearch">
                  <div id="divsearchleft">
                      <h3>Safari Adventure</h3>
                  </div>
                  <div id="divsearchright">
                      <i id="iconsearch" class="fas fa-search"></i>
                  </div>
              </div>

              <div id="divcarousel">

                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="images/<%= img1%>" alt="First slide"/>
                            <div class="carousel-content">
                                <h1><%= titre1 %></h1>
                                <h2><%= soustitre1 %></h2>
                            </div>
                        </div>
                     <div class="carousel-item">
                            <img class="d-block w-100" src="images/<%= img2 %>" alt="Second slide"/>
                        </div>
                            <div class="carousel-item">
                            <img class="d-block w-100" src="images/<%= img3 %>" alt="Third slide"/>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
  

                  <div class="card" style="width: 18rem;">
                      <div class="card-header"><h3><%= titre1 %></h3></div>
                    <img class="card-img-top" src="<%= imgCard1 %>" alt="Card image cap"/>

                    <div class="card-body">
                        <h5 class="card-title"><%= soustitre1 %></h5>
                        <p class="card-text"><%= txt1 %></p>
                       <a class = "btn" href = "https://google.com" style="color: #FFFFFF; float:right; background-color: #FF9900;">more &raquo;</a>
                    </div>
                  </div>

                  <div class="card" style="width: 18rem;">
                    <div class="card-header"><h3><%= titre2 %></h3></div>
                    <img class="card-img-top" src="<%= imgCard2 %>" alt="Card image cap"/>

                    <div class="card-body">
                        <h5 class="card-title"><%= soustitre2 %></h5>
                        <p class="card-text"><%= txt2 %></p>
                       <a class = "btn" href = "https://google.com" style="color: #FFFFFF; float:right; background-color: #FF9900;">more &raquo;</a>
                    </div>
                  </div>

                 <div class="card" style="width: 18rem;">
                     <div class="card-header"><h3><%= titre3 %></h3></div>
                    <img class="card-img-top" src="<%= imgCard3 %>" alt="Card image cap"/>

                    <div class="card-body">
                        <h5 class="card-title"><%= soustitre3 %></h5>
                        <p class="card-text"><%= txt3 %></p>
                      <a class = "btn" href = "https://google.com" style="color: #FFFFFF; float:right; background-color: #FF9900;">more &raquo;</a>
                    </div>
                 </div>
            </div>

        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
