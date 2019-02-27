<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\datetime\DateTimePicker;
$this->title="修改图书信息";
$this->params['breadcrumbs'][] = ['label' => '图书信息管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$titleH = $this->title."《".$model->book_name."》";
?>
<style>
    .book-update{
        padding:20px;
        border-radius:12px;
        box-shadow:0 0 3px 0 rgba(0,0,0,.5);
    }
</style>
<div class="book-update">
    <?=$this->render('form',[
        'titleH'=>$titleH,
        'model'=>$model,
    ])?>
</div>