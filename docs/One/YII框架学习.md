## 使用YII开发图书管理系统
YII是php的一个全栈框架，使用Composer包管理器进行管理。

#### 安装Composer包管理器
Linux和MacOSX安装运行一下面命令
- 第一步：
>curl -sS https://getcomposer.org/installer | php

> 注：因为我的是Linux，使用的XAMPP，安装这一句的时候会出错，php未找到，原因是没有加环境变量。需要在~/.bash_bashrc里面配置环境变量，如果使用的是zsh，需要在~/.zshrc里面最后PATH追加环境变量。
在~/.bash_bashrc里面  export PATH=$PATH:/opt/lamp/bin
在~/.zshrc的最后的PATH追加:/opt/lamp/bin。不要忘记加:
最后重启计算机就OK了。

- 第二步：
>mv composer.phar /usr/local/bin/composer

#### 安装YII
在安装好Composer 在项目文件夹下通过一下命令来安装YII应用程序模板，创建文件名为basic的YII项目。此过程可能时间会比较长，科学上网的话会快些
>composer create-project --prefer-dist yiisoft/yii2-app-basic basic

这样YII就安装好了。

#### 目录结构
```
basic/
    composer.json		Composer配置文件，描述包信息
    config/				包含引用配置及其它配置
        console.php	控制台应用配置信息
        web.php		Web 应用配置信息
        db.php			连接数据库配置信息
    commands/			包含控制台命令类
    controllers/			包含控制器类
    models/			包含模型类
    runtime/			包含Yii在运行时生成的文件，例如日志和缓存文件
    vendor/				包含已经安装的Composer包，包括Yii框架自身
    views/				包含视图文件
    web/				Web应用根目录，包括Web入口文件
        assets/			包含Yii发布的资源文件(JavaScript和CSS)
        index.php		应用入口文件
    yii					Yii控制命令执行脚本	
```

#### 安装Assets
Yii依靠 Bower 和/或 NPM 软件包来安装 asset（CSS 和 JavaScript）库。 它使用Composer来获取这些库，允许 PHP 和 CSS/JavaScript 包版本同时解析。
```json
在composer.json'中添加caozuo
    "replace": {
        "bower-asset/jcaozuo.0",
        "bower-asset/icaozuo.2.0",
        "bower-asset/pcaozuo3.0",
        "bower-asset/ycaozuo.0.0"
    },
```

#### 运行应用
在终端项目根目录下执行caozuo开服务，在浏览器中输入127.0.0.1:8080/web/就可以访问项目。

#### 应用入口
通过访问web/index.php访问项目，这个是整个项目唯一一个可以访问的php脚本。

这样一个YII项目就创建好了。

### 来了解一下YII
#### 什么是YII？？?
Yii 是一个高性能，基于组件的 PHP 框架，用于快速开发现代 Web 应用程序。 名字 Yii （读作 易）在中文里有“极致简单与不断演变”两重含义， 也可看作 Yes It Is! 的缩写。

#### YII最适合干什么
Yii 是一个通用的 Web 编程框架，即可以用于开发各种用 PHP 构建的 Web 应用。 因为基于组件的框架结构和设计精巧的缓存支持，它特别适合开发大型应用， 如门户网站、社区、内容管理系统（CMS）、 电子商务项目和 RESTful Web 服务等。

#### YII的MVC设计模式
YII是一个典型的MVC设计模式的框架，从上面的目录结构就可以看出来：controller表示控制层，model表示数据层，view表示视图层。
##### YIIMVC模式的静态结构
![](https://www.yiichina.com/doc/guide/2.0/images/application-structure.png)
视图、控制、模型形成三角形状。模型与数据库进行操作为视图和控制器提供数据，控制器渲染特定视图，视图通过小部件和前端静态资源组合显示结果。

每个应用都有一个入口脚本 web/index.php，这是整个应用中唯一可以访问的 PHP 脚本。 入口脚本接受一个 Web 请求并创建应用实例去处理它。 应用在它的组件辅助下解析请求， 并分派请求至 MVC 元素。视图使用小部件 去创建复杂和动态的用户界面。

####YII的请求生命周期
![](https://www.yiichina.com/doc/guide/2.0/images/request-lifecycle.png)

1. 用户向入口脚本 web/index.php 发起请求。
2. 入口脚本加载应用配置并创建一个应用 实例去处理请求。
3. 应用通过请求组件解析请求的 路由。
4. 应用创建一个控制器实例去处理请求。
5. 控制器创建一个动作实例并针对操作执行过滤器。
6. 如果任何一个过滤器返回失败，则动作取消。
7. 如果所有过滤器都通过，动作将被执行。
8. 动作会加载一个数据模型，或许是来自数据库。
9. 动作会渲染一个视图，把数据模型提供给它。
10. 渲染结果返回给响应组件。
11. 响应组件发送渲染结果给用户浏览器。

#### 开始学习YII
##### 创建一个Controller
先创建一个人控制器，在controllers目录下面创建PersonController，
```php
namespace app\controllers;  命名空间
use yii\web\Controller;		引入类

class PersonController extends Controller{

}
```
###### 在PersonController里创建一个say方法
控制器中方法分为两种，一种是普通方法、一种是操作方法。
- 普通方法：命名随意，主要是定义通用的工具方法，供操作方法来使用。

- 操作方法：使用action前缀来命名，action后面为大写，action后面的名称被映射为操作的ID。操作 ID 总是被以小写处理，如果一个操作 ID 由多个单词组成， 单词之间将由连字符连接（如 create-comment）。 操作 ID 映射为方法名时移除了连字符，将每个单词首字母大写，并加上 action 前缀。 例子：操作 ID create-comment 相当于方法名 actionCreateComment。

```php
class PersonController extends Controller{
    public function actionSay($message='hello world'){
        return $this-> render(['say',['message'=>$message]);
    }
}
```
如上代码所示：后面return $this-render("say")。此方法用于渲染视图，视图名称为say。

##### 创建视图
由上面控制器限制，say 视图应该存为 views/person/say.php 文件。当一个操作中调用了 render() 方法时， 它将会按 views/控制器 ID/视图名.php 路径加载 PHP 文件。

在view下创建person文件夹，在person文件下面创建say.php
```php
<?php	 use yii\helpers\Html?>
<?=Html::encode($message)?>
```

##### 运行
>127.0.0.1:8080/index.php?r=person/say;

上面 URL 中的参数 r 需要解释。 它代表路由，是整个应用级的， 指向特定操作的独立 ID。路由格式是 控制器 ID/操作 ID。应用接受请求的时候会检查参数， 使用控制器 ID 去确定哪个控制器应该被用来处理请求。 然后相应控制器将使用操作 ID 去确定哪个操作方法将被用来做具体工作。 上述例子中，路由 person/say 将被解析至 PersonController 控制器和其中的 say 操作。 因此 PersonController::actionSay() 方法将被调用处理请求。

##### 使用表单
###### 创建模型
在models文件夹下创建EntryForm.php文件
```php
namespace app\models
use Yii;
use yii\base\Model
class EntryForm extends Model{		继承于Model类
    public $usename;
    public $email;

    public function rules(){
        return [
            [['username','email'],required],	表示username和email值是必须的
            ['email','email'],	          email必须满足email规则验证
        ]
    }
    //图书标签映射
    public function attributeLabels(){
        return [
            'usename' => '用户名',
            'email'=> '邮箱',
        ];
    }
}
```
上面表示是Entry model，模型中有两个数据，username和email。

model中的rules方法表示规则：[['username','email'],required]表示username和email是必填的，['email','email']表示邮箱必须满足邮箱的规则验证。

attributeLabels方法表示图书标签的映射关系。

###### 创建动作
在constructors文件夹下创建EntryController.php文件表示Entry的控制器
```php
<?php
namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\EntryForm;

class EntryController extends Controller
{
    public function actionEntry()
    {
        $model = new EntryForm;

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            // 验证 $model 收到的数据

            // 做些有意义的事 ...
            return $this->render('entry-confirm', ['model' => $model]);
        } else {
            // 无论是初始化显示还是数据验证错误
            return $this->render('entry', ['model' => $model]);
        }
    }
}
```
操作首先创建了一个 EntryForm 对象。然后尝试从 $_POST 搜集用户提交的数据， 由 Yii 的 yii\web\Request::post() 方法负责搜集。 如果模型被成功填充数据（也就是说用户已经提交了 HTML 表单）， 操作将调用 validate() 去确保用户提交的是有效数据。

###### 创建视图

最后创建两个视图文件 entry-confirm 和 entry。 他们会被刚才创建的 entry 操作渲染。entry-confirm 视图简单地显示提交的 name 和 email 数据。视图文件应该保存在 views/entry/entry-confirm.php。

```php
<?php
use yii\helpers\Html;
?>
<p>You have entered the following information:</p>

<ul>
    <li><label>Name</label>: <?= Html::encode($model->name) ?></li>
    <li><label>Email</label>: <?= Html::encode($model->email) ?></li>
</ul>
```
```php
<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'email') ?>

    <div class="form-group">
        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    </div>

<?php ActiveForm::end(); ?>
```

##### 数据库操作
###### 配置数据库连接
在config目录下的db.php文件下
```php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=localhost;dbname=bookadmin',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8',
];
```
###### 数据库操作
由于YII框架已经封装好了许多数据库操作，所以很方便我们去进行数据库操作。
- 通过参数和sql语句进行查找
```php
$model = Book::findBySql("select * from book where book_author like '%".$author."%'");  
```
- 通过where条件查询，find方法是查询所有
```php
$model = Book::find()->where(['book_name'=>$name,'book_author'=>$author]);
```
- 通过单个一条查询数据
```php
$model = Book::findOne($id);
```
- 最底层的方法，通过sql语句进行查询
```php
self::$users = Yii::$app->db->createCommand('SELECT * FROM user')
```

