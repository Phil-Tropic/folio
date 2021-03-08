<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TP4.Admin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
        <title>Admin Page</title>

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
            <form runat="server" id="formMessagerie">
                <div id="divMessages">

                    <div class="row">
                        <div class="col-12">
                            <h6 id="titreContact">Message</h6>
                            <p id="textContact"></p>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <input type="text" class="form-control msgInfo" id="inputName" value="<%= name %>" placeholder="Name" required />
                        </div>
                        <div class="form-group col-md-4">
                            <input type="email" class="form-control msgInfo" id="inputEmail" value="<%= email %>" placeholder="Email"required />
                        </div>
                        <div class="form-group col-md-4">
                            <input type="tel" class="form-control msgInfo" id="inputTel" value="<%= phone %>" placeholder="Phone" required />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-12">
                            <textarea runat="server" class="form-control msgInfo" rows="3" id="userMessage" placeholder="Message" required></textarea>
                        </div>     
                    </div>

                    <div class="form-row">
                        <div class="form-group col-12">
                            <textarea runat="server" class="form-control" rows="3" id="inputRep" placeholder="Réponse" ></textarea>
                        </div>     
                    </div>
    
                    <div class="row" id="boutonsRow">
                            <input runat="server" type="button" id="btnSend" value="Send" onserverclick="btnSend_ServerClick" class="btn btn-warning" />
                            <input id="btnClear" type="button" onclick="clearMsg();" value="Clear" class="btn btn-warning">
                            <input runat="server" id="btnPrev" type="button" onserverclick="btnPrev_ServerClick" value="Prev" class="btn btn-warning" />       
                            <input runat="server" id="btnNext" type="button" onserverclick="btnNext_ServerClick" value="Next" class="btn btn-warning" />
                    </div>


                </div>
                <%--Fin divMessages--%>
                <div id="divAddImgAndUpdatePosition">
                    <div class="row">
                    <div class="col-12">
                        <%-- Titre de la section d'ajout d'image --%>
                        <div class="row">
                            <div class="col">
                                <h5>Ajout d'une image</h5>
                                <hr/>
                            </div>
                        </div>
                        <%-- Boutons d'ajout d'image --%>       
                        <div class="row">
                            <div class="col">     
                                <input type="file" id="btnFile" runat="server" />
                                <input type="button" id="btnUpload" value="Upload"  runat="server" onserverclick="btnUpload_Click"/>         
                            </div>
                         </div>
                        <br />
                        <hr />
                        <br />


                        <div class="row">
                            <div class="col">
                                <h5>Pour chnager le carousel</h5>
                                <hr/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <asp:GridView ID="GridViewImg" CssClass="grid" runat="server" AutoGenerateColumns="false"  ShowHeader="false"  OnRowCommand="GridViewImg_RowCommand">  
                                    <Columns>  

                                        <asp:BoundField DataField="imgName" HeaderText="nom" />  
                                        <asp:ImageField DataImageUrlField="url" ControlStyle-Height="200" ControlStyle-Width="400" HeaderText="Images" /> 
                                        <asp:BoundField DataField="positionCarrousel" ControlStyle-Height="200" ControlStyle-Width="400" HeaderText="Images" /> 
                                        <asp:TemplateField>

                                            <ItemTemplate>
                                                <asp:Button id="btnOpt1" Text="1" runat="server" CommandName="set1" CommandArgument="<%# Container.DataItemIndex %>"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button id="btnOpt2" Text="2" runat="server" CommandName="set2" CommandArgument="<%# Container.DataItemIndex %>"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button id="btnOpt3" Text="3" runat="server" CommandName="set3" CommandArgument="<%# Container.DataItemIndex %>"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>  
                                </asp:GridView> 

                                </div>
                            </div>
                       </div>
                   </div>
                </div>

                <div id="divSelectVoyage">
                    <div class="row">
                    <div class="col-12">


                        <div class="row">
                            <div class="col">
                                <h5>option pour les voyages</h5>
                                <hr/>
                            </div>
                        </div>

       
                        <div class="row">
                        <div class="col">

       

                        <asp:GridView ID="GridViewVoy" CssClass="grid" runat="server" AutoGenerateColumns="false"  ShowHeader="false"  OnRowCommand="GridViewVoy_RowCommand">  
                            <Columns>  
                                <asp:BoundField DataField="Id" HeaderText="id" visible="true" />  
                                <asp:BoundField DataField="titre" HeaderText="titre" />  
                                <asp:BoundField DataField="soustitre" ControlStyle-Height="200" ControlStyle-Width="400" HeaderText="soustitre" /> 
                                <asp:BoundField DataField="texte" ControlStyle-Height="200" ControlStyle-Width="400" HeaderText="texte" /> 
                                <asp:BoundField DataField="cardPosition" ControlStyle-Height="200" ControlStyle-Width="400" HeaderText="cardPosition" /> 
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button id="btnVoy1" Text="1" runat="server" CommandName="Voy1" CommandArgument="<%# Container.DataItemIndex %>"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button id="btnVoy2" Text="2" runat="server" CommandName="Voy2" CommandArgument="<%# Container.DataItemIndex %>"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button id="btnVoy3" Text="3" runat="server" CommandName="Voy3" CommandArgument="<%# Container.DataItemIndex %>"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>  
                        </asp:GridView> 
                        </div>
                        </div>
                       </div>
                   </div>
                   </div>

                <div id="divAddVoyage">
                    <div class="row">
                    <div class="col-12">

                        <div class="row">
                            <div class="col">
                                <h5>Pour ajouter un voyage voyage</h5>
                                <hr/>
                            </div>
                        </div>
                    </div>

                        <div class="row">
                            <div class="col">
                                <input runat="server" type="text" id="newtitre" class="addvoyage" placeholder="Titre" />
                                <input runat="server" type="text" id="newsoustitre" class="addvoyage" placeholder="Sous-titre" />
                                <input runat="server" type="text" id="newtexte" class="addvoyage" placeholder="Texte" />
                                <input runat="server" type="file" id="btnImgFile" class="addvoyage" placeholder="Image" />
                                <input runat="server" type="button" id="btnAddVoyage" value="Add Voyage" class="addvoyage" onserverclick="btnAddVoyage_ServerClick" />
                            </div>
                        </div>
                     </div>
                 </div>
            </form>
        </div>
        <div class="col-2 d-none d-lg-block tests"></div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="../scripts/function.js"></script>

</body>
</html>
