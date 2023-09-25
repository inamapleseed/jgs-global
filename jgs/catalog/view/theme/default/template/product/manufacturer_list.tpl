<?php echo $header; ?>
<div class="container">
  <?php echo $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h2><?php echo $heading_title; ?></h2>

      <?php if ($categories) { ?>
        <div class="brands-cont nav nav-tabs">
          <!-- vinzoi -->
          <?php $ctr = 0;  foreach ($categories as $category) { ?>
            <?php if ($category['manufacturer']) { ?>
                <?php foreach (array_chunk($category['manufacturer'], 4) as $jas => $manufacturers) { ?>

                  <?php foreach ($manufacturers as $manufacturer) { ?>

                    <div class="brand-cont" data-target="#brand-slider<?= $ctr;?>">
                      <div class="overlay">
                        <a data-toggle="tab"></a>
                      </div>
                      <img src="image/<?php echo $manufacturer['image']; ?>" alt="<?php echo $manufacturer['name'] ?>">
                    </div>

                  <?php $ctr++; } ?>
                <?php } ?>
            <?php } ?>
          <?php } ?>
        </div>

      <?php } else { ?>
          <p><?php echo $text_empty; ?></p>
          <div class="buttons clearfix">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
          </div>
      <?php } ?>

      <div class="related_products-m">
        <?php $ctr = 0; foreach ($categories as $mark): ?>
          <?php foreach ($mark['manufacturer'] as $rep): ?>

            <?php if ($rep['mprods']): ?>
              <div id="brand-slider<?= $ctr;?>" hidden class="">
                <h2><?php echo $rep['name'] ?> Products</h2>
                <div class="custom-rel-pro" id="tab-<?php echo $rep['name'] ?>">
                  <?php foreach ($rep['mprods'] as $rep2): ?>
                    <div class="product-gutter custom">
                      <div class="product-block">
                      <?//php echo $rep2['manufacturer_id']; ?> 
                      <div class="product-image">
                        <a class="overlay" target="_blank" href="index.php?route=product/product&product_id=<?php echo $rep2['product_id']; ?>"></a>
                        <?php if ($rep2['image']): ?>
                          <img src="image/<?php echo $rep2['image']; ?>" alt="image">                
                        <?php else: ?>
                          <img src="image/catalog/slicing/general/logo.png" alt="image">                
                        <?php endif ?>
                      </div>

                      <h4>
                        <a href="index.php?route=product/product&product_id=<?php echo $rep2['product_id']; ?>">
                          <?php echo $rep2['name']; ?>
                        </a>
                      </h4>

                      <?php if ($rep2['price'] == 0.00): ?>
                        <span class="label label-primary">
                          Enquiry Item
                        </span>
                        <?php else: ?>
                        <div class="price">S$<?php echo number_format($rep2['price'], 2); ?></div>                
                      <?php endif ?>
                      </div>
                    </div>
                  <?php endforeach ?>
                </div>
              </div>
            <?php endif ?>
          <?php endforeach ?>
        <?php  $ctr++; endforeach ?>
      </div>

    </div>

    <?php echo $column_right; ?></div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
  function initSlick() {
    $('.custom-rel-pro').slick({
      dots: false,
      infinite: true,
      speed: 500,
      arrows: true,
      pauseOnHover: false,
      autoplay: false,
      slidesToShow: 5,
      responsive: [
      {
        breakpoint: 1200,
        settings: {
          slidesToShow: 3
        }
      },
      {
        breakpoint: 767,
        settings: {
        arrows: false,
        autoplay: true,
          slidesToShow: 2
        }
       },
        {
        breakpoint: 539,
        settings: {
        arrows: false,
        autoplay: true,
          slidesToShow: 1
        }
      },
      ],
    prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-left'></i></div></div>",
    nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-right'></i></div></div>",

    });
  }
  initSlick();
</script>
<!-- vinzoi -->
<script type="text/javascript">
  $(".brand-cont").click(function(){

    var target = $(this).data('target');
    var target_slider = target + ' .custom-rel-pro';

    var header_height = $("header").height();

    $(target).fadeIn();

    $(target_slider).slick('setPosition');

    $('html, body').animate({ scrollTop: $(target).offset().top - header_height }, 1000);
  });
</script>