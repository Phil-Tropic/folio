<div class="row">
  <div class="col-lg-12">
    <section class="panel">
      <header class="panel-heading">
        <?php if ((Security::GetLoggedUser())->getRole() == 'ADMIN') { ?>
          <h1>Modify user</h1>
          <a href="?c=users">Back</a>
        <?php } else { ?>
          <h1>My account</h1>
        <?php } ?>
      </header>
      <div class="panel-body">
        <form action="?c=users&a=Edit" method="POST" autocomplete="off">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="username">User</label>
              <input value="<?= $MODEL->getUsername() ?>" type="text" class="form-control" id="username" name="username" placeholder="User" <?=(Security::GetLoggedUser())->getRole() == 'CLIENT' ? 'disabled="disabled"' : ''?>>
            </div>
            <div class="form-group col-md-4">
              <label for="password">Password</label>
              <input value="<?= $MODEL->getPassword() ?>" type="text" class="form-control" id="password" name="password" placeholder="Password">
            </div>
            <div class="form-group col-md-4">
                <label for="email">Email</label>
                <input value="<?= $MODEL->getEmail() ?>" type="email" class="form-control" id="email" name="email" placeholder="julesCesar@gmail.com">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
                <label for="name">Name</label>
              <input value="<?= $MODEL->getName() ?>" type="text" class="form-control" id="name" name="name" placeholder="Name">
            </div>
            <div class="form-group col-md-6">
              <label for="lastName">Last Name</label>
              <input value="<?= $MODEL->getLastname() ?>" type="text" class="form-control" id="lastName" name="lastName" placeholder="LastName">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="idCard">Identification</label>
              <input value="<?= $MODEL->getIdCard() ?>" type="text" class="form-control" id="idCard" name="idCard" placeholder="Identification">
            </div>
            <div class="form-group col-md-4">
              <label for="phone">Phone</label>
              <input value="<?= $MODEL->getPhone() ?>" type="text" class="form-control" id="phone" name="phone" placeholder="Phone">
            </div>
            <div class="form-group col-md-2">
              <label for="role">Role</label>
              <select name="role" id="role" class="form-control" <?=(Security::GetLoggedUser())->getRole() == 'CLIENT' ? 'disabled="disabled"' : ''?>>
                <option value="CLIENT" <?= $MODEL->getRole() === 'CLIENT' ? 'selected="selected"' : ''?>>Client</option>
                <option value="ADMIN" <?= $MODEL->getRole() === 'ADMIN' ? 'selected="selected"' : ''?>>Admin</option>
              </select>
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-4">
              <input type="hidden" name="id" id="id" value="<?= $MODEL->getId() ?>" />
              <button type="submit" class="btn btn-primary"><i class="fa fa-pencil"></i>Edit </button>
            </div>
          </div>
        </form>
      </div>
    </section>
  </div>
</div>