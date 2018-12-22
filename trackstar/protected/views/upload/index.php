<?php if($uploaded):?>


<p>File was uploaded. Check <?php echo $dir?>.</p>

<?php endif ?>
<?php echo CHtml::beginForm('','post',array
('enctype'=>'multipart/form-data'))?>
<?php echo CHtml::error($model, 'file')?>
<?php echo CHtml::activeFileField($model, 'file')?>
<?php echo CHtml::submitButton('Upload')?>
<?php echo CHtml::endForm()?>
<br/>



<?php $model=new Upload(); ?>

<?php if(isset($_POST['Upload'])){$model->attributes=$_POST['Upload'];

$this->file=CUploadedFile::getInstance($model,'file');

echo CHtml::link($this->file->getName(),array('/upload/download','id'=>$this->file->getName())); 

}?>





