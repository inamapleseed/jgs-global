<?php 
class ControllerExtensionModuleCustom3 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'About Us',
            'modulename' => 'custom3',
            'fields' => array(
                array('type' => 'repeater', 'label' => 'Text Content', 'name' => 'repeater', 'fields' => array(
                    array('type' => 'text', 'label' => 'Title', 'name' => 'title'),
                    array('type' => 'textarea', 'label' => 'Text Content', 'name' => 'text', 'ckeditor' =>true),
                    array('type' => 'text', 'label' => 'URL', 'name' => 'url'),
                    array('type' => 'text', 'label' => 'Button Name', 'name' => 'button_name'),
                    )
                ),

                array('type' => 'text', 'label' => 'Section Title', 'name' => 'stitle'),

                array('type' => 'repeater', 'label' => 'Our Team', 'name' => 'teammates', 'fields' => array(
                    array('type' => 'image', 'label' => 'Image', 'name' => 'timage'),
                    array('type' => 'text', 'label' => 'Name', 'name' => 'tname'),
                    array('type' => 'text', 'label' => 'Job Position', 'name' => 'tjob'),
                    array('type' => 'textarea', 'label' => 'Description', 'name' => 'tdesc', 'ckeditor' =>true),
                    )
                ),
            ),
        );
        $this->modulehelper->init($array);
	}
}