<?php

class Chat_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
    }

    public function get_all_msg()
    {
        $query = $this->db
            ->order_by('id DESC')
            ->get('chat');
        return $query->result_array();
    }

    public function clear_msg()
    {
        $query = $this->db->empty_table('chat');
        return $query->result_array();
    }

    public function add_msg()
    {
        $data = array(
            'sender' => $this->input->post('sender'),
            'text' => $this->input->post('text')
        );

        return $this->db->insert('chat', $data);
    }
}
