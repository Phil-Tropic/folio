<div class="row">
  <div class="col-lg-6">
    <section class="panel">
      <header class="panel-heading">
        <h1>Item details</h1>
        <a href="?c=articles">Back</a>
      </header>
      <div class="panel-body">
        <dl class="dl-horizontal">
          <dt>Code</dt><dd><?= $MODEL->getCode() ?></dd>
          <dt>Brand</dt><dd><?= $MODEL->getBrand() ?></dd>
          <dt>Description</dt><dd><?= $MODEL->getDescription() ?></dd>
          <dt>Price</dt><dd><?= $MODEL->getPrice() ?></dd>
          <dt>Quantity</dt><dd><?= $MODEL->getQuantity() ?></dd>
        </dl>
      </div>
    </section>
  </div>
</div>