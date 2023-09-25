<div class="table-responsive">
	<table class="quickcheckout-cart">
		<thead>
			<tr>
				<td class="image"><?php echo $column_image; ?></td>
				<td class="name"><?php echo $column_name; ?></td>
				<td class="quantity"><?php echo $column_quantity; ?></td>
				<td class="price1"><?php echo $column_price; ?></td>
				<td class="total"><?php echo $column_total; ?></td>
			</tr>
		</thead>
			<?php if ($products || $vouchers) { ?>
		<tbody>
					<?php foreach ($products as $product) { ?>
					<tr>
						<td class="image"><?php if ($product['thumb']) { ?>
							<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
							<?php } ?></td>
						<td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?><br/> [<?= $button_view; ?>]</a>
							<div>
								<?php foreach ($product['option'] as $option) { ?>
									<?php if ($option['type'] != 'file') { ?>
										<small><?php echo $option['name']; ?>: <?= $option['value'] . $option['price']; ?></small><br />
									<?php } else { ?>
										<small>
											<?= $option['name']; ?>:
											<a href="<?= $option['href']; ?>"><?= $option['value']; ?></a>
										</small><br />
									<?php } ?>
								<?php } ?>
					<?php if ($product['reward']) { ?>
					<br />
					<small><?php echo $product['reward']; ?></small>
					<?php } ?>
					<?php if ($product['recurring']) { ?>
					<br />
					<span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
					<?php } ?>
							</div></td>
						<td class="quantity"><?php if ($edit_cart) { ?>
					<div class="input-group btn-block">
						<input type="text" name="quantity[<?php echo $product['key']; ?>]" size="1" value="<?php echo $product['quantity']; ?>" class="form-control" />
					<div class="input-group-btn" style="display: flex; flex-direction: row !important;">
    					<button data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn button-update"><i class="fa fa-refresh"></i></button>
    					<button data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger button-remove" data-remove="<?php echo $product['key']; ?>"><i class="fa fa-times-circle"></i></button>
					</div>
				</div>
				<?php } else { ?>
				x&nbsp;<?php echo $product['quantity']; ?>
				<?php } ?></td>
				<td class="price1"><?php echo $product['price']; ?></td>
						<td class="total"><?php echo $product['total']; ?></td>
					</tr>
					<?php } ?>
					<?php foreach ($vouchers as $voucher) { ?>
						<tr>
							<td class="image"><a href="<?= $voucher['href'] ?>"><?= '<img src="'.$voucher['image'].'" class="img-responsive" />' ?></a></td>
							<td class="name"><a href="<?= $voucher['href'] ?>"><?php echo $voucher['description']; ?> <br/> [<?= $button_view; ?>]</a></td>
							<td class="quantity">x&nbsp;1</td>
							<td class="price1"><?php echo $voucher['amount']; ?></td>
							<td class="total"><?php echo $voucher['amount']; ?></td>
						</tr>
					<?php } ?>
			<?php foreach ($totals as $i => $total) { ?>
				<tr>
					<td class="text-right" colspan="4"><b><?php echo $total['title']; ?>:</b></td>
	                <td class="text-right" >
	                  <?php if ($total['title'] == 'Sub-Total'): ?>
                      <span class="mysubtotal hidden"><?php echo $total['text']; ?></span>
                      <span class="mysubtotal2"></span>
	                    <?php else: ?>
	                      <?php echo $total['text']; ?>
	                  <?php endif ?>
	                </td>
				</tr>

	              <?php if ($i == 0): ?>
	                <tr>
	                  <td class="text-right"colspan="4"><strong>GST 7%</strong></td>
	                  <td class="text-right taxes">

                    <?php if ($products): ?>
                      <?php $z = ['']; foreach ($products as $mark => $product2): ?>
                        <?php array_push($z, $product2['checkout_tax2']); ?>
                        
                      <?php endforeach ?>
                      <span class="totaltax"><?php echo 'S$' . array_sum($z); ?></span>
                    <?php endif ?>
                    <script type="text/javascript">
                      $(".cart-dorpdown-item-charges .btn-number").on("click", function(){
                        let totaltax = $(".totaltax").text().replace('S$', '');
                        let totaltax2 = totaltax.replace(',', '');
                        let mysubtotal = $(".mysubtotal").text().replace('S$', '');
                        let mysubtotal2 = mysubtotal.replace(',', '');
                        let subtotal = parseFloat(mysubtotal2) - parseFloat(totaltax2);
                        // console.log(subtotal);
                        $(".mysubtotal2").empty().append('S$' + subtotal);
                      })
                      $(document).ready(function(){
                        let totaltax = $(".totaltax").text().replace('S$', '');
                        let totaltax2 = totaltax.replace(',', '');
                        let mysubtotal = $(".mysubtotal").text().replace('S$', '');
                        let mysubtotal2 = mysubtotal.replace(',', '');
                        let subtotal = parseFloat(mysubtotal2) - parseFloat(totaltax2);
                        // console.log(subtotal);
                        $(".mysubtotal2").empty().append('S$' + subtotal);
                      })
                      $(document).on("click", function(){
                        let totaltax = $(".totaltax").text().replace('S$', '');
                        let totaltax2 = totaltax.replace(',', '');
                        let mysubtotal = $(".mysubtotal").text().replace('S$', '');
                        let mysubtotal2 = mysubtotal.replace(',', '');
                        let subtotal = parseFloat(mysubtotal2) - parseFloat(totaltax2);
                        // console.log(subtotal);
                        $(".mysubtotal2").empty().append('S$' + subtotal);
                      })
                    </script>
                  </td>
	                </tr>
	              <?php endif ?>
			<?php } ?>
		</tbody>
			<?php } ?>
	</table>
</div>