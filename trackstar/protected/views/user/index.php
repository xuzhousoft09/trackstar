<?php
$this->breadcrumbs=array(
	'Users',
);

$this->menu=array(
		array('label'=>'List User', 'url'=>array('index')),
	array('label'=>'Create User', 'url'=>array('admin'),'visible'=>Yii::app()->user->checkAccess("admin")),
	/* array('label'=>'Manage User', 'url'=>array('admin')), */
	array('label'=>'Manage User', 'url'=>array('admin'),'visible'=>Yii::app()->user->checkAccess("admin")),
		);
?>

<h1>Users</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
