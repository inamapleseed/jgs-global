<button id="articles-filter-trigger-open" class="btn btn-primary" onclick="$('#articles-column-left').addClass('open');" ><?= $button_filter; ?></button>
<div id="articles-column-left">
	<button id="articles-filter-trigger-close" class="btn btn-danger fixed position-right-top" onclick="$('#articles-column-left').removeClass('open');"> <i class="fa fa-times"></i> </button>

	<div class="arts-filter">	
		<select class="custom-select" onchange="location = this.value">
			<option disabled selected>Category</option>
			<?php foreach ($categories as $c) { ?>
				<option value="<?= $c['url'] ?>" class="block <?= $ncategory_id == $c['ncategory_id'] ? 'active' : '' ?>">
					<?= $c['name'] ?>
				</option>
			<?php } ?>
		</select>

		<select class="custom-select" onchange="location = this.value">
			<option disabled selected>Date Created</option>
				<?php foreach ($archives as $archive) { ?>
					<?php foreach ($archive['month'] as $month) { ?>
						<option value="<?php echo $month['href']; ?>">
							<?php echo $archive['year']; ?> <?php echo $month['name']; ?>
						</option>
					<?php } ?>
				<?php } ?>
		</select>
	</div>

</div>

<script type="text/javascript">
	$(document).ready(function () {
		/*
		$('.hidesthemonths').on('click', function () {
			$(this).find('div').slideToggle('fast');
		});
		*/

		$('#articles-column-left .toggle').on('click', function(e){
		
			e.preventDefault();
			ele = $(this).parents('.list-group-item');
			
			if(ele.hasClass('active')){
				ele.removeClass('active');
			}
			else{ 
				if(ele.hasClass('.level-1')){
					$('.level-1.active').removeClass('active');
				}
				else if(ele.hasClass('.level-2')){
					$('.level-2.active').removeClass('active');
				}
				
				ele.addClass('active');
			}
		});

	});
</script>