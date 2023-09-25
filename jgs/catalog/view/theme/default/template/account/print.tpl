<style>
    .container {
        width: 1000px;
        margin: auto;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        line-height: 200%;
    }

    thead td{
        -webkit-print-color-adjust: exact;
        background-color: #666;
        color: white;
    }

    td {
        border: 1px solid #666;
        padding: 7px;
        line-height: 180%;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table+table {
        margin-top: 30px;
    }
    body{
        padding: 10px 10px 90px;
    }

    .guide{
        display: block;
        position: fixed;
        width: 100%;
        background: red;
        padding: 10px;
        color: white;
        top: 0px;
        left: 0px;
        display: none;
        text-align: center;
    }

    .desktop-version {
        padding-top: 52px;
    }

    .desktop-version .guide.windows{
        display: block;
    }

    @media print{
        .desktop-version{
            padding-top: 10px;
        }
        .guide{
            display: none !important;
        }
    }
</style>
<div class="container <?= $desktop_flag; ?>">
    <div class="guide windows">
        Press Ctrl + P to Print
    </div>
    <div class="guide mac">
        Press Cmd + P to Print
    </div>
    <header>
        <div id="logo">
            <img src="<?= $logo; ?>" />
        </div>
    </header>

    <h2>
        <?php echo $heading_title; ?>
    </h2>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <td class="text-left" colspan="2">
                    <span>
                    <?php echo $text_order_detail; ?>
                    </span>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-left" style="width: 50%;">
                    <?php if ($invoice_no) { ?>
                    <b>
                        <?php echo $text_invoice_no; ?>
                    </b>
                    <?php echo $invoice_no; ?>
                    <br />
                    <?php } ?>
                    <b>
                        <?php echo $text_order_id; ?>
                    </b> #
                    <?php echo $order_id; ?>
                    <br />
                    <b>
                        <?php echo $text_date_added; ?>
                    </b>
                    <?php echo $date_added; ?>
                </td>
                <td class="text-left" style="width: 50%;">
                    <?php if ($payment_method) { ?>
                    <b>
                        <?php echo $text_payment_method; ?>
                    </b>
                    <?php echo $payment_method; ?>
                    <br />
                    <?php } ?>
                    <?php if ($shipping_method) { ?>
                    <b>
                        <?php echo $text_shipping_method; ?>
                    </b>
                    <?php echo $shipping_method; ?>
                    <?php } ?>
                </td>
            </tr>
        </tbody>
    </table>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <td class="text-left" style="width: 50%; vertical-align: top;">
                    <span>
                    <?php echo $text_payment_address; ?>
                    </span>
                </td>
                <?php if ($shipping_address) { ?>
                <td class="text-left" style="width: 50%; vertical-align: top;">
                    <span>
                    <?php echo $text_shipping_address; ?>
                    </span>
                </td>
                <?php } ?>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-left">
                    <?php echo $payment_address; ?>
					<br /><?php echo $text_email; ?> <?php echo $email; ?>
					<br /><?php echo $text_telephone; ?> <?php echo $telephone; ?>
                </td>
                <?php if ($shipping_address) { ?>
                <td class="text-left">
                    <?php echo $shipping_address; ?>
                </td>
                <?php } ?>
            </tr>
        </tbody>
    </table>

    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <td class="text-left"><span>
                    <?php echo $column_name; ?></span>
                </td>
                <td class="text-right"><span>
                    <?php echo $column_quantity; ?></span>
                </td>
                <td class="text-right"><span>
                    <?php echo $column_price; ?></span>
                </td>
                <td class="text-right"><span>
                    <?php echo $column_total; ?></span>
                </td>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
                <td>
                    <?php echo $product['name']; ?>
                    <?php foreach ($product['option'] as $option) { ?>
                        <br /> &nbsp;
                        <?php if ($option['type'] != 'file') { ?>
                            <small> -
                                <?php echo $option['name']; ?>: <?= $option['value'] . $option['price']; ?>
                            </small>
                        <?php } else { ?>
                           <small> -
                                <?= $option['name']; ?>:
                                <a href="<?= $option['href']; ?>"><?= $option['value']; ?></a>
                            </small>
                        <?php } ?>
                    <?php } ?>
                </td>
                <td class="text-right">
                    <?php echo $product['quantity']; ?>
                </td>
                <td class="text-right">
                    <?php echo $product['price']; ?>
                </td>
                <td class="text-right">
                    <?php echo $product['total']; ?>
                </td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
                <td class="text-left">
                    <?php echo $voucher['description']; ?>
                </td>
                <!--<td class="text-left"></td>-->
                <td class="text-right">1</td>
                <td class="text-right">
                    <?php echo $voucher['amount']; ?>
                </td>
                <td class="text-right">
                    <?php echo $voucher['amount']; ?>
                </td>
                <?php if ($products) { ?>
                <td></td>
                <?php } ?>
            </tr>
            <?php } ?>
            <?php foreach ($totals as $i => $total) { ?>
            <tr>
                <?php if ($total['title'] !== 'Sub-Total'): ?>

                <td colspan="2"></td>
                <td class="text-right">
                    <b>
                        <?php echo $total['title']; ?>
                    </b>
                </td>

                <td class="text-right">
                      <?php if ($total['title'] == 'Sub-Total'): ?>
                          <span class="mysubtotal hidden"><?php echo $total['text']; ?></span>
                          <span class="mysubtotal2"></span>
                      <?php else: ?>
                        <?php echo $total['text']; ?>
                      <?php endif ?>
                </td>
                <?php endif ?>
            </tr>

            <?php if ($i == 0): ?>
                <tr>
                    <td colspan="2"></td>
                    <td class="text-right">
                        <strong>GST 7%</strong>
                    </td>
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
    </table>

    <?php if ($comment) { ?>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <td class="text-left"><span>
                    <?php echo $text_comment; ?></span>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-left"><span>
                    <?php echo $comment; ?></span>
                </td>
            </tr>
        </tbody>
    </table>
    <?php } ?>
    <?php if ($histories) { ?>
    <h3>
        <?php echo $text_history; ?>
    </h3>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <td class="text-left"><span>
                    <?php echo $column_date_added; ?></span>
                </td>
                <td class="text-left"><span>
                    <?php echo $column_status; ?></span>
                </td>
                <td class="text-left"><span>
                    <?php echo $column_comment; ?></span>
                </td>
            </tr>
        </thead>
        <tbody>
            <?php if ($histories) { ?>
            <?php foreach ($histories as $history) { ?>
            <tr>
                <td class="text-left">
                    <?php echo $history['date_added']; ?>
                </td>
                <td class="text-left">
                    <?php echo $history['status']; ?>
                </td>
                <td class="text-left">
                    <?php echo $history['comment']; ?>
                </td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
                <td colspan="3" class="text-center">
                    <?php echo $text_no_results; ?>
                </td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
    <?php } ?>
</div>