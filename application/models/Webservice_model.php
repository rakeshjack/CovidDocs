<?php

/**
 * Description of Webservice_model
 *
 * @author Rakesh.R
 */
class Webservice_model extends CI_Model {
    function __construct() {
        parent::__construct();
    }
    public function admin_get() {
        $this->db->select('*');
        $this->db->from('admin');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            $row = $query->row(); 
            return $row;
        }
        return false;;
    }

    public function fileUploads($records) {
        $this->db->insert('covidfiles', $records);
        return ($this->db->affected_rows() != 1) ? false : true;
    }
    public function fileHistory($records) {
        $this->db->insert('histories', $records);
        return ($this->db->affected_rows() != 1) ? false : true;
    } 
    public function fileDelete($filename) {
        $this->db->where('filename', $filename);
        $this->db->delete('covidfiles');
    }
    public function get_history() {
        $this->db->select("*");
        $this->db->from("histories");
        $query = $this->db->get();        
        return $query->result();
    }
}