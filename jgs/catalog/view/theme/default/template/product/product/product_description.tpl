<h3><?= $product_name; ?></h3>
<?php /* completecombo */ ?>
<?php if (isset($salescombopgeoffers)) {  
  foreach($salescombopgeoffers as $offer) { 
    echo html_entity_decode($offer['html']); 
  } 
} ?>
<?php /* completecombo */ ?>
<?php if ($price && !$enquiry) { ?>
  <ul class="list-unstyled price">
    <?php if (!$special) { ?>
        <div class="product-price old-prices"><?php echo $price; ?></div>
    <?php } else { ?>
      <div class="spec">
        <div class="spec-inner">
          <div class="product-special-price new-prices"><?= $special; ?></div>
          <?php if (!empty($logged)): ?>
              <h4 style="margin-bottom: 0; margin-left: 4px"><?php echo $tax_label ?></h4>
          <?php endif ?>
        </div>
        <?php if (!empty($logged)): ?>
          <span class="old-prices">RSP <?= $price; ?></span>
        <?php endif ?>

      </div>
    <?php } ?>

    <?php if ($points) { ?>
      <li><?= $text_points; ?> <?= $points; ?></li>
    <?php } ?>

  </ul>
  <?php if ($discounts) { ?>
    <ul class="discount-con">
      <?php foreach ($discounts as $discount) { ?>
        <li><i>Buy <?= $discount['quantity']; ?><?= $text_discount; ?>,&nbsp;<?= $discount['price']; ?><?php if ($tax_class_id == 3) { ?>
            <h5 style="margin-bottom: 0; margin-left: 4px">exc GST</h5>
          <?php } ?>
        </i></li>
      <?php } ?>
    </ul>
  <?php } ?>
<?php } ?>

<?php if($enquiry){ ?>
  <div class="enquiry-block">
    <div class="label label-primary">
      Enquiry Item
    </div>
  </div>
<?php } ?>

<div class="product-description">
  <?= $description; ?>
</div>

<?php include_once('product_options.tpl'); ?>

<?php if ($review_status) { ?>
  <div class="rating">
    <p>
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($rating < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
      <?php } ?>
      <?php } ?>
      <a href="javascript:;" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?= $reviews; ?></a> / <a href="javascript:;" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?= $text_write; ?></a></p>
  </div>
<?php } ?>