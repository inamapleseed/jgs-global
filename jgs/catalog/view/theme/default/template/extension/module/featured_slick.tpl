<div data-aos="fade-up" class="featured-module featured_<?= $uqid; ?>" style="background: url(image/<?php echo $bg_image; ?>); background-repeat: no-repeat; background-size: cover;">
  <h2 class="text-center target-heading">
    <?= $heading_title; ?>
  </h2>

  <div class="custom-con hidden">
    <img src="image/<?php echo $custom_image; ?>" alt="image">
    <div class="custom-c-texts">
      <h2><?php echo $heading_title; ?></h2>
      <h4><?php echo $description; ?></h4>
    </div>
  </div>

  <script type="text/javascript">
    if ($('body').hasClass('common-home')) {
      $(".custom-con").removeClass('hidden');
    }
  </script>

  <div class="featured section relative" style="opacity: 0;">
    <div id="featured_slider_<?= $uqid; ?>" >
      <?php foreach ($products as $product) { ?>
        <?= html($product); ?>
      <?php } ?>
    </div>
    <script type="text/javascript">

      $(window).load(function(){
        setTimeout(function () {
          featured_product_slick<?= $uqid; ?>();
          AOS.init();
        }, 250);
      });

      function featured_product_slick<?= $uqid; ?>(){
        $("#featured_slider_<?= $uqid; ?>").on('init', function (event, slick) {
          $('#featured_slider_<?= $uqid; ?>').parent().removeAttr('style');
        });

        $("#featured_slider_<?= $uqid; ?>").slick({
          dots: false,
          infinite: false,
          speed: 300,
          slidesToShow: 5,
          slidesToScroll: 1,
          responsive: [
            {
              breakpoint: 1201,
              settings: {
                slidesToShow: 4,
              }
            },
            {
              breakpoint: 993,
              settings: {
                slidesToShow: 3,
              }
            },
            {
              breakpoint: 769,
              settings: {
                slidesToShow: 2,
              }
            },
            {
              breakpoint: 541,
              settings: {
                slidesToShow: 2,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 5000
              }
            },
            {
              breakpoint: 415,
              settings: {
                slidesToShow: 1,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 5000
              }
            },
            {
              breakpoint: 376,
              settings: {
                slidesToShow: 1,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 5000
              }
            }
          ],
          prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-left fa-2em'></i></div></div>",
          nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-right fa-2em'></i></div></div>",
        });

        
      }
    </script>
  </div>
</div>

<script type="text/javascript">
  
</script>