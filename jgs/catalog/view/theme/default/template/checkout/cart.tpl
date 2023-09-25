<?= $header; ?>
<div class="container">
  <?= $content_top; ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li>
      <a href="<?= $breadcrumb['href']; ?>">
        <?= $breadcrumb['text']; ?>
      </a>
    </li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info">
    <i class="fa fa-info-circle"></i>
    <?= $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php /* completecombo */ ?>
  <?php foreach($eligibleoffers['success'] as $key => $message) { ?>
    <div class="alert messagestripsuccess"><i class="fa fa-check-circle"></i> <?php echo $message; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
   <?php foreach($eligibleoffers['warning'] as $key => $message) { ?>
    <div class="alert messagestripwarning"><i class="fa fa-check-circle"></i> <?php echo $message; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
  <?php /* completecombo */ ?>
  <?php if ($success) { ?>
  <div class="alert alert-success">
    <i class="fa fa-check-circle"></i>
    <?= $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger">
    <i class="fa fa-exclamation-circle"></i>
    <?= $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row">
    <?= $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?= $class; ?>">
      
      <h2>
        <?= $heading_title; ?>
        <?php if ($weight) { ?> &nbsp;(
        <?= $weight; ?>)
        <?php } ?>
      </h2>

      <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" id="cartSummary" >
        <p><?= $redeem_coupon_codes_upon_checkout; ?></p>

          <table class="table">
            <thead>
              <tr>
                <td class="text-left" colspan="2" >
                  <?= $column_name; ?>
                </td>
                <td class="text-center" width="1px" >
                  <?= $column_quantity; ?>
                </td>
                <td class="text-right">
                  <?= $column_price; ?>
                </td>
                <td class="text-right">
                  <?= $column_total; ?>
                </td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              
              <tr>

                <td class="text-left" width="<?= $width; ?>px" >
                  <?php if ($product['thumb']) { ?>
                  <a href="<?= $product['href']; ?>">
                    <img src="<?= $product['thumb']; ?>" alt="<?= $product['name']; ?>" title="<?= $product['name']; ?>" />
                  </a>
                  <?php } ?>
                </td>

                <td class="text-left cart-description" style="width: calc(100% - <?= $width; ?>px)">

                    <a href="<?= $product['href']; ?>">
                      <?= $product['name']; ?>
                      <br/>
                      [<?= $button_view; ?>]
                    </a>

                    <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                    <?php } ?>

                    <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                        <?php if ($option['type'] != 'file') { ?>
                          <br />
                          <small>
                            <?= $option['name']; ?>:
                            <?= $option['value'] . $option['price']; ?>
                          </small>
                        <?php } else { ?>
                          <br />
                          <small>
                                <?= $option['name']; ?>:
                                <a href="<?= $option['href']; ?>"><?= $option['value']; ?></a>
                            </small>
                        <?php } ?>
                      <?php } ?>
                    <?php } ?>
                    
                    <?php if ($product['recurring']) { ?>
                      <br />
                      <span class="label label-info">
                        <?= $text_recurring_item; ?>
                      </span>

                      <small>
                        <?= $product['recurring']; ?>
                      </small>
                    <?php } ?>
                </td>

                <td class="text-center cart-quantity">
                    <div class="input-group" id="cart-item-<?= $product['cart_id']; ?>" >
                      <span class="input-group-btn">
                        <button type="button" data-loading="-" class="btn btn-default btn-number no-custom <?= $product['quantity']==1?'disabled':''; ?>" data-type="minus" 
                        <?php if($product['quantity'] > 1){ ?>
                          onclick="descrement($(this).parent().parent()); refreshCart(this);" 
                        <?php } ?>
                        >
                          <span class="glyphicon glyphicon-minus"></span>
                        </button>
                      </span>

                      <input type="text" name="quantity[<?= $product['cart_id']; ?>]" class="form-control input-number integer text-center update-cart no-custom" value="<?= $product['quantity']; ?>" onfocus="rememberQuantity('<?= $product['quantity']; ?>');" onblur="refreshCart(this);" >
                      
                      <span class="input-group-btn">
                        <button type="button" data-loading="+" class="btn btn-default btn-number no-custom" data-type="plus" onclick="increment($(this).parent().parent());  refreshCart(this);">
                          <span class="glyphicon glyphicon-plus"  ></span>
                        </button>
                      </span>
                    </div>

                </td>

                <td class="text-right cart-price " >
                  <span class="column-label hidden-sm hidden-md hidden-lg" ><?= $column_price; ?></span>
                  <span class="hidden-sm hidden-md hidden-lg" >:</span>
                  <div><?= $product['price']; ?></div>
                </td>

                <td class="text-right cart-price " >
                  <span class="column-label hidden-sm hidden-md hidden-lg" ><?= $column_total; ?></span>
                  <span class="hidden-sm hidden-md hidden-lg" >:</span>
                  <div><?= $product['total']; ?></div>
                </td>

                <td class="text-center" >
                  <button type="button" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger remove" onclick="cart.remove('<?= $product['cart_id']; ?>');">
                    <i class="fa fa-times-circle"></i>
                  </button>
                </td>

              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td><a href="<?= $voucher['href'] ?>"><?= '<img src="'.$voucher['image'].'" class="img-responsive" />' ?></a></td>
                <td class="text-left">
                  <a href="<?= $voucher['href'] ?>"><?= $voucher['description']; ?><br/>[<?= $button_view; ?>]</a>
                </td>
                <td class="text-left">
                  <div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                  </div>
                </td>
                <td class="text-right">
                  <?= $voucher['amount']; ?>
                </td>
                <td class="text-right">
                  <?= $voucher['amount']; ?>
                </td>
                <td class="text-center">
                    <button type="button" data-toggle="tooltip" title="<?= $button_remove; ?>" class="btn btn-danger remove" onclick="voucher.remove('<?= $voucher['key']; ?>');">
                      <i class="fa fa-times-circle"></i>
                    </button>
                </td>
              </tr>
              <?php } ?>
            </tbody>
          </table>

      </form>

      <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered" id="cartTotals">
            <?php foreach ($totals as $i => $total) { ?>
            <tr>
                <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>

                <td class="text-right">
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
                  <td class="text-right"><strong>GST 7%</strong></td>
                  <td class="text-right">
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
          </table>
        </div>
      </div>
      <div class="buttons clearfix">
        <div class="pull-left">
          <a href="<?= $continue; ?>" class="btn btn-primary">
            <?= $button_shopping; ?>
          </a>
        </div>
        <div class="pull-right"> 
          <a href="<?= $checkout; ?>" class="btn btn-primary">
            <?= $button_checkout; ?>
          </a>
        </div>
      </div>
      <?php if($upsell_status){ ?>
        <div class="upsell_product_addon">
          <h2 class="pd-t40"><?= $upsell_title ?></h2>
          <div class="featured-module pd-b40">
            <div class="featured section relative">
              <div class="product-layout" id="upsell_cart">
                <?php foreach ($products2 as $product) { ?>
                    <?= html($product); ?>
                <?php } ?>
              </div>
            </div>
          </div>
        </div>
        <script type="text/javascript">
          $("#upsell_cart").slick({
            dots: false,
            infinite: true,
            speed: 300,
            slidesToShow: 5,
            slidesToScroll: 1,
            <?php if($autoplay){ ?>
              autoplay: true,
              autoplaySpeed: <?= $autoplay ?>,
            <?php } ?>
            responsive: [
              {
                breakpoint: 1201,
                settings: {
                  slidesToShow: 4,
                }
              },
              {
                breakpoint: 993,
                settings: {
                  slidesToShow: 3,
                }
              },
              {
                breakpoint: 769,
                settings: {
                  slidesToShow: 2,
                }
              },
              {
                breakpoint: 541,
                settings: {
                  slidesToShow: 2,
                  arrows: false,
                  autoplay: true,
                  autoplaySpeed: <?= $mobile_autoplay ?>
                }
              },
              {
                breakpoint: 415,
                settings: {
                  slidesToShow: 2,
                  arrows: false,
                  autoplay: true,
                  autoplaySpeed: <?= $mobile_autoplay ?>
                }
              },
              {
                breakpoint: 376,
                settings: {
                  slidesToShow: 1,
                  arrows: false,
                  autoplay: true,
                  autoplaySpeed: <?= $mobile_autoplay ?>
                }
              }
            ],
            prevArrow: "<div class='pointer slick-nav left prev absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-left fa-2em'></i></div></div>",
            nextArrow: "<div class='pointer slick-nav right next absolute'><div class='absolute position-center-center'><i class='fa fa-chevron-right fa-2em'></i></div></div>",
          });
        </script>
      <?php } ?>
      
    </div>
    <?= $column_right; ?>
  </div>
  <?= $content_bottom; ?>
</div>
<script type="text/javascript">

  var current_focus_quantity = 0;
  function rememberQuantity(qty){
    current_focus_quantity = parseInt(qty);
  }


  var request = null;
  
  function refreshCart(ele) {
    element = $(ele);

    id = element.parent().parent().attr("id");
    if (element.is("input")) {
      id = element.parent().attr("id");
    }
    
    if($("#" + id + " input").val() == current_focus_quantity){
      return;
    }
    
    if(request) request.abort();
    
    request = $.ajax({
      url: '<?= $action; ?>',
      data: $("#" + id + " input").serialize(),
      dataType: 'HTML',
      type: 'post',
      beforeSend: function () {
        $('.alert').remove();
        if(element.hasClass('btn-number')){
          cache_text = element.html();
          // element.button("loading");
          element.html(cache_text);
        }
        else{
          element.button("loading");
        }
        current_focus_quantity = 0;
      },
      complete: function () {
        element.button("reset");
      },
      success: function (html) {
        $(".alert-success").remove();

        content_total_dropdown_body = $(html).find("#loadFrom").html();
        content_total_dropdown = $(html).find("#cart-quantity-total").text();
        content_total = $(html).find("#cartTotals");
        content = $(html).find("#cartSummary tbody");
        alert = $(html).find(".alert-success");
        alert_error = $(html).find(".alert-danger");
        
        if(alert_error.length){
          error = alert_error.html().split(":");
          if(error.length > 1){
            swal({
              title: error[0],
              html: error[1],
              type: "error"
            });
          }
          else{
            swal({
              title: '<?= $text_title_warning; ?>',
              html: error[0],
              type: "error"
            });
          }
        }
        else if(alert.length){
          success = alert.html().split(":");
          if(success.length > 1){
            swal({
              title: success[0],
              html: success[1],
              type: "success"
            });
          }
        }

        if (content.length) {            
          content = content.html();
          $("#cartSummary tbody").html(content);
          var parent_element = $("#cartTotals").parent(); $("#cartTotals").remove();
          parent_element.html(content_total);
          
          $('#cart-quantity-total').text(content_total_dropdown);
          $('#loadTo').html(content_total_dropdown_body);

          $('#cart > ul').load('index.php?route=common/cart/info ul > *');

        } else {
          location.reload();
        }

      }
    })
  }
</script>

<?php if (isset($offerpopup)) {  echo $offerpopup; } ?>
<?= $footer; ?>