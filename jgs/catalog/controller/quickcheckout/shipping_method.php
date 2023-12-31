<?php 
class ControllerQuickCheckoutShippingMethod extends Controller {
  	public function index() {
		$data = $this->load->language('checkout/checkout');
		$data = array_merge($data, $this->load->language('quickcheckout/checkout'));
		
		$this->load->model('account/address');
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		
		$shipping_address = array();
		
		if ($this->customer->isLogged() && isset($this->request->get['address_id'])) {
			// Selected stored address
			$shipping_address = $this->model_account_address->getAddress($this->request->get['address_id']);

			if (isset($this->session->data['guest'])) {
				unset($this->session->data['guest']);
			}
		} elseif (isset($this->request->post['country_id'])) {
			// Selected new address OR is a guest
			if (isset($this->request->post['country_id'])) {
				$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
			} else {
				$country_info = '';
			}
			
			if (isset($this->request->post['zone_id'])) {
				$zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);
			} else {
				$zone_info = '';
			}
			
			if ($country_info) {
				$shipping_address['country'] = $country_info['name'];
				$shipping_address['iso_code_2'] = $country_info['iso_code_2'];
				$shipping_address['iso_code_3'] = $country_info['iso_code_3'];
				$shipping_address['address_format'] = $country_info['address_format'];
			} else {
				$shipping_address['country'] = '';
				$shipping_address['iso_code_2'] = '';
				$shipping_address['iso_code_3'] = '';
				$shipping_address['address_format'] = '';
			}
			
			if ($zone_info) {
				$shipping_address['zone'] = $zone_info['name'];
				$shipping_address['zone_code'] = $zone_info['code'];
			} else {
				$shipping_address['zone'] = '';
				$shipping_address['zone_code'] = '';
			}
		
			$shipping_address['firstname'] = $this->request->post['firstname'];
			$shipping_address['lastname'] = $this->request->post['lastname'];
			$shipping_address['company'] = $this->request->post['company'];
			$shipping_address['address_1'] = $this->request->post['address_1'];
			$shipping_address['address_2'] = $this->request->post['address_2'];
			$shipping_address['postcode'] = $this->request->post['postcode'];
			$shipping_address['city'] = $this->request->post['city'];
			$shipping_address['country_id'] = $this->request->post['country_id'];
			$shipping_address['zone_id'] = $this->request->post['zone_id'];
		}

		if (!empty($shipping_address)) {
			// Shipping Methods
			$method_data = array();

			$this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('shipping');

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/shipping/' . $result['code']);

					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($shipping_address);

					if ($quote) {

						/* pick up location mod */
						$pickup_location = array();

						if (isset($quote['pickup_location']) && !empty($quote['pickup_location'])) {
							foreach ($quote['pickup_location'] as $pick_loco) {
								$pickup_location[] = $pick_loco;
							}
						}
						/* pick up location mod */


						$method_data[$result['code']] = array(
							'title'      => $quote['title'],
							'quote'      => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error'],
							/* pick up location mod */
							'pickup_location'      => $pickup_location
							/* pick up location mod */
						);
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['shipping_methods'] = $method_data;
		}
		
		if ($this->config->get('quickcheckout_delivery_time') == '2') {
			$min = $this->config->get('quickcheckout_delivery_min');
			$max = $this->config->get('quickcheckout_delivery_max');
			$today = date('d M Y');
			
			$min_date = date('d M Y', strtotime($today . ' + ' . $min . ' day'));
			$max_date = date('d M Y', strtotime($today . ' + ' . $max . ' day'));
			
			$min = 0;
			$max = 0;
			
			if ($this->config->get('quickcheckout_delivery_unavailable')) {
				$dates = str_replace('"', '', html($this->config->get('quickcheckout_delivery_unavailable')));
			} else {
				$dates = array();
			}
			
			foreach (explode(',', $dates) as $unavailable) {
				$unavailable = strtotime($unavailable);
				
				if ($unavailable >= strtotime($min_date) && $unavailable <= strtotime($max_date)) {
					$max++;
				}
				
				if ($unavailable == strtotime($min_date)) {
					$min++;
				}
			}
			
			$min_date = date('d M Y', strtotime($min_date . ' + ' . $min . ' day'));
			$max_date = date('d M Y', strtotime($max_date . ' + ' . $max . ' day'));
			
			$data['estimated_delivery'] = $min_date . ' - ' . $max_date;
			$data['estimated_delivery_time'] = str_pad($this->config->get('quickcheckout_delivery_min_hour'), 2, '0', STR_PAD_LEFT) . ' 00 - ' . str_pad($this->config->get('quickcheckout_delivery_max_hour'), 2, '0', STR_PAD_LEFT) . ' 00';
		}

		if (empty($this->session->data['shipping_methods'])) {
			$data['error_warning'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
		} else {
			$data['error_warning'] = '';
		}	
					
		if (isset($this->session->data['shipping_methods'])) {
			$data['shipping_methods'] = $this->session->data['shipping_methods']; 
		} else {
			$data['shipping_methods'] = array();
		}
		
		if (isset($this->request->post['shipping_method'])) {
			$data['code'] = $this->request->post['shipping_method'];
		} elseif (isset($this->session->data['shipping_method']['code'])) {
			$data['code'] = $this->session->data['shipping_method']['code'];
		} else {
			$data['code'] = $this->config->get('quickcheckout_shipping_default');
		}
		
		if (isset($this->request->post['shipping_location'])) {
			$data['shipping_location'] = $this->request->post['shipping_location'];
		} elseif (isset($this->session->data['shipping_location'])) {
			$data['shipping_location'] = $this->session->data['shipping_location'];
		} else {
			$data['shipping_location'] = false;
		}

		$exists = false;
		$stored_code = false;
		
		foreach ($data['shipping_methods'] as $key => $shipping_method) {
			if ($key == $data['code']) {
				foreach ($shipping_method['quote'] as $quote) {
					$exists = true;
					
					$data['code'] = $quote['code'];
					
					break;
				}
				
				break;
			} else {
				foreach ($shipping_method['quote'] as $quote) {
					if (!$stored_code) {
						$stored_code = $quote['code'];
					}
					
					if ($quote['code'] == $data['code']) {
						$exists = true;
						
						break;
					}
				}
			}
		}

		if (!$exists) {
			$data['code'] = $stored_code;
		}

		if((isset($this->session->data['shipping_method']) && $this->session->data['shipping_method']['code'] == 'pickup.pickup') || $data['code'] == 'pickup.pickup'){
		    $data['text_delivery'] = $this->language->get('text_pickup_date');
		} else {
			$data['text_delivery'] = $this->language->get('text_delivery');
		}
		
		$data['gotLocation'] = 0;

		if (isset($this->request->post['delivery_date'])) {
			$data['delivery_date'] = $this->request->post['delivery_date'];
		} elseif (isset($this->session->data['delivery_date'])) {
			$data['delivery_date'] = $this->session->data['delivery_date'];
		} else {
			$data['delivery_date'] = '';
		}
		
		if (isset($this->request->post['delivery_time'])) {
			$data['delivery_time'] = $this->request->post['delivery_time'];
		} elseif (isset($this->session->data['delivery_time'])) {
			$data['delivery_time'] = $this->session->data['delivery_time'];
		} else {
			$data['delivery_time'] = '';
		}
		
		// All variables
		$data['logged'] = $this->customer->isLogged();
		$data['debug'] = $this->config->get('quickcheckout_debug');
		$data['shipping'] = $this->config->get('quickcheckout_shipping');
		$data['shipping_logo'] = $this->config->get('quickcheckout_shipping_logo');

		if($data['shipping_logo']){
			foreach($data['shipping_logo'] as &$image){
				$image = 'image/' . $image;
			}
		}

		// General Shipping Notice
		$quickcheckout_shipping_general_notice = $this->config->get('quickcheckout_shipping_general_notice');
		if($quickcheckout_shipping_general_notice){
			foreach($quickcheckout_shipping_general_notice as $language_id => &$general_description){
				$general_description = html($general_description);
				if(trim(strip_tags($general_description)) == ""){
					$general_description = '';
				}
			}
		}

		$data['general_description'] = '';
		if(isset($quickcheckout_shipping_general_notice[$this->config->get('config_language_id')])){
			$data['general_description'] = $quickcheckout_shipping_general_notice[$this->config->get('config_language_id')];
		}
		// End General Shipping Notice
		
		// Individual Shipping Notice

		$quickcheckout_shipping_individual_shipping_notice = $this->config->get('quickcheckout_shipping_individual_shipping_notice');
		if($quickcheckout_shipping_individual_shipping_notice){
			foreach($quickcheckout_shipping_individual_shipping_notice as $code => $individual_notice){
				foreach($individual_notice as $language_id => $each_notice){
					if(trim(strip_tags($each_notice)) == ""){
						$quickcheckout_shipping_individual_shipping_notice[$code][$language_id] = '';
					}
				}
			}
		}
		else{
			$quickcheckout_shipping_individual_shipping_notice = array();
		}
		//debug($quickcheckout_shipping_individual_shipping_notice);
		foreach ($data['shipping_methods'] as $code => &$value) {
			$value['notice']	=	'';
			if(isset($quickcheckout_shipping_individual_shipping_notice[$code][$this->config->get('config_language_id')])){
				$value['notice']	=	$quickcheckout_shipping_individual_shipping_notice[$code][$this->config->get('config_language_id')];
			}
		}
		//debug($data['shipping_methods']);
		
		// Individual Shipping Notice
		
		
		//debug($data['quickcheckout_shipping_general_notice']);
		//debug($data['quickcheckout_shipping_individual_shipping_notice']);

		$data['delivery'] = $this->config->get('quickcheckout_delivery');
		$data['delivery_delivery_date'] = $this->config->get('quickcheckout_delivery_date');
		$data['delivery_delivery_time'] = $this->config->get('quickcheckout_delivery_time');	//debug($data['delivery_delivery_time']);
		$data['delivery_required'] = $this->config->get('quickcheckout_delivery_required');
		$data['delivery_times'] = $this->config->get('quickcheckout_delivery_times');
		$data['delivery_times_cutoff'] = $this->config->get('quickcheckout_delivery_times_cutoff');
		$data['delivery_unavailable'] = html($this->config->get('quickcheckout_delivery_unavailable'));
		$data['delivery_days_of_week'] = html($this->config->get('quickcheckout_delivery_days_of_week'));
		$data['cart'] = $this->config->get('quickcheckout_cart');
		$data['shipping_reload'] = $this->config->get('quickcheckout_shipping_reload');
		$data['language_id'] = $this->config->get('config_language_id');
		
		if ($this->config->get('quickcheckout_delivery_min')) {
			$data['delivery_min'] = date('Y-m-d', strtotime('+' . $this->config->get('quickcheckout_delivery_min') . ' days'));
		} else {
			$data['delivery_min'] = date('Y-m-d');
		}

		//Check delivery time level cut off time
		if(isset($this->session->data['delivery_date']) && $this->session->data['delivery_date'] != ''){
			//only valid when selected date is today
			if(date('Y-m-d') == $this->session->data['delivery_date']){
				if(count($data['delivery_times']) > 0){
					//find and compare each time slot cut off time, if current time more than cut off time, it will be unset from array
					$data['delivery_times'] = $this->processDeliveryTimeCutOff($data['delivery_times'],$data['delivery_times_cutoff'],$this->session->data['delivery_time'], 'cutoff');
				}
			}
		}

		//Delivery cut off time
		$data['clear_datetimepicker_value'] = false;
		if ($this->config->get('quickcheckout_delivery_cutoff_time') && $this->isValidDate($this->config->get('quickcheckout_delivery_cutoff_time'), 'H:i:s')) {
			
			$time_now = date('H:i:s');
			if(strtotime($time_now) >= strtotime($this->config->get('quickcheckout_delivery_cutoff_time'))){
				$data['delivery_min'] = date('Y-m-d', strtotime("+1 day", strtotime($data['delivery_min'])));
				if(isset($this->session->data['delivery_date']) && (date('Y-m-d') == $this->session->data['delivery_date'])){
					unset($this->session->data['delivery_date']);
					$data['clear_datetimepicker_value'] = true;
				}
			}
		}
		
		if ($this->config->get('quickcheckout_delivery_max')) {
			$data['delivery_max'] = date('Y-m-d', strtotime('+' . $this->config->get('quickcheckout_delivery_max') . ' days'));
		} else {
			$data['delivery_max'] = date('Y-m-d');
		}
		
		$hours = range($this->config->get('quickcheckout_delivery_min_hour'), $this->config->get('quickcheckout_delivery_max_hour'));

		$data['hours'] = implode(',', $hours);
		

		$this->response->setOutput($this->load->view('quickcheckout/shipping_method', $data));
  	}
	
	public function set() {
		$this->load->model('account/address');
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');

		unset($this->session->data['shipping_location']);
		
		if ($this->customer->isLogged() && isset($this->request->get['address_id'])) {
			// Selected stored address
			$this->session->data['shipping_address_id'] = $this->request->get['address_id'];
			
			$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->request->get['address_id']);

			if (isset($this->session->data['guest'])) {
				unset($this->session->data['guest']);
			}
		} elseif (isset($this->request->post['country_id'])) {
			// Selected new address OR is a guest
			if (isset($this->request->post['country_id'])) {
				$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
			} else {
				$country_info = '';
			}
			
			if (isset($this->request->post['zone_id'])) {
				$zone_info = $this->model_localisation_zone->getZone($this->request->post['zone_id']);
			} else {
				$zone_info = '';
			}
			
			if ($country_info) {
				$shipping_address['country'] = $country_info['name'];
				$shipping_address['iso_code_2'] = $country_info['iso_code_2'];
				$shipping_address['iso_code_3'] = $country_info['iso_code_3'];
				$shipping_address['address_format'] = $country_info['address_format'];
			} else {
				$shipping_address['country'] = '';
				$shipping_address['iso_code_2'] = '';
				$shipping_address['iso_code_3'] = '';
				$shipping_address['address_format'] = '';
			}
			
			if ($zone_info) {
				$shipping_address['zone'] = $zone_info['name'];
				$shipping_address['zone_code'] = $zone_info['code'];
			} else {
				$shipping_address['zone'] = '';
				$shipping_address['zone_code'] = '';
			}
		
			$shipping_address['firstname'] = $this->request->post['firstname'];
			$shipping_address['lastname'] = $this->request->post['lastname'];
			$shipping_address['company'] = $this->request->post['company'];
			$shipping_address['address_1'] = $this->request->post['address_1'];
			$shipping_address['address_2'] = $this->request->post['address_2'];
			$shipping_address['postcode'] = $this->request->post['postcode'];
			$shipping_address['city'] = $this->request->post['city'];
			$shipping_address['country_id'] = $this->request->post['country_id'];
			$shipping_address['zone_id'] = $this->request->post['zone_id'];
			
			$this->session->data['shipping_address'] = $shipping_address;
		}
		
		if (isset($this->request->post['delivery_date'])) {
			$this->session->data['delivery_date'] = strip_tags($this->request->post['delivery_date']);
		}
		
		if (isset($this->request->post['delivery_time'])) {
			$this->session->data['delivery_time'] = strip_tags($this->request->post['delivery_time']);
		}
		
		if (isset($this->request->post['shipping_method']) && isset($this->session->data['shipping_methods'])) {
			$shipping = explode('.', $this->request->post['shipping_method']);
			
			if (isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
				$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
			}
		}
		
		if (isset($this->request->post['shipping_location']) && isset($this->request->post['is_location']) && $this->request->post['is_location'] == '1') {
			$this->session->data['shipping_location'] = $this->request->post['shipping_location'];
		}
	}
	
	public function validate() {
		$this->load->language('checkout/checkout');
		$this->load->language('quickcheckout/checkout');
		
		$json = array();
        
        // Set address
        $shipping_address = array();

		if (isset($this->session->data['shipping_address'])) {
			$shipping_address = $this->session->data['shipping_address'];
		}
		
		// Validate if shipping is required. If not the customer should not have reached this page.
		if (!$this->cart->hasShipping()) {
			$json['redirect'] = $this->url->link('quickcheckout/checkout', '', true);
		}

		// Validate if shipping address has been set.
		if (empty($shipping_address)) {
			$json['redirect'] = $this->url->link('quickcheckout/checkout', '', true);
		}
		
		if (!empty($shipping_address)) {
			// Shipping Methods
			$method_data = array();

			$this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('shipping');

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/shipping/' . $result['code']);

					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote($shipping_address);

					if ($quote) {
						$method_data[$result['code']] = array(
							'title'      => $quote['title'],
							'quote'      => $quote['quote'],
							'sort_order' => $quote['sort_order'],
							'error'      => $quote['error']
						);
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['shipping_methods'] = $method_data;
		}
		
		if (!isset($this->request->post['shipping_method'])) {
			$json['error']['warning'] = $this->language->get('error_shipping');
		} else {
			$shipping = explode('.', $this->request->post['shipping_method']);

			if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
				$json['error']['warning'] = $this->language->get('error_shipping');
			}
		}
		
		if ($this->config->get('quickcheckout_delivery_required') && $this->config->get('quickcheckout_delivery_date') ) {
			if (empty($this->request->post['delivery_date'])) {
				$json['error']['warning'] = $this->language->get('error_delivery');
				if($this->request->post['shipping_method'] == 'pickup.pickup'){
					$json['error']['warning'] = $this->language->get('error_pickup');
				}
			}
		}
		
		if (!$json) {	
			$shipping = explode('.', $this->request->post['shipping_method']);
				
			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
			
			$this->session->data['delivery_date'] = strip_tags($this->request->post['delivery_date']);
			
			if (isset($this->request->post['delivery_time'])) {
				$this->session->data['delivery_time'] = strip_tags($this->request->post['delivery_time']);
			} else {
				$this->session->data['delivery_time'] = '';
			}				
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));	
	}
	public function isValidDate(string $date, string $format = 'Y-m-d'): bool
	{
		$dateObj = DateTime::createFromFormat($format, $date);
		return $dateObj && $dateObj->format($format) == $date;
	}

	public function processDeliveryTimeCutOff($delivery_times, $delivery_times_cutoff, $delivery_time_selected) {
		//Find array key associate with selected delivery time
		$cut_off_time = '';
		$key_found = '';
		foreach($delivery_times as $find_key => $time){
			if(trim($time[$this->config->get('config_language_id')]) == trim($delivery_time_selected)){
				$key_found = $find_key;
			}

			if(isset($delivery_times_cutoff[$find_key]) && $delivery_times_cutoff[$find_key] != ''){
				$cut_off_time = $delivery_times_cutoff[$find_key];
				if($cut_off_time != '' && $this->isValidDate($cut_off_time, 'H:i:s')){
					//compare time now with cut off time
					$time_now = date('H:i:s');
					if(strtotime($time_now) >= strtotime($cut_off_time)){
						//hide the array
						unset($delivery_times[$find_key]);
					}
				}
			}
		}

		return $delivery_times;
	}
}