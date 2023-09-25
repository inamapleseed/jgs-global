<div id="footer-area">
	<footer>
		<div class="curve"><div class="inner-curve"></div></div>

		<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

		<link href="catalog/view/javascript/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />

		<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
		<link href="catalog/view/theme/default/stylesheet/sass/mystylesheet.css" rel="stylesheet">

		<?php /* // combined to combined.min.css ?>
		<!-- <link href="catalog/view/javascript/smartmenus/sm-core-css.min.css" rel="stylesheet"> --> <!--Added in sidr_bare_sm_core_css_sass_icon.css -->
		<link href="catalog/view/javascript/smartmenus/sm-blue.min.css" rel="stylesheet">
		<!-- <link href="catalog/view/javascript/side-menu-sidr/stylesheets/sidr.bare.min.css" rel="stylesheet"> --> <!--Added in sidr_bare_sm_core_css_sass_icon.css -->
		<link href="catalog/view/javascript/jquery-multi-level-accordion-menu/css/style.min.css" rel="stylesheet">

		<link href="catalog/view/theme/default/stylesheet/normalize.min.css" rel="stylesheet">
		<!-- <link href="catalog/view/theme/default/stylesheet/sass/icon.min.css" rel="stylesheet"> --> <!--Added in sidr_bare_sm_core_css_sass_icon.css -->
		<link href="catalog/view/theme/default/stylesheet/sidr_bare_sm_core_css_sass_icon.css" rel="stylesheet">

		<link href="catalog/view/javascript/aos/aos.css" rel="stylesheet">

		<link href="catalog/view/javascript/sweetalert2.min.css" rel="stylesheet">
		<?php */ // combined to combined.min.css ?>

		<?php /* seldom use */ /* ?>
		<link href="catalog/view/theme/default/stylesheet/animate.min.css" rel="stylesheet">
		<?php */ ?>

		<link href="catalog/view/theme/default/stylesheet/combined.min.css" rel="stylesheet">

		<link href="catalog/view/theme/default/stylesheet/sass/helper.min.css" rel="stylesheet">
		<link href="catalog/view/theme/default/stylesheet/sass/custom.min.css" rel="stylesheet">
		<link href="catalog/view/theme/default/stylesheet/pagination-breadcrumb.css" rel="stylesheet">

		<?php if($class != 'common-home') { ?>
		<link href="catalog/view/theme/default/stylesheet/slsoffr.min.css" rel="stylesheet">
		<?php } ?>

		<?php foreach ($styles as $style) { ?>
			<link href="<?=$style['href']; ?>" type="text/css" rel="<?=$style['rel']; ?>" media="<?=$style['media']; ?>" />
		<?php } ?>

		<script defer="defer" src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@17.3.0/dist/lazyload.min.js"></script>
		<script>
		$(window).load(function() {
			var lazyLoadInstance = new LazyLoad({
			// Your custom settings go here
			});
		});
		</script>

		<div class="container">
			<div class="footer-upper-contet">

				<div class="footer-contact-info">
					<h5><?= $store; ?></h5>
					<div>
						<?php echo $comment; ?>
					</div>
					<div class="about-s">
						<a href="index.php?route=information/information&information_id=4">Read More<i class="fa fa-chevron-right"></i></a>
					</div>
				</div>

				<?php if ($menu) { ?>
					<?php foreach($menu as $menu_count => $links){ ?>
					<div class="footer-contact-links" id="id<?php echo $menu_count; ?>">
						<h5>
							<?php if($links['href'] != '#'){ ?>
							<?= $links['name']; ?>
							<?php }else{ ?>
							<a href="<?= $links['href']; ?>" 
								<?php if($links['new_tab']){ ?>
									target="_blank"
								<?php } ?>
								>
								<?= $links['name']; ?></a>
							<?php } ?>
						</h5>
						<?php if($links['child']){ ?>
						<ul class="list-unstyled">
							<?php foreach ($links['child'] as $each) { ?>
							<li><a href="<?= $each['href']; ?>"
								<?php if($each['new_tab']){ ?>
									target="_blank"
								<?php } ?>
								
								>
									<?= $each['name']; ?></a></li>
							<?php } ?>
						</ul>
						<?php } ?>
					</div>
					<?php } ?>
				<?php } ?>

				<div class="newsletter-section">
					<?= $mailchimp; ?>
					<?php if($social_icons){ ?>
						<div class="footer-social-icons">
							<?php foreach($social_icons as $icon){ ?>
								<?php if ($icon['title'] !== "Telegram"): ?>
								<?php if ($icon['title'] !== "WhatsApp"): ?>
									<a href="<?= $icon['link']; ?>" title="<?= $icon['title']; ?>" alt="<?= $icon['title']; ?>" target="_blank">
										<img data-src="<?= $icon['icon']; ?>" title="<?= $icon['title']; ?>" class="img-responsive lazy" alt="<?= $icon['title']; ?>" />
									</a>
								<?php endif ?>
								<?php endif ?>
							<?php } ?>
						</div>
					<?php } ?>
				</div>
			</div>
			
			<div class="footer-bottom row">
				<div class="col-xs-12 col-sm-6">
					<p><?= $powered; ?></p>
				</div>
				<div class="col-xs-12 hidden col-sm-6 text-sm-right">
					<p><?= $text_fcs; ?></p>
				</div>
			</div>
		</div>
	</footer>
</div>
<div id="ToTopHover" ></div>

<?php if(isset($update_price_status) && $update_price_status) { ?>
	<script type="text/javascript">
    $(".product-inputs input[type='checkbox']").click(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".product-inputs input[type='radio']").click(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".product-inputs select").change(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".product-inputs .input-number").blur(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    $(".product-inputs .input-number").parent(".input-group").find(".btn-number").click(function() {
      var product_id = $(this).data('product-id');
      changePrice(product_id);
    });
    function changePrice(product_id) {
      $.ajax({
        url: 'index.php?route=product/product/updatePrice&product_id=' + product_id,
        type: 'post',
        dataType: 'json',
        data: $('#product-'+ product_id + ' input[name=\'quantity\'], #product-'+ product_id + ' select, #product-'+ product_id + ' input[type=\'checkbox\']:checked, #product-'+ product_id + ' input[type=\'radio\']:checked'),
        success: function(json) {
          $('.alert-success, .alert-danger').remove();
          if(json['new_price_found']) {
            $('.product-price-'+product_id+' .price .price-new').html(json['total_price']);
            $('.product-price-'+product_id+' .price .price-tax').html(json['tax_price']);
          } else {
            $('.product-price-'+product_id+' .price .price-new').html(json['total_price']);
            $('.product-price-'+product_id+' .price .price-tax').html(json['tax_price']);
          }
        }
      });
    }
	</script>
<?php } ?>

<script>
	$(window).load(function(){
		AOS.init({
			once: true
		});
	});
</script>
<!-- <script async src="https://telegram.org/js/telegram-widget.js?14" data-telegram-login="fordevonly" data-size="large" data-userpic="false" data-auth-url="" data-request-access="write"></script> -->
	<?php if($social_icons){ ?>
		<div class="floating-social-icons">
			<?php foreach($social_icons as $icon2){ ?>
				<?php if ($icon2['title'] === 'WhatsApp'): ?>
					<a class="web-whatsapp" style="display: none;" href="http://web.whatsapp.com/send?phone=<?= $icon2['link']; ?>" title="<?= $icon2['title']; ?>" alt="<?= $icon2['title']; ?>" target="_blank">
						<img src="<?= $icon2['icon']; ?>" title="<?= $icon2['title']; ?>" class="img-responsive" alt="<?= $icon2['title']; ?>" />
					</a>					
					<a class="phone-whatsapp" style="display: none;" href="http://api.whatsapp.com/send?phone=<?= $icon2['link']; ?>" title="<?= $icon2['title']; ?>" alt="<?= $icon2['title']; ?>" target="_blank">
						<img src="<?= $icon2['icon']; ?>" title="<?= $icon2['title']; ?>" class="img-responsive" alt="<?= $icon2['title']; ?>" />
					</a>					
				<?php endif ?>
			<?php } ?>
			<?php foreach($social_icons as $icon2){ ?>
				<?php if ($icon2['title'] === 'Telegram'): ?>
					<a href="https://web.telegram.org/#/im?p=<?= $icon2['link']; ?>" title="<?= $icon2['title']; ?>" alt="<?= $icon2['title']; ?>" target="_blank">
						<img data-src="<?= $icon2['icon']; ?>" title="<?= $icon2['title']; ?>" class="img-responsive lazy" alt="<?= $icon2['title']; ?>" />
					</a>			
				<?php endif ?>
			<?php } ?>
		</div>
	<?php } ?>
<script type="text/javascript">
	if ($(window).width() < 768) {
		$('.phone-whatsapp').show();
	}
	if ($(window).width() > 768) {	
		$('.web-whatsapp').show();
	}
	$('.checkout-cart .buttons .pull-left a').addClass('btn-primary');
	$('.account-edit .buttons .pull-left a').addClass('btn-primary');
	$('.account-address .buttons .pull-left a').addClass('btn-primary');
	$('.cart-dorpdown-footer .btn-default').addClass('btn-primary');
	$('.glyphicon-plus').removeClass('glyphicon');	
</script>
<script type="text/javascript">
  let count = $('.product-count').html();
  let sorta = $('.sorts').html();
  let reso = $(window).width();

  if (reso > 1200) {
    $(".product-count-2").prepend(count);

    $(".product-count").hide();
  }
</script>

<?php 
/* extension bganycombi - Buy Any Get Any Product Combination Pack */
echo $bganycombi_module; 
?>
</body></html>