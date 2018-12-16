<?php

class AdminModule extends CWebModule
{
	public function init()
	{
		// this method is called when the module is being created
		// you may place code here to customize the module or the application

		// import the module-level models and components
		$this->setImport(array(
			'admin.models.*',
			'admin.components.*',
		));
		
		
		$this->layout = 'main';
	}
/* 	public function beforeControllerAction($controller, $action)
	
	{
		if(parent::beforeControllerAction($controller, $action))
		{
			if( !Yii::app()->user->checkAccess("admin") )
			{
	
				throw new CHttpException(403,Yii::t('application','You
are not authorized to perform this action.'));
			}
			return ture;
		}
		else
			return false;
	} */

			
	 public function beforeControllerAction($controller, $action)
	 {
	  if(parent::beforeControllerAction($controller, $action))
	 {
	  // this method is called before any module controller action is performed
	   // you may place customized code here
	 
	 if(Yii::app()->user->isGuest){
	 	
	 	/* var_dump(Yii::app()->user->isGuest); exit; //returned true.*/
	 	/* var_dump(Yii::app()->user->loginUrl); exit; //returned array (size=1)0 => string '/site/login' (length=11) */
	 	
	 $url = Yii::app()->createUrl('/site/login');
	 
/* 	 var_dump($url); exit; */
	/*  Yii::app()->user->returnUrl = Yii::app()->createUrl('/admin/'); */
	 Yii::app()->request->redirect($url);
	}
	 else {
	   return true;
	 }
	 
	 }
	 else
	 return false;
	 }
}
