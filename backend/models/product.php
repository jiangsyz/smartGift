<?php
//产品
namespace backend\models;
use Yii;
use yii\base\SmartException;
use yii\db\SmartActiveRecord;
//========================================
class product extends SmartActiveRecord{
	//创建兑换码
	public function createGift($count){
		for($i=1;$i<=$count;$i++) gift::addObj(array('productId'=>$this->id));
	}
	//========================================
	//获取申请方
	public function getAccepter(){return $this->hasOne(accepter::className(),array('id'=>'accepterId'));}
}
?>