<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\datetime\DateTimePicker;
?>
<h2 style="text-align:center"><?=Html::encode($titleH)?></h2>
    <?php $form = ActiveForm::begin();?>
        <?=$form ->field($model,'book_isbn')->textInput(['options'=>['placeholder'=>'请输入书号']])?>
        <?=$form ->field($model,'book_name')->textInput()?>
        <?=$form ->field($model,'book_author')->textInput()?>
        <?=$form ->field($model,'book_press')->textInput()?>
        <?=$form ->field($model,'book_price')->textInput()?>
        <!-- 
            使用DateTimePicker结合ActiveForm生成时间表单控件
                安装控件
                   composer require kartik-v/yii2-widget-datetimepicker "*"
                引入 
                    use kartik\datetime\DateTimePicker;
                使用如下：
                    options 是控件基础的配置
                        placeholder 是显示的提示语
         -->
        <?= $form->field($model, 'book_time')->widget(DateTimePicker::classname(), [
            'options' => ['placeholder' => '请点击选择时间'],
            'pluginOptions' => [
                'autoclose' => true,
            ],
        ])?>
        <?=$form ->field($model,'book_image')->textInput()?>
        <?=$form ->field($model,'book_introduction')->textarea(['rows'=>4])?>
        <div class="form-group" style="text-align:center; margin-top:30px;">
            <?=Html::submitButton("提交",['class'=> 'btn btn-success'])?>
        </div>
    <?php ActiveForm::end();?>