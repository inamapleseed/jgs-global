<?php 
class ControllerExtensionModuleCustom4 extends controller {
	public function index() {
		$array = array(
            'oc' => $this,
            'heading_title' => 'Be Our Partner',
            'modulename' => 'custom4',
            'fields' => array(
                array('type' => 'text', 'label' => 'Section Title', 'name' => 'stitle'),
                array('type' => 'textarea', 'label' => 'Description', 'name' => 'stext', 'ckeditor' =>true),
                array('type' => 'text', 'label' => 'Button Name', 'name' => 'sbutton'),
                array('type' => 'text', 'label' => 'URL', 'name' => 'surl'),
                array('type' => 'image', 'label' => 'Background Image', 'name' => 'sbg'),

                array('type' => 'repeater', 'label' => 'Content', 'name' => 'repeater', 'fields' => array(
                    array('type' => 'text', 'label' => 'Title', 'name' => 'ftitle'),
                    array('type' => 'text', 'label' => 'URL', 'name' => 'furl'),
                    array('type' => 'image', 'label' => 'Image', 'name' => 'fimage'),
                    )
                )
            ),
        );
        $this->modulehelper->init($array);
	}
}