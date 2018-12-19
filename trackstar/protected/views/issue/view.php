<?php
/* $this->breadcrumbs=array(
	'Issues'=>array('index'),
	$model->name,
); */

$this->breadcrumbs=array(
		$model->project->name=>array('project/view', 'id'=>$model->project->id),
		/* 'Issues'=>array('index'), */
		$model->name,
);

$this->menu=array(
	array('label'=>'List Issue', 'url'=>array('index','pid'=>$model->project->id)),
    /* array('label'=>'Create Issue', 'url'=>array('create','pid'=>$model->project->id)), */
	/* array('label'=>'Create Issue', 'url'=>array('create')), */
    
	/* array('label'=>'Update Issue', 'url'=>array('update', 'id'=>$model->id)), */
	/* array('label'=>'Delete Issue', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')), */
	/* array('label'=>'Manage Issue', 'url'=>array('admin', 'pid'=>$model->project->id)), */
		);
/* array('label'=>'Manage Issue', 'url'=>array('admin', 'pid'=>$model->project->id,'visible'=>Yii::app()->user->checkAccess("admin"))), */
/* var_dump($model);exit; */
/* if(Yii::app()->user->checkAccess('createIssue',array('issue'=>$model))) */ 
$project=$this->loadProject($model->project_id);
/* var_dump($project); exit; */
$params=array('project'=>$project);
/* var_dump($model); exit;  //retruned fals */ 
if(Yii::app()->user->checkAccess('createIssue',$params))

{
	$this->menu[] = array('label'=>'Create Issue',
			'url'=>array('create', 'pid'=>$model->project->id));
}

if(Yii::app()->user->checkAccess('updateIssue',$params))
{
	$this->menu[] = array('label'=>'Update Issue',
			'url'=>array('update', 'id'=>$model->id));
}
/* var_dump(Yii::app()->user->checkAccess('deleteIssue',$params));exit; */
if(Yii::app()->user->checkAccess('deleteIssue',$params))
{
	$this->menu[] = array('label'=>'Delete Issue', 
'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?'));
			
}

if(Yii::app()->user->checkAccess('admin'))
{
	$this->menu[] = array('label'=>'Manage Issue',
			'url'=>array('admin', 'pid'=>$model->project->id));
} 
				
?>

<h1>View Issue #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'description',
		/* 'project_id', */
	     array(
	        'name'=>'type_id',
	        'value'=>CHtml::encode($model->getTypeText()),
	    ),
	    
	    array(
	      'name'=>'status_id',
	        'value'=>CHtml::encode($model->getStatusText())
	    ), 
	   /*  'type_id', */
	    /* 'status_id', */
	    
	    array(
	      'name'=>'owner_id',
	        'value'=>CHtml::encode($model->owner->username)
	    ), 
	   array(
	        'name'=>'requester_id',
	        'value'=>CHtml::encode($model->requester->username)
	    ), 
	
	/* 	'owner_id', 
	   'requester_id',  */
		
	),
)); ?>

