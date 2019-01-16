<?php
namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\Book;
use yii\grid\GridView;
use yii\data\ActiveDataProvider;

class BookController extends Controller{
    //操作方法
    /**
     * 显示所有图书信息
     */
    public function actionIndex(){
        $query = Book::find();
        $dataProvider = new ActiveDataProvider([
            'query'=>Book::find(),
            'pagination'=>[
                'pageSize' => 5,
            ]
        ]);
        return $this->render('index',[
            'dataProvider'=> $dataProvider,
        ]);
    }
    /**
     * 
     * 删除图书操作
     */
    public function actionDelete($id){
        //调用findModel方法查找表里面是否有此ID的行
        $this -> findModel($id) -> delete();
        //重定向到index视图
        return $this->redirect(['index']);
    }
    /**
     *
     * 添加图书操作
     */
    public function actionCreate(){
        //创建book类数据
        $model = new Book();
        //判断是否添加成功
        if($model->load(Yii::$app->request->post()) && $model->save()){
            //添加成功重定向视图
            return $this->redirect(['index']);
        }
        //渲染create视图
        return $this->render('create',[
            'model' => $model,
        ]);
    }
    /**
     * 
     * 修改图书信息操作
     */
    public function actionUpdate($id){
        //查找数据库中指定id的数据行
        $model = $this->findModel($id);
        //判断是否修改成功
        if($model->load(Yii::$app->request->post()) && $model -> save()){
            //添加成功重定向视图
            return $this->redirect(['index']);

        }
        //渲染update视图
        return $this->render('update',[
            'model' => $model,
        ]);
    }
    /**
     * 显示图书信息视图
     * 
     **/
    public function actionView($id){
        //渲染view视图
        $model = $this->findModel($id);
        return $this->render('view',[
            'model' => $model,
        ]);
    }
    /**
     * 
     * 图书查询操作
     */
    public function actionSearch($name,$author){
        $model;
        //当什么都没输入的时候，查询所有
        if($name == "" && $author == ""){
            $model = Book::find();
        }else{
            //按作者和书名查询
            $model = $this->findModelNameAndAuthor($name,$author);
        }
        //生成组件图书信息
        $dataProvider = new ActiveDataProvider([
            'query'=>$model,
            'pagination'=>[
                'pageSize' => 5,
            ]
        ]);
        //渲染视图
        return $this->render('index',['dataProvider' => $dataProvider]);

    }

    //普通方法
    /**
     * 
     * 根据book_id查询图书
     */
    public function findModel($id){
        $model = Book::findOne($id);
        if($model !== null){
            return $model;
        }
        throw new Exception('未找到此id的数据');
    }
    /**
     * 
     * 根据图书 书名和作者查询
     */
    public function findModelNameAndAuthor($name,$author){
        if($name == "" && $author != ''){
            //根据作者模糊查询
            $model = Book::findBySql("select * from book where book_author like '%".$author."%'");  
        }else if($name != "" && $author == ''){
            //根据书名模糊查询
            $model = Book::findBySql("select * from book where book_name like '%".$name."%'");  
        }else{
            //根据作者和书名同时查询
            $model = Book::find()->where(['book_name'=>$name,'book_author'=>$author]);
        }
        if($model !== null){
            return $model;
        }
        throw new Exception('未找到此数据');
    }
}
?>