<div data-aos="fade-up" class="custom-contact-con">
  <div class="contact-deets">
    <div class="deets-inner">
      <img src="image/<?php echo $cbg; ?>" alt="image">
      <h2><?php echo $ctitle; ?></h2>

      <div>
          <div class="address">
            <address style="position: relative"><i class="fa fa-map-marker"></i><div style="opacity: 0; height: 100%; position: absolute; top: 0; left: 0; right: 0; bottom: 0"><?php echo $gmap_iframe; ?></div><?php echo $address; ?></address>
          </div>

          <div class="tel">
            <i class="fa fa-phone"></i><a href="tel:<?= $store_telephone; ?>" alt="<?= $store_telephone; ?>" title="<?= $store_telephone; ?>" ><?= $store_telephone; ?></a><br />
          </div>

          <div class="email">
            <i class="fa fa-envelope"></i><a href="mailto:<?php echo $store_email; ?>"><?php echo $store_email; ?></a>
          </div>
      </div>
    </div>

  </div>

  <div class="form-con">
    <div class="form-desc">
      <?php echo html($description); ?>
    </div>
    <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
      <div class="contact-body">
        <div class="form-group required">
          <input type="text" name="name2" value="<?= $name2; ?>" placeholder="Name" id="input-name2" class="form-control"/>
          <?php if ($error_name2) { ?>
            <div class="text-danger"><?= $error_name2; ?></div>
          <?php } ?>                
        </div>
      
        <div class="form-group required">
          <input type="text" name="subject2" value="<?= $subject2; ?>" placeholder="Company" id="input-subject2" class="form-control" />
          <?php if ($error_subject2) { ?>
            <div class="text-danger"><?= $error_subject2; ?></div>
          <?php } ?>
        </div>
      
        <div class="form-group required">
          <input type="tel" name="telephone2" value="<?= $telephone2; ?>" placeholder="Contact" id="input-telephone2" class="form-control input-number"/>
          <?php if ($error_telephone2) { ?>
            <div class="text-danger"><?= $error_telephone2; ?></div>
          <?php } ?>
        </div>
      
        <div class="form-group required">
          <input type="text" name="email2" value="<?= $email2; ?>" placeholder="Email" id="input-email2" class="form-control"/>
          <?php if ($error_email2) { ?>
            <div class="text-danger"><?= $error_email2; ?></div>
          <?php } ?>
        </div>

        <div class="form-group required">
          <textarea name="enquiry2" rows="5" placeholder="Enquiry" id="input-enquiry2" class="form-control" ><?= $enquiry2; ?></textarea>
          <?php if ($error_enquiry2) { ?>
            <div class="text-danger"><?= $error_enquiry2; ?></div>
          <?php } ?>
        </div>

      </div>
      <div class="contact-footer text-center">
        <?= $captcha; ?>
        <div class="the-button">
          <input class="btn btn-primary pull-sm-right" type="submit" value="<?= $button_submit; ?>" />
        </div>
      </div>
    </form>
  </div>
</div>