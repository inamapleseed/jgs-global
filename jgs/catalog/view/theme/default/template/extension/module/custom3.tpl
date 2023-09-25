<div class="about-container">
	<?php foreach ($repeater as $i => $rep): ?>
		<div class="about-inner-cont">
			<h2><?php echo $rep['title']; ?></h2>

			<div class="text-con">
				<?php echo html($rep['text']); ?>

				<div class="button-con">
					<a href="<?php echo $rep['url'] ?>" class="btn btn-primary"><?php echo $rep['button_name']; ?></a>
				</div>
			</div>
		</div>
	<?php endforeach ?>

	<h2 class="h2-2"><?php echo $stitle; ?></h2>
	<div class="our-team">
		<?php foreach ($teammates as $jh => $mate): ?>
			<div class="teammate-container">
				<div class="img-con">
					<img src="image/<?php echo $mate['timage']; ?>" alt="<?php echo $mate['tname']; ?>">
				</div>
				<div class="mate-deets">
					<h3><?php echo $mate['tname']; ?></h3>
					<h4><?php echo $mate['tjob']; ?></h4>
					<div class="p">
						<?php echo html($mate['tdesc']); ?>
					</div>
				</div>
			</div>
		<?php endforeach ?>
	</div>

</div>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
  function initSlick() {
    $('.our-team').slick({
      dots: false,
      infinite: true,
      speed: 500,
      arrows: true,
      pauseOnHover: false,
      autoplay: false,
      slidesToShow: 3,
      responsive: [
      {
        breakpoint: 1200,
        settings: {
          slidesToShow: 2
        }
      },
      {
        breakpoint: 767,
        settings: {
	      arrows: false,
	      autoplay: true,
          slidesToShow: 1
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

<script type="text/javascript">
	// let slickheight = $(".custom3 .slick-list").height();
	// console.log(slickheight);
	// $(".custom3 .slick-slide").css("height", "100%");
	// $('.custom3 .slick-slide').css("height", slickheight);
</script>