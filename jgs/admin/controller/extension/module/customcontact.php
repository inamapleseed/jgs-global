<?php 
class ControllerExtensionModuleCustomContact extends controller {
    public function index() {
        $array = array(
            'oc' => $this,
            'heading_title' => 'Custom Contact',
            'modulename' => 'customcontact',
            'fields' => array(
                array('type' => 'text', 'label' => 'Title', 'name' => 'ctitle'),
                array('type' => 'image', 'label' => 'Background Image', 'name' => 'cbg'),

                array('type' => 'textarea', 'label' => 'Description', 'name' => 'description', 'ckeditor' =>true),
            )
        );
        $this->modulehelper->init($array);
    }
}