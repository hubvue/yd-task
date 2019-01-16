<?php
use yii\helpers\Html;
use yii\widgets\LinkPager;
use yii\data\ActiveDataProvider;
use yii\widgets\ActiveForm;

use yii\grid\GridView;
$this->title = "图书信息管理";
$this->params['breadcrumbs'][] = $this->title;  //导航
?>
<style>
    .title{
        margin:20px 0;
    }
    .serch{
        display:flex;
        justify-content:space-between;
        margin:20px 0;
        box-shadow:0 0 3px 0 rgba(0,0,0,.5);
        padding:10px 10px 0 10px;
        border-radius:5px;
    }
    .serch form{
        display:flex;
    }
    .serch form input {
        margin-left:10px;
    }
    .serch form [type="submit"]{
        height : 34px;
    }
    .grid-view{
        padding:20px;
        box-shadow:0 0 3px 0 rgba(0,0,0,.5);
        border-radius:12px;
    }
    .grid-view td,.grid-view th{
        text-align:center;
    }
</style>
<div class="book-index">
    <h2 class="title"><?=Html::encode($this->title)?></h2>

    <!--查询操作 -->
    <div class="serch">
        <form action="index.php?r=book/search" method="get">
            <input type="hidden" value="book/search" name='r'>
            <input type="text" class="form-control"  placeholder="请输入书名" name="name">
            <input type="text" class="form-control"  placeholder="请输入作者" name="author">
            <input type="submit" value="查询" class="btn btn-success">
        </form>
        <!-- 添加图书操作 -->
        <p style="text-align:right">
            <?=Html::a('添加图书',['create'],['class'=> 'btn btn-success'])?>
        </p>
    </div>

    <!-- 显示图书表 -->
    <?=GridView::widget([
        'dataProvider'=>$dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],       //增加列表序号
            'book_isbn',
            'book_name',
            'book_author',
            'book_press',
            'book_price',
            'book_time',
            ['class' => 'yii\grid\ActionColumn'],      //增加动作操作
        ]
    ])?>
</div>