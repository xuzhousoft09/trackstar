<?php


class UploadController extends Controller
{
	function actionIndex()
	{
		$dir = Yii::getPathOfAlias('application.uploads');
	
		$uploaded = false;
		$model=new Upload();
		if(isset($_POST['Upload']))
		{
			$model->attributes=$_POST['Upload'];
			$file=CUploadedFile::getInstance($model,'file');
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
	
	public function actionDownload(){
		$upload=new Upload();
		$path = Yii::getPathOfAlias('/yiiroot/trackstar/protected/uploads/')."23602414.pdf";
	   
		
		
		$upload->downloadFile($path);
	}
}