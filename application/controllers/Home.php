<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model(array('Webservice_model'));
    }

	public function index() {
		$offset=$this->uri->segment('2');
		$dir = "assets/docs/";
		if (is_dir($dir)) {
			$myfiles = scandir($dir);		
			unset($myfiles[0]);
			unset($myfiles[1]);
			$perpage=5;
			$data['Handler']=$this->Webservice_model->get_covidfiles_limits($perpage,$offset);
			$this->load->library('pagination');
			$config['base_url'] = base_url().'home/';
			$config['total_rows'] = count($myfiles);
			$config['per_page'] = 5;
			$this->pagination->initialize($config);
			//$data['Handler']=$myfiles;
			$data['active']="1";
			$data['admin']=$this->Webservice_model->admin_get();
			$this->load->view('home/index',$data);
		}
	}
	public function user_file() {
		$filename=$this->uri->segment('2');
		$dir = "assets/docs/$filename";
		if(unlink("$dir")) {
			$records=array('filename'=>$filename,'covid_id'=>1);
			$this->Webservice_model->fileDelete($filename);
			$this->Webservice_model->fileHistory($records);
			redirect('home');
		} else {
			redirect('home');
		}
	}
	public function file_upload() {
		$config['upload_path']          = './assets/docs/';
		$config['allowed_types']        = 'gif|jpg|png|txt|doc|docx|pdf|png|jpeg|jpg|gif';
		$config['max_size']             = 2000;
		$records=array(
			'name'=>$this->input->post('username'),
			'filename'=>$_FILES['covidfiles']['name']);
			$this->load->library('upload', $config);
			if ( ! $this->upload->do_upload('covidfiles')) {
				$error = array('error' => $this->upload->display_errors());
				echo "<pre>"; print_r($error);exit;
			} else {
				$data = array('upload_data' => $this->upload->data());
				$this->Webservice_model->fileUploads($records);
				redirect('home');
		}
	}
	public function file_history() {
		$offset=$this->uri->segment('2');
		$perpage=5;
		$data['history']=$this->Webservice_model->get_history_limits($perpage,$offset);
		$this->load->library('pagination');
		$config['base_url'] = base_url().'file-history/';
		$config['total_rows'] = count($this->Webservice_model->get_history());
		$config['per_page'] = 5;
		$this->pagination->initialize($config);
		$data['admin']=$this->Webservice_model->admin_get();
		$data['active']="2";
		$this->load->view('home/history',$data);
		
	}
}
