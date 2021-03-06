<div class="row">
  <div class="col-lg-12">
    <section class="panel">
      <header class="panel-heading">
        <h1>Create article</h1>
        <a href="?c=articles">Back</a>
      </header>
      <div class="panel-body">
        <form action="?c=articles&a=Create" method="POST" autocomplete="off">
          <div class="form-row">
            <div class="form-group col-md-4">
              <label for="code">Code</label>
              <input type="text" class="form-control" id="code" name="code" placeholder="Code">
            </div>
            <div class="form-group col-md-4">
              <label for="brand">Brand</label>
              <input type="text" class="form-control" id="brand" name="brand" placeholder="Brand">
            </div>
            <div class="form-group col-md-4">
              <label for="description">Description</label>
              <input type="text" class="form-control" id="description" name="description" placeholder="Description">
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-6">
                <label for="price">Price</label>
                <input type="text" class="form-control" id="price" name="price" placeholder="Price">
            </div>
            <div class="form-group col-md-6">
              <label for="quantity">Quantity</label>
              <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Quantity">
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-4">
              <button type="submit" class="btn btn-primary"><i class="fa fa-cart-plus"></i> Create </button>
            </div>
          </div>
        </form>
      </div>
    </section>
  </div>
</div>