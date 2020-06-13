<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->model(array('Webservice_model'));
    }

	public function index() {
		$data['admin']=$this->Webservice_model->admin_get();
		$dir = "assets/docs/";
		if (is_dir($dir)) {
			$myfiles = scandir($dir);		
			unset($myfiles[0]);
			unset($myfiles[1]);
			$data['Handler']=$myfiles;
			$this->load->view('home/index',$data);
		}
	}
	public function home_page() {
		
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
		//$config['max_width']            = 1024;
		//$config['max_height']           = 768;
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
		$data['admin']=$this->Webservice_model->admin_get();
		$data['history']=$this->Webservice_model->get_history();
		//echo "<pre>"; print_r($data['history']);exit;
		$this->load->view('home/history',$data);
		
	}
}
