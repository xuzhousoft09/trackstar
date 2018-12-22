<?php


class UploadController extends Controller
{
     public  $file;
	
	function actionIndex()
	{
		$dir = Yii::getPathOfAlias('application.uploads');
	
		$uploaded = false;
		$model=new Upload();
		
		if(isset($_POST['Upload']))
		{
			$model->attributes=$_POST['Upload'];
			
			$this->file=CUploadedFile::getInstance($model,'file');
			
			$file=$this->file;
			
			if($model->validate()){
				$uploaded = $file->saveAs($dir.'/'.$file->getName());
				
			}
		}
		$this->render('index', array(
				'model' => $model,
				'uploaded' => $uploaded,
				'dir' => $dir,
		));
	}
	
	public function actionDownload($id){
		
		
		$path = Yii::getPathOfAlias('/yiiroot/trackstar/protected/uploads/')."$id";
	   
		$upload=new Upload();
		
		$upload->downloadFile($path);
	}
}