<div class="">
	<div class="pd-30 pd-md-60">
		<?php if ($thumb) { ?>
		<div class="pd-b30 text-center">	
			<img class="w100" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
		</div>
		<?php } ?>

		<div class="pd-b15"><h3 class="bold"><?php echo $news_title; ?></h3></div>

		<div class="pd-b15"><i class="fa fa-calendar" style="margin-right: 10px"></i><i><?php echo $date_added; ?></i></div>
		<div class="pd-t30 pd-b30 flex flex-vcenter">
			<div class="pd-r15"><?= $text_share ?>:</div>
			<div><?= $share_html ?></div>
		</div>
		
		<div class="pd-b15"><?php echo $description; ?></div>



		<div class="custom-arrows">
			<div>
				<a href="<?php echo $prev_news ?>" class="btn transparent-btn btn-primary" style="opacity: 1;"> Prev
				</a>
			</div>

			<div>
				<a href="<?php echo $back ?>" class="btn btn-primary">Back</a>
			</div>

			<div>
				<a href="<?php echo $next_news ?>" class="btn transparent-btn btn-primary" style="opacity: 1;"> Next
				</a>
			</div>
		</div>

	</div>
	<?php if ($related_products_slider) { ?>
	<?= $related_products_slider ?>
	<?php } ?>
</div>