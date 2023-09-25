<?php
class ControllerExtensionModuleCustom3 extends Controller {
	public function index() {
		// Handle custom3 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom3';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['repeater'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'repeater' );
		$data['teammates'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'teammates' );
		$data['stitle'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'stitle' );

		return $this->load->view('extension/module/custom3', $data);
	}
}