<div data-aos="fade-up" class="partners-section" style="background: url(image/<?php echo $sbg; ?>); background-size: contain;">
	<div class="partners-section-inner">
		<h2><?php echo $stitle; ?></h2>
		<h4><?php echo html($stext); ?></h4>

		<div class="ser-contain">
			<?php foreach ($repeater as $i => $rep): ?>
				<div class="ser-inner">
					<a href="index.php?route=information/faq<?php echo $rep['furl']; ?>" ></a>

					<div class="ser-text">
						<h4><?php echo $rep['ftitle']; ?></h4>
					</div>
					<div class="block"></div>
					<img src="image/<?php echo $rep['fimage']; ?>" alt="<?php echo $rep['ftitle']; ?>">
				</div>
			<?php endforeach ?>
		</div>
	</div>
	<div class="arrow-con">
		<a href="<?php echo $surl; ?>" class="btn btn-primary"><?php echo $sbutton; ?></a>
	</div>
</div>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
  function initSlick() {
    $('.ser-contain').slick({
      dots: false,
      infinite: true,
      speed: 500,
      arrows: true,
      pauseOnHover: false,
      autoplay: false,
      slidesToShow: 5,
      responsive: [
      {
        breakpoint: 1023,
        settings: {
          slidesToShow: 5
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
        breakpoint: 375,
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
