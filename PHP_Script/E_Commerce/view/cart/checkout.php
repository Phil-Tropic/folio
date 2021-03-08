<div class="row">
  <div class="col-lg-6">
    <section class="panel">
      <header class="panel-heading">
        <h1>Confirmation required</h1>
        <a href="?c=cart">Back</a>
      </header>
      <div class="panel-body">
        <div class="alert alert-info">
        By continuing you agree to make the purchase of the following items:
        </div>
        <ul>
          <?php foreach($MODEL as $article) { ?>
            <li>
              <b><?=$article->getBrand()?> - <?=$article->getDescription()?>: </b><?=$article->getPrice()?>
            </li>
          <?php } ?>
        </ul>
        <div>
          <b>Total:</b> <?= array_sum(array_map(function ($element) { return $element->getPrice(); }, $MODEL));?>
        </div>
        <div class="m-top15">
          <form action="?c=cart&a=ConfirmCheckout" method="POST">
            <button type="submit" class="btn btn-block btn-lg btn-success"><i class="fa fa-shield"></i> Make a purchase</button>
          </form>  
        </div>
    </section>
  </div>
</div>