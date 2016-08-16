<?php

class Chat extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('chat_model');
        $this->load->helper('url_helper');
    }

    public function index()
    {
        $this->load->helper('form');
        $this->load->library('form_validation');

        $data['chat'] = $this->chat_model->get_all_msg();

        $this->load->view('chat/index', $data);
    }

    public function create()
    {
        $data['chat'] = $this->chat_model->get_all_msg();

        $this->load->helper('form');
        $this->load->library('form_validation');

        $this->form_validation->set_rules('sender', 'Name', 'required');
        $this->form_validation->set_rules('text', 'Message', 'required');

        if ($this->form_validation->run() === FALSE) {
            $this->load->view('chat/index', $data);
        } else {
            $this->chat_model->add_msg();
            redirect('chat/index');
        }
    }

}
