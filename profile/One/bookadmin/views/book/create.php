<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\datetime\DateTimePicker;
$this->title="添加图书";
$this->params['breadcrumbs'][] = ['label' => '图书信息管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .book-create{
        padding:20px;
        border-radius:12px;
        box-shadow:0 0 3px 0 rgba(0,0,0,.5);
    }
</style>
<div class="book-create">
   <?=$this->render('form',[
       'titleH' => $this->title,
       'model' => $model, 
   ])?>
</div>