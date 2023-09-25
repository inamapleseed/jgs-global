<div class="expertise-con">
	<?php foreach ($repeater as $i => $exp): ?>
		<div class="inner-cont <?= $i % 2 ? 'even' : ''; ?>">
			<div class="image-con" data-aos="fade-left">
				<img src="image/<?php echo $exp['image']; ?>" alt="image">
			</div>
			<div class="text-con" data-aos="fade-right">
				<h3><?php echo $exp['title']; ?></h3>
				<div>
					<p><?php echo html($exp['text']); ?></p>
				</div>
			</div>
		</div>
	<?php endforeach ?>
</div>