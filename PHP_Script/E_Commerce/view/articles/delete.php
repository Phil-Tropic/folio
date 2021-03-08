<div class="row">
  <div class="col-lg-6">
    <section class="panel">
      <header class="panel-heading">
        <h1>Delete item</h1>
        <a href="?c=articles">Back</a>
      </header>
      <div class="panel-body">
        <form action="?c=articles&a=Delete" method="POST">
          <input type="hidden" name="id" id="id" value="<?= $MODEL->getId() ?>" />
          <dl class="dl-horizontal">
            <dt>Code</dt><dd><?= $MODEL->getCode() ?></dd>
            <dt>Brand</dt><dd><?= $MODEL->getBrand() ?></dd>
            <dt>Description</dt><dd><?= $MODEL->getDescription() ?></dd>
            <dt>Price</dt><dd><?= $MODEL->getPrice() ?></dd>
            <dt>Quantity</dt><dd><?= $MODEL->getQuantity() ?></dd>
          </dl>
          <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i> Delete </button>
        </form>
      </div>
    </section>
  </div>
</div>