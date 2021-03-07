<div id="sidebar-wrapper" class="harmonic">
  <ul class="sidebar-nav">
    <li class="sidebar-brand">
      <a href="#">
        Happy new year, <?=(Security::GetLoggedUser() != null ? Security::GetLoggedUser()->getName() : 'Invited')?>!
      </a>
    </li>
    <?php if (Security::UserIsLoggedIn()) { ?>

      <?php if ((Security::GetLoggedUser())->getRole() == 'ADMIN') { ?>
        <li>
          <a href="?c=users" class="<?=(($PAGE == 'Users') ? 'active' : '')?>">
            <i class="fa fa-building" aria-hidden="true"></i> &nbsp;User
          </a>
        </li>
        <li>
          <a href="?c=sales" class="<?=(($PAGE == 'Sales') ? 'active' : '')?>">
            <i class="fa fa-history" aria-hidden="true"></i>&nbsp;Sales
          </a>
        </li>
      <?php } else { ?>
        <li>
          <a href="?c=users&a=Edit&id=<?=(Security::GetLoggedUser())->getId()?>" class="<?=(($PAGE == 'Users') ? 'active' : '')?>">
            <i class="fa fa-building" aria-hidden="true"></i>&nbsp;My account
          </a>
        </li>
        <li>
          <a href="?c=sales" class="<?=(($PAGE == 'Sales') ? 'active' : '')?>">
            <i class="fa fa-history" aria-hidden="true"></i>&nbsp;Purchase history
          </a>
        </li>
      <?php } ?>
      <li>
        <a href="?c=articles" class="<?=(($PAGE == 'Articles') ? 'active' : '')?>">
          <i class="fa fa-product-hunt" aria-hidden="true"></i>&nbsp;Articles
        </a>
      </li>
    <?php } ?>
  </ul>
</div>