<div class="custom-outer-con">
  <div id="slideshow<?= $module; ?>" class="relative owl-carousel"  style="opacity: 1;">
    <?php foreach ($banners as $banner) { ?>
      <div class="relative h100">
        <img data-src="<?= $banner['image']; ?>" alt="<?= $banner['title']; ?>" class="img-responsive hidden-xs owl-lazy" />
        <img data-src="<?= $banner['mobile_image']; ?>" alt="<?= $banner['title']; ?>" class="img-responsive visible-xs owl-lazy" />
        <?php if($banner['description']){ ?>
          <div class="slider-slideshow-description w100 absolute position-center-center background-type-<?= $banner['theme']; ?>">
            <div class="container">
              <div class="slider-slideshow-description-texts">
                <?= $banner['description']; ?>

                <?php if ( $banner['link'] && $banner['link_text'] ) { ?>
                <div class="slider-slideshow-description-link">
                  <a href="<?= $banner['link']; ?>" class="btn btn-primary">
                    <?= $banner['link_text']; ?>
                  </a>
                </div>
                <!--class:slider-slideshow-description-link-->
                <?php } ?>
              </div>
              <!--class:slider-slideshow-description-texts-->
            </div>
            <!--class:container-->
          </div>
          <!--class:slider-slideshow-description-->
        <?php } ?>
        
     <!--    <?php if($banner['link']){ ?>
          <a href="<?= $banner['link']; ?>" class="block absolute position-left-top w100 h100"></a>
        <?php } ?> -->
        
      </div>
    <?php } ?>
  </div>
  <?php //include('slideshow_script_slick.tpl'); ?>
  <?php include('slideshow_script_owl.tpl'); ?>

  <div class="custom-container">
    <?php foreach ($customize['repeater'] as $jason => $rep): ?>
      <div class="custom-inner" data-aos="fade-up">
        <a href="<?php echo $rep['hurl']; ?>" class="overlay" target="_blank"></a>
        <img src="image/<?php echo $rep['himage']; ?>" alt="image">
        <div class="ctexts">
          <a href="<?php echo $rep['hurl']; ?>" class="overlay two" target="_blank"></a>
          <h3><?php echo $rep['htitle']; ?></h3>
          <a href="<?php echo $rep['hurl']; ?>" class="btn btn-primary" target="_blank"><?php echo $rep['hbutton']; ?><i class="fa fa-chevron-right"></i></a>
        </div>
      </div>
    <?php endforeach ?>
  </div>
</div>