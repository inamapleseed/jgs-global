<?php 
class ControllerExtensionModuleCustom5 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Homepage UI',
            'modulename' => 'custom5',
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Announcement Bar Links', 'name' => 'links', 'fields' => array(
                    array('type' => 'text', 'label' => 'Title', 'name' => 'ltitle'),
                    array('type' => 'text', 'label' => 'URL', 'name' => 'lurl'),
                    )
                ),
                array('type' => 'repeater', 'label' => 'Content', 'name' => 'repeater', 'fields' => array(
                    array('type' => 'image', 'label' => 'Image', 'name' => 'himage'),
                    array('type' => 'text', 'label' => 'Title', 'name' => 'htitle'),
                    array('type' => 'text', 'label' => 'Button Name', 'name' => 'hbutton'),
                    array('type' => 'text', 'label' => 'URL', 'name' => 'hurl'),
                    )
                )
            ),
        );
        $this->modulehelper->init($array);
	}
}