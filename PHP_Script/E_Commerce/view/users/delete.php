<div class="row">
  <div class="col-lg-6">
    <section class="panel">
      <header class="panel-heading">
        <h1>Delete user</h1>
        <a href="?c=users">Back</a>
      </header>
      <div class="panel-body">
        <form action="?c=users&a=Delete" method="POST">
          <input type="hidden" name="id" id="id" value="<?= $MODEL->getId() ?>" />
          <dl class="dl-horizontal">
          <dt>User</dt><dd><?= $MODEL->getUsername() ?></dd>
          <dt>Email</dt><dd><?= $MODEL->getEmail() ?></dd>
          <dt>Name</dt><dd><?= $MODEL->getName() ?></dd>
          <dt>LastName</dt><dd><?= $MODEL->getLastname() ?></dd>
          <dt>Identification</dt><dd><?= $MODEL->getIdCard() ?></dd>
          <dt>Phone</dt><dd><?= $MODEL->getPhone() ?></dd>
          <dt>Role</dt><dd><?= $MODEL->getRole() ?></dd>
          </dl>
          <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> Delete </button>
        </form>
      </div>
    </section>
  </div>
</div>