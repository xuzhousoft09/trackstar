<?php
$this->breadcrumbs=array(
	'Projects',
);

$this->menu=array(
	array('label'=>'List Project', 'url'=>array('index')),
	array('label'=>'Manage Project', 'url'=>array('admin'),'visible'=>Yii::app()->user->checkAccess("admin")),
);
?>

<?php if($sysMessage != null):?>
<div class="sys-message">
<?php echo 'Recent message:'."&nbsp$sysMessage" ;?>
</div>
<?php Yii::app()->clientScript->registerScript('fadeAndHideEffect','$(".sys-message").animate({opacity: 1.0}, 10000).fadeOut("slow");'
); endif; ?>




<br/>


<h1>Projects</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
