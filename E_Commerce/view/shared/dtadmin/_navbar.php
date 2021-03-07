<nav class="navbar navbar-default">
  <div class="container-fluid">
   
    <div class="navbar-header">
      <button 
      type="button" 
      class="navbar-toggle collapsed" 
      data-toggle="collapse" 
      data-target="#bs-example-navbar-collapse-1"
      aria-expanded="false">
        <span class="sr-only">Navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#menu-toggle" id="menu-toggle">
        <i class="fa fa-arrow-left" aria-hidden="true"></i>
      </a>
      <a class="navbar-brand" href="#">StoreApp</a>
    </div>
    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      <ul class="nav navbar-nav navbar-right">
        <?php if (Security::GetLoggedUser() != null && ShoppingCartSession::ShoppingCartExists()) { 
                $cart = ShoppingCartSession::GetShoppingCart(); ?>
          <li>
            <a href="?c=cart">
              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              &nbsp;
              <?=count($cart->articles)?> items in cart
            </a>
          </li>
        <?php } ?>
        <li><a href="?c=authentication&a=Logout"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Sign off</a></li>
      </ul>
    </div>
  </div>
</nav>