<div class="container">
  <div class="row">
    <div class="col-sm-6 col-sm-offset-6 col-md-4 col-md-offset-4">
      <div class="account-wall">
        <img class="profile-img" src="assets/dtadmin/images/userneedslogin.png" alt="User needs login">
        <form class="form-signin" action="?c=authentication&a=Login" method="POST" >
          <input type="text" class="form-control" placeholder="Username" name="USERNAME" required autofocus />
          <input type="password" class="form-control" placeholder="Password" name="PASSWORD" required />
          <button class="btn btn-lg btn-primary btn-block" type="submit">ENTER</button>
          <?php if ($MODEL != null) { ?>
            <?=$MODEL->getMessage()?>
          <?php } ?>
        </form>
      </div>
    </div>
  </div>
</div>