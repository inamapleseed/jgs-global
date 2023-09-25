<div class="product-gutter" id="product-<?=$product_id?>"> <?php /* product option in product component :: add product id to div  */ ?>
	<div class="product-block <?= $out_of_stock; ?>">
		<div class="product-image-block relative image-zoom-hover">
			<?php if($sticker && $sticker['name']){ ?>
			<a 
			href="<?= $href; ?>" 
			title="<?= $name; ?>" 
			class="sticker absolute <?= $sticker['image'] ? 'sticker-image':''; ?>" 
			style="color: <?= $sticker['color']; ?>; background-color: <?= $sticker['background-color']; ?>">
				<?php if($sticker['image']){ ?>
				    <img src="<?= $sticker['image'] ?>" />
				<?php } else { 
				    echo $sticker['name']; 
				} ?>
			</a>
			<?php } ?>
			<a 
				href="<?= $href; ?>" 
				title="<?= $name; ?>" 
				class="product-image image-container relative" >
				<img 
					src="<?= $thumb; ?>" 
					alt="<?= $name; ?>" 
					title="<?= $name; ?>"
					class="img-responsive img1" />
				<?php if($thumb2 && $hover_image_change) { ?>
					<img 
						src="<?= $thumb2; ?>" 
						alt="<?= $name; ?>" 
						title="<?= $name; ?>"
						class="img-responsive img2" style="display: none"/>
				<?php } ?>
			</a>
			<div class="btn-group product-button">
				<?php if ($options) { ?>
					<button type="button"
						<?php if($enquiry){ ?>
							class="btn btn-default btn-enquiry btn-enquiry-<?= $product_id; ?>" data-product-id="<?= $product_id; ?>"
						<?php }else{ ?>
							class="btn btn-default btn-cart btn-cart-<?= $product_id; ?>" data-product-id="<?= $product_id; ?>"
						<?php } ?>
						>
						<i class="fa fa-shopping-cart"></i> ADD TO CART
					</button>
				<?php } else { ?>
					<a href="index.php?route=product/product&product_id=<?= $product_id; ?>" class="btn btn-primary">
						<i class="fa fa-search"></i> VIEW PRODUCT
					</a>

					<?php if($enquiry){ ?>
						<button type="button" onclick="enquiry.add('<?= $product_id; ?>', '<?= $minimum; ?>');" class="btn btn-primary">
							<i class="fa fa-shopping-cart"></i> ADD TO ENQUIRY
						</button>
					<?php }else{ ?>
						<button type="button" onclick="cart.add('<?= $product_id; ?>', '<?= $minimum; ?>');" class="btn btn-primary">
							<i class="fa fa-shopping-cart"></i> ADD TO CART
						</button>
					<?php } ?>
				<?php } ?>

			</div>
		</div>
		<div class="cat-name">
		</div>
		<div class="product-name">
			<!-- <a href="<?= $href; ?>" style="margin-bottom: 5px"><?php echo $category; ?></a><br> -->
			<a href="<?= $href; ?>" style="margin-bottom: 5px"><?php echo $brand; ?></a><br>
			<a href="<?= $href; ?>"><?= $name; ?></a>
		</div>

		<div class="product-details product-price-<?=$product_id?>">
			<?php if ($price && !$enquiry) { ?>
				<div class="price">
					<?php if (!$special) { ?>
						<span class="price-new"><?= $price; ?></span>
					<?php } else { ?>
						<span class="price-new"><?= $special; ?></span>
						<span class="price-old"><?= $price; ?></span>
					<?php } ?>
					<?php if ($tax) { ?>
						<span class="price-tax"><?= $tax; ?></span>
					<?php } ?>
				</div>
			<?php } ?>

			<?php if($enquiry){ ?>
				<span class="label label-primary">
					Enquiry Item
				</span>
			<?php } ?>
		</div>
		<?php if($rating) { ?>
			<div class="rating">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($rating < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				<?php } ?>
				<?php } ?>
			</div>
		<?php } ?>
	</div>
</div>




