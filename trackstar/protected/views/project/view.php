<?php
$this->breadcrumbs=array(
	'Projects'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Project', 'url'=>array('index')),
	/* array('label'=>'Create Project', 'url'=>array('create')), */
	/* array('label'=>'Update Project', 'url'=>array('update', 'id'=>$model->id)), */
/* 	array('label'=>'Delete Project', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')), */
	/* array('label'=>'Manage Project', 'url'=>array('admin')),  */
    array('label'=>'Create Issue', 'url'=>array('issue/create','pid'=>$model->id)), 
		
);
if(Yii::app()->user->checkAccess('createUser',array('project'=>$model)))
{
	$this->menu[] = array('label'=>'Add User To Project',
			'url'=>array('adduser', 'id'=>$model->id));
}
if(Yii::app()->user->checkAccess('admin',array('project'=>$model)))
{
	$this->menu[] = array('label'=>'Manage project',
			'url'=>array('admin'));
} 
if(Yii::app()->user->checkAccess('updateProject',array('project'=>$model)))
	{
		$this->menu[] = array('label'=>'Update Project',
				'url'=>array('update', 'id'=>$model->id));// defined only the users who have the updateProject permission can update the projects
	}
	
if(Yii::app()->user->checkAccess('createProject',array('project'=>$model)))
{
	$this->menu[] = array('label'=>'Create Project', 
			     'url'=>array('create'));
			
}
if(Yii::app()->user->checkAccess('deleteProject',array('project'=>$model)))
{
	array('label'=>'Delete Project', 
			     'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?'));

	
}
?>

<h1>View Project #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'description',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
	),
)); ?>
    
    
	<?php /* echo CHtml::link('Add User To Project',array('adduser','id'=>$model->id)); */ ?>
	
	<?php /* var_dump($model); */ ?>
	<br/>

<br>
<h1>Project Issues</h1>
<?php $this->widget('zii.widgets.CListView', array(
'dataProvider'=>$issueDataProvider,
'itemView'=>'/issue/_view',
)); ?>


