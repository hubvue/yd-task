<?php
namespace app\models;
use yii\db\ActiveRecord;

class Book extends ActiveRecord{
    //定义图书的规则
    public function rules(){
        return [
            [['book_isbn','book_name','book_author','book_press','book_time','book_price','book_image','book_introduction'],'required'],
            ['book_price','number'],
        ];
    }
    //图书标签映射
    public function attributeLabels(){
        return [
            'book_isbn' => '书号',
            'book_name'=> '书名',
            'book_author' => '作者',
            'book_press' => '出版社',
            'book_price' => '价格',
            'book_time' => '入库时间',
            'book_image' => '图书图片地址',
            'book_introduction'=> '图书简介',
        ];
    }
}
?>