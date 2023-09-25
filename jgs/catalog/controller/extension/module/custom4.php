<?php
class ControllerExtensionModuleCustom4 extends Controller {
	public function index() {
		// Handle custom4 fields
		$oc = $this;
		$language_id = $this->config->get('config_language_id');
		$modulename  = 'custom4';
	    $this->load->library('modulehelper');
	    $Modulehelper = Modulehelper::get_instance($this->registry);

		$data['repeater'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'repeater' );
		$data['stitle'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'stitle' );
		$data['stext'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'stext' );
		$data['sbutton'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'sbutton' );
		$data['surl'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'surl' );
		$data['sbg'] = $Modulehelper->get_field ( $oc, $modulename, $language_id, 'sbg' );

		return $this->load->view('extension/module/custom4', $data);
	}
}