<?php 
	/******************************************************
	 * @package Pav Megamenu module for Opencart 1.5.x
	 * @version 1.1
	 * @author http://www.pavothemes.com
	 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
	 * @license		GNU General Public License version 2
	*******************************************************/

	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
	$themeConfig = $this->config->get('themecontrol');
	$themeName =  $this->config->get('config_template');
	$helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
	$LANGUAGE_ID = $this->config->get( 'config_language_id' );  
?>
</section>
<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'mass_bottom' ); 
	$ospans = array( );
	$cols   = 1;
	if( count($modules) ) { 
?>
<section id="pav-mass-bottom">
	<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
			<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
			<div class="col-lg-<?php echo floor(12/$cols);?> col-sm-<?php echo floor(12/$cols);?> col-xs-12"><?php echo $module; ?></div>
			<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>
	</div>	
</section>
<?php } ?>

<footer id="footer">
	<?php
	/**
	 * Footer Top Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_top' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_top'])&& $themeConfig['block_footer_top']?(int)$themeConfig['block_footer_top']:count($modules);
	//if( $cols < count($modules) ){ $cols = count($modules); }
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-top">			
		<div class="container">
			<div class="custom">
				<?php $j=1;foreach ($modules as $i =>  $module) {   ?>
					<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
					<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
					<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
				<?php  $j++;  } ?>
			</div>
		</div>		
	</div>
	<?php } ?>
	<?php
	/**
	 * Footer Center Position
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_center' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_center'])&& $themeConfig['block_footer_center']?(int)$themeConfig['block_footer_center']:count($modules);
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-center">
		<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>	
		</div>
	</div>
<?php } elseif((isset($themeConfig['enable_footer_center'])&&$themeConfig['enable_footer_center'])) { ?>
<div class="footer-center">
		<div class="container"><div class="row">
			
			<?php if( isset($themeConfig['widget_about_data'][$LANGUAGE_ID]) ) {

		 ?>
		<div class="column col-xs-12 col-sm-12 col-lg-3">
			<div class="box about-us">
				<div class="box-heading"><span><?php echo $this->language->get('text_about_us'); ?></span></div>
				<div class="box-content">
					<?php echo html_entity_decode( $themeConfig['widget_about_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
				</div>
		</div>
		</div>
		 <?php } ?>	
		
		  <?php if ($informations) { ?>
			<div class="column col-xs-12 col-sm-6 col-lg-2">
				<div class="box info">
					<div class="box-heading"><span><?php echo $text_information; ?></span></div>
					<div class="box-content">
						<ul class="list">
						  <?php foreach ($informations as $information) { ?>
						  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						  <?php } ?>
						</ul>
					</div>					
				</div>
			</div>
		  <?php } ?>
		  
		<div class="column col-xs-12 col-sm-6 col-lg-2">
			<div class="box customer-service">
				<div class="box-heading"><span><?php echo $text_service; ?></span></div>
				<div class="box-content">
					<ul class="list">
					  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
					   <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
					  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					</ul>
				</div>	
			</div>
		</div>
		  
		<div class="column col-xs-12 col-sm-6 col-lg-2">
			<div class="box extra">
			<div class="box-heading"><span><?php echo $text_extra; ?></span></div>
			<div class="box-content">
				<ul class="list">
				  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
				  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				  <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
				  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				</ul>
			</div>			
		  </div>
		</div>
		  
		
		<?php /*
		<div class="column col-xs-12 col-sm-6 col-lg-2">
			<div class="box">
				<div class="box-heading"><span><?php echo $text_account; ?></span></div>
				<div class="box-content">
					<ul class="list">
					  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
					  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
					  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
					</ul>
				</div>
			</div>
		</div>
		*/ ?>		
		
		  
		<?php if( isset($themeConfig['widget_contact_data'][$LANGUAGE_ID]) ) {

		 ?>
		<div class="column col-xs-12 col-sm-6 col-lg-3">
			<div class="box contact-us">
				<div class="box-heading"><span><?php echo $this->language->get('text_contact_us'); ?></span></div>
				<div class="box-content">
					<?php echo html_entity_decode( $themeConfig['widget_contact_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
				</div>
		</div>
		</div>
		 <?php } ?>

		 </div> 
	</div></div>
<?php  } ?>	
	<?php
	/**
	 * Footer Bottom
	 * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
	 */
	$modules = $helper->getModulesByPosition( 'footer_bottom' ); 
	$ospans = array();
	
	if( count($modules) ){
	$cols = isset($themeConfig['block_footer_bottom'])&& $themeConfig['block_footer_bottom']?(int)$themeConfig['block_footer_bottom']:count($modules);	
	$class = $helper->calculateSpans( $ospans, $cols );
	?>
	<div class="footer-bottom">
		<div class="container">
		<?php $j=1;foreach ($modules as $i =>  $module) {  ?>
				<?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>	
				<div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
				<?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>	
		<?php  $j++;  } ?>	
		</div>
	</div>
	<?php } ?>
	
	<p id="back-top"> <a href="#top"><i class="fa fa-caret-up"></i></a> </p>

	<!--
	OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
	Please donate via PayPal to donate@opencart.com
	//-->
	<div id="powered"><div class="container"><div class="copyright pull-left">
	<?php if( isset($themeConfig['enable_custom_copyright']) && $themeConfig['enable_custom_copyright'] ) { ?>
		<?php echo $themeConfig['copyright'];?>
	<?php } else { ?>
		<?php echo $powered; ?>. 
	<?php } ?>
	Designed by <a href="http://www.themelexus.com" title="pavethemes - opencart themes clubs" target="_blank">ThemeLexus</a></div>
	<div class="paypal pull-right"><a href="#"><img src="image/data/paypal.png" alt="payment" /></a></div></div></div>
	
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<?php if( isset($themeConfig['enable_paneltool']) && $themeConfig['enable_paneltool'] ){  ?>
	<?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>

<script type="text/javascript">
	$(document).ready(function() {
		$("li:first-child").addClass('first');
		$("li:last-child").addClass('last');	
		$(".box-product .row:last-child").addClass('last');				
		$("#image-additional a:last-child").addClass('last');
		
		$('.pav-custom .box-heading').each(function(){
		var me = $(this);
		me.html( me.text().replace(/(^\w+|\s+\w+)/,'<span class="t-color">$1</span>') );
		});
					
		//$("#back-top").hide();

		$(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()>100){
					$('#back-top').fadeIn();
				}else{
					$('#back-top').fadeOut();
				}
			});

			$('#back-top a').click(function(){
				$('body,html').animate({scrollTop:0},800);
				return false;
			});
		});

		$('iframe').contents().find('body').css('background-color','#fff');
		
		$(function(){
			$('#header .links li').last().addClass('last');
			$('.breadcrumb a').last().addClass('last');
			$('.cart tr').eq(0).addClass('first');														  
		});		
		
	});
</script>

</section> 
</body></html>