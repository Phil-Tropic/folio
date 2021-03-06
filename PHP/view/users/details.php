<div class="row">
  <div class="col-lg-6">
    <section class="panel">
      <header class="panel-heading">
        <h1>User info</h1>
        <a href="?c=users">Back</a>
      </header>
      <div class="panel-body">
        <dl class="dl-horizontal">
          <dt>User</dt><dd><?= $MODEL->getUsername() ?></dd>
          <dt>Email</dt><dd><?= $MODEL->getEmail() ?></dd>
          <dt>Name</dt><dd><?= $MODEL->getName() ?></dd>
          <dt>LastName</dt><dd><?= $MODEL->getLastname() ?></dd>
          <dt>Identification</dt><dd><?= $MODEL->getIdCard() ?></dd>
          <dt>Phone</dt><dd><?= $MODEL->getPhone() ?></dd>
          <dt>Role</dt><dd><?= $MODEL->getRole() ?></dd>
        </dl>
      </div>
    </section>
  </div>
</div>