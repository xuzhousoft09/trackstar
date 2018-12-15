<?php
$this->breadcrumbs=array(
	'Projects',
);

$this->menu=array(
	array('label'=>'Create Project', 'url'=>array('create')),
	array('label'=>'Manage Project', 'url'=>array('admin')),
);
?>

<?php if($sysMessage != null):?>
<div class="sys-message">
<?php echo 'Broadcast:'."&nbsp<u>$sysMessage</u>" ;?>
</div>
<?php endif; ?>

<br/>


<h1>Projects</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
