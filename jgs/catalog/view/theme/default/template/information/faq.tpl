<?php echo $header; ?>
<div class="container">
	<?php echo $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
      
		<?php if($faq_manager_status && $faq_managers) { ?>
			<ul class="nav-ta">
				<?php  $ctr = 0; foreach($faq_managers as $i => $section) { $ctr++; ?>
					<li class="">
						<span class="faq-trigger" data-id="#button<?php echo $section['counter']; ?>_1" data-target="#accordion-<?php echo $section['counter']; ?>" id="button<?=$ctr;?>" ><?php echo $section['section_title']; ?></span>
						<a href="index.php?route=information/faq#button<?php echo $section['counter']; ?>_1" class="this-a reload" onclick=""></a>
					</li>
					<script type="text/javascript">
						$('.reload').click(function() {
							setTimeout(function(){
								location.reload();
							}, 50);
						});
					</script>
				<?php } ?>
			</ul>
			<div class="tab-conten">
				<?php foreach($faq_managers as $jh => $section) { ?>
					<div class="panel-group tab-pan faq-accord" id="accordion-<?php echo $section['counter']; ?>" role="tablist" aria-multiselectable="true">
						
						<?php $ctr2 = 0; foreach($section['sub_sections'] as $key => $value) { $ctr2++; ?>						
							<div class="panel panel-default" id="<?php $str = $value['question']; $new_str = str_replace(' ', '', $str); echo $new_str; ?>">
								<div class="panel-heading heading-trigger active acc-heading<?=$ctr2;?>" role="tab" id="heading<?php echo $value['inner_counter']; ?>">
									<h4 class="panel-title">
										<?php echo $value['question']; ?>
									</h4>
									<!-- <div class="over"></div> -->
									<a role="button" class="acc-trigger<?=$ctr2;?>" data-toggle="collapse" data-parent="#accordion-<?php echo $section['counter']; ?>" href="#collapse<?php echo $value['inner_counter']; ?>" aria-expanded="true" aria-controls="collapse<?php echo $value['inner_counter']; ?>"></a>
									<div class="caret"></div>
								</div>
								
								<div id="collapse<?php echo $value['inner_counter']; ?>" class="panel-collapse collapse <?php if($value['inner_counter'] == 1) { echo "in"; } ?>" role="tabpanel" aria-labelledby="heading<?php echo $value['inner_counter']; ?>">
									<div class="panel-body"><?php echo $value['answer']; ?></div>
								</div>							
							</div>						
						<?php } ?>				
					</div>
				<?php } ?>
			</div>
		<?php } else { ?>
			<div class="row">
				<div class="col-sm-12">
					<div class="well well-sm text-center"><?php echo $text_no_faq_found; ?></div>
				</div>
			</div>
		<?php } ?>
      </div>
    <?php echo $column_right; ?></div>
		<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>

<!-- vinzoi -->
<script type="text/javascript">
  $(document).ready(function(){
  	$("#button0").addClass('active');

  	$('.faq-trigger').click(function(){
  		var target = $(this).data("target");
  		// console.log(target);
  		$('.faq-accord').hide();
  		$(target).fadeIn();

		$('.faq-trigger').removeClass('active');
		$(this).addClass('active');
  	});

  	$('.heading-trigger').click(function(){
		$('.heading-trigger').removeClass("active");
		$(this).addClass("active");
  	})

  	$(".heading-trigger.active .panel-collapse").addClass('in');

	if(window.location.hash) {
		var hash = window.location.hash.substring(1); //Puts hash in variable, and removes the # character
		hash = hash.split('_');
		// console.log(hash);
		var target_button = '#' + hash[0];
		var target_accord = '.acc-trigger' + hash[1];
		var target_heading = '.acc-heading' + hash[1];

		$(target_button).click();
		$(target_accord).click();	  
		$('.heading-trigger').removeClass("active");
		$(target_heading).addClass("active");

		var targety = '#' + hash[0];

		var header_heightx = $("header").height();
		var header_heighty = header_heightx / 2 - 150; 

		$('html, body').animate({ scrollTop: $(targety).offset().top - header_heighty }, 1000);

		$(".heading-trigger.active a").removeClass('collapsed');
		$(".heading-trigger.active").next().addClass('in');
	} else {
	  // No hash found
	}

  });

</script>