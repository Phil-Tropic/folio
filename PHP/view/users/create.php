<div class="row">
  <div class="col-lg-12">
    <section class="panel">
      <header class="panel-heading">
        <h1>Create user</h1>
        <a href="?c=users">Back</a>
      </header>
      <div class="panel-body">
        <form action="?c=users&a=Create" method="POST" autocomplete="off">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="username">User</label>
              <input type="text" class="form-control" id="username" name="username" placeholder="User">
            </div>
            <div class="form-group col-md-4">
              <label for="password">Password</label>
              <input type="text" class="form-control" id="password" name="password" placeholder="Password">
            </div>
            <div class="form-group col-md-4">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="julesCesar@gmail.com">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
                <label for="name">Name</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="Name">
            </div>
            <div class="form-group col-md-6">
              <label for="lastName">LastName</label>
              <input type="text" class="form-control" id="lastName" name="lastName" placeholder="LastName">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="idCard">Identification</label>
              <input type="text" class="form-control" id="idCard" name="idCard" placeholder="Identification">
            </div>
            <div class="form-group col-md-4">
              <label for="phone">Phone</label>
              <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone">
            </div>
            <div class="form-group col-md-2">
              <label for="role">Role</label>
              <select name="role" id="role" class="form-control">
                <option value="CLIENT" selected="selected">Client</option>
                <option value="ADMIN">Admin</option>
              </select>
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-4">
              <button type="submit" class="btn btn-primary"><i class="fa fa-user-plus"></i> Create </button>
            </div>
          </div>
        </form>
      </div>
    </section>
  </div>
</div>