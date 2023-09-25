<?php if (!isset($redirect)) { ?>
  <?php if ($confirmation_page) { ?>
	<div class="table-responsive">
	  <table class="table table-bordered table-hover">
		<thead>
		  <tr>
			<td class="text-left"><?php echo $column_name; ?></td>
			<td class="text-left"><?php echo $column_model; ?></td>
			<td class="text-right"><?php echo $column_quantity; ?></td>
			<td class="text-right"><?php echo $column_price; ?></td>
			<td class="text-right"><?php echo $column_total; ?></td>
		  </tr>
		</thead>
		<tbody>
		  <?php foreach ($products as $product) { ?>
		  <tr>
			<td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			  <?php foreach ($product['option'] as $option) { ?>
				<br />
				<?php if ($option['type'] != 'file') { ?>
					&nbsp;<small> - <?php echo $option['name']; ?>: <?= $option['value'] . $option['price']; ?></small>
				<?php } else { ?>
					&nbsp;<small> - 
						<?= $option['name']; ?>:
						<a href="<?= $option['href']; ?>"><?= $option['value']; ?></a>
					</small>
				<?php } ?>
			  <?php } ?>
			  <?php if($product['recurring']) { ?>
			  <br />
			  <span class="label label-info"><?php echo $text_recurring; ?></span> <small><?php echo $product['recurring']; ?></small>
			  <?php } ?></td>
			<td class="text-left"><?php echo $product['model']; ?></td>
			<td class="text-right"><?php echo $product['quantity']; ?></td>
			<td class="text-right"><?php echo $product['price']; ?></td>
			<td class="text-right"><?php echo $product['total']; ?></td>
		  </tr>
		  <?php } ?>
		  <?php foreach ($vouchers as $voucher) { ?>
		  <tr>
			<td class="text-left"><?php echo $voucher['description']; ?></td>
			<td class="text-left"></td>
			<td class="text-right">1</td>
			<td class="text-right"><?php echo $voucher['amount']; ?></td>
			<td class="text-right"><?php echo $voucher['amount']; ?></td>
		  </tr>
		  <?php } ?>
		</tbody>
		<tfoot>
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
		</tfoot>
	  </table>
	</div>
  <?php } ?>
  <div class="payment"><?php echo $payment; ?></div>
	<div class="pull-sm-left text-center text-sm-left">
  	<a id="quickcheckout-back" class="btn btn-default pull-left" href="<?php echo $back; ?>"><?php echo $button_back; ?></a>
	</div>
  
  <script type="text/javascript"><!--
  <?php if ($payment_target && $auto_submit) { ?>
  $('.payment').find('<?php echo $payment_target; ?>').trigger('click');
  
  setTimeout(function() {
	  $('#quickcheckoutconfirm').show();
	  $('#payment').show();
	  $('.fa-spinner').remove();
  }, 4000);
  <?php } ?>
  //--></script> 
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
