<?php
class ControllerExtensionModuleCustom5 extends Controller {
	public function index() {
		// Handle custom4 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom5';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		// $data['title'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'title' );
		$data['repeater'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'repeater' );
		$data['links'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'links' );
		// $data['text'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'text' );

		return $this->load->view('extension/module/custom5', $data);
	}
	public function migrate() {
		// Handle custom4 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom5';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['repeater'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'repeater' );
		$data['links'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'links' );

		return $data;
	}
}