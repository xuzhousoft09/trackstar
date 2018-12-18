<?php
$this->breadcrumbs=array(
	'Issues',
);


$this->menu=array(
    array('label'=>'Create Issue', 'url'=>array('create'),'visible'=>Yii::app()->user->checkAccess("admin")),
    array('label'=>'Manage Issue', 'url'=>array('admin'),'visible'=>Yii::app()->user->checkAccess("admin")),
    
);

if(Yii::app()->user->checkAccess('createIssue'))
{
	$this->menu[] = array('label'=>'Create Issue',
			'url'=>array('create', 'pid'=>$model->project->id));
}

?>

<h1>Issues</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
