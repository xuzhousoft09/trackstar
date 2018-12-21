<?php

class Upload extends CFormModel
{
	public $file;
	public function rules()
	{
		return array(
				array('file', 'file', 'types'=>'pdf'),
		);
	}
	
	public function downloadFile($fullpath){
		$dir = Yii::getPathOfAlias('application.uploads');
		$filename= $fullpath;
	  
		if(!empty($fullpath)){
			$file = $dir."\\"."$filename";
			
			
			header("Content-type: application/pdf");
            header("Content-Disposition: inline; filename=$filename");
            @readfile($file);
			
		
			Yii::app()->end();
		}
		else {return false;}
		
	}
}