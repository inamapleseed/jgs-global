<div class="sorts">

    <div class="product-count-2"></div>

    <div class="flex flex-wrap filters-wrap pd-l15 pd-r15">

        <div class="col-xs-4 text-center hidden-lg hidden-md hidden-sm"> 
            <button id="filter_group_tigger_open" class="btn" onclick="$('#filter-groups').addClass('open');"><?= $button_filter; ?></button> 
        </div> 

        <div class="col-md-6 col-sm-6 col-xs-4">
            <div class="form-group input-group-b4">
                <select id="input-sort" class="form-control no-custom custom-select" onchange="select_handler();">
                <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                <?php } ?>
                </select>
            </div>
        </div>

        <div class="col-md-6 col-sm-6 col-xs-4">
            <div class="form-group input-group-b4">
                <select id="input-limit" class="form-control no-custom custom-select" onchange="select_handler();">
                <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['value']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo $limits['value']; ?>"><?php echo $limits['text']; ?></option>
                    <?php } ?>
                <?php } ?>
                </select>
            </div>
        </div>

    </div>
</div>

<script type="text/javascript">
    function adjustFitlerPos() {
        $('.filters-wrap').css('top', $('.fixed-header').outerHeight(true));
    }
    function resetFitlerPos() {
        $('.filters-wrap').css('top', 'auto');
    }
    function adjustBannerPos() {
        $('#pg-banner-wrap').css('margin-top', $('.filters-wrap').outerHeight(true));
    }
    function resetBannerPos() {
        $('#pg-banner-wrap').css('margin-top', 0);
    }

    // Note: there is one calling of this function in applyFilter() - extension/module/category filters there
    function handleFilterPos() {
        const width  = window.innerWidth || document.documentElement.clientWidth || 
        document.body.clientWidth;

        if(width <= 767) {
            adjustFitlerPos();
            adjustBannerPos();
        }
        else {
            resetFitlerPos();
            resetBannerPos();
        }

        //console.log('handle filter pos');
    }

    $(window).on('load resize', function(){
        handleFilterPos();
    });
</script>