<?php
use yii\helpers\Html;
\yii\web\YiiAsset::register($this);
$this->title= '图书详情';
$this->params['breadcrumbs'][] = ['label' => '图书信息管理', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    .book-title{
        padding:10px 40px;
        text-shadow:0 2px 3px rgba(0,0,0,.5);
    }
    .book-img{
        text-align:center;
    }
    .book-img img{
        width:70%;
    }
    .book-message {
        font-size:17px;
    }
    .book-message>p{
        margin-top:20px;
    }
    .book-message span{
        color:#666;
    }
    .book_introduction{
        padding:0 20px;
    }
    .book_introduction > :nth-child(1){
        padding:20px 0 0 0;
        font-size:24px;
        font-weight:bold;
    }
    .book_introduction > :nth-child(2){
        box-shadow:0 0 3px 0 rgba(0,0,0,.5);
        padding:12px;
        transition: box-shadow .5s;
        border-radius:5px;
    }
    .book_introduction > :nth-child(2):hover{
        box-shadow:0 3px 5px 0 rgba(0,0,0,.2),
                   .5px 3px 5px 0 rgba(0,0,0,.2),
                   -.5px 3px 5px 0 rgba(0,0,0,.2);        
    }
    .book-view{
        padding:20px;
        border-radius:12px;
        box-shadow:0 0 3px 0 rgba(0,0,0,.5);
        min-height:700px;
    }
</style>
<div class="book-view">
    <div class="row book-title">
        <h2><?=Html::encode($model->book_name)?></h2>
    </div>
    <div class="row">
        <div class="col-md-4 book-img">
            <img src="<?=Html::encode($model->book_image)?>" alt="" srcset="">
        </div>
        <div class="col-md-8 book-message">
            <p><span>ISBN：</span><?=Html::encode($model->book_isbn)?></p>
            <p><span>作者：</span><?=Html::encode($model->book_author)?></p>
            <p><span>出版社：</span><?=Html::encode($model->book_press)?></p>
            <p><span>价格：</span><?=Html::encode($model->book_price)?>元</p>
            <p><span>时间：</span><?=Html::encode($model->book_time)?></p>
        </div>
    </div>
    <div class="row book_introduction">
        <p>简介：</p>
        <p>
            <?=Html::encode($model->book_introduction)?>
        </p>
    </div>
</div>