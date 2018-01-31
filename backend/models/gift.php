<?php
//兑换码
namespace backend\models;
use Yii;
use yii\base\SmartException;
use yii\db\SmartActiveRecord;
//========================================
class gift extends SmartActiveRecord{
	public function rules(){
	    return array(
	        //去空格
	        array(array(),'trim'),
	        //必填
	        array(array('productId'),'required'),
	        //唯一
	        array(array(),'unique'),
	    );
	}
	//========================================
	public function init(){
		parent::init();
		$this->on(self::EVENT_BEFORE_INSERT,array($this,"initData"));
	}
	//========================================
	public function initData(){
		$str="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		$this->uniqueId=substr(str_shuffle($str),0,8);
		$this->locked=0;
	}
	//========================================
	public function createOrder($name,$phone,$areaId,$address,$dateFlag,$memo){
		if($this->locked) throw new SmartException("gift is locked");
		$order=array();
		$order['uniqueId']=$this->uniqueId;
		$order['name']=$name;
		$order['phone']=$phone;
		$order['areaId']=$areaId;
		$order['address']=$address;
		$order['dateFlag']=$dateFlag;
		$order['memo']=$memo;
		order::addObj($order);
		$this->updateObj(array('locked'=>1));
	}
	//========================================
	public function getProduct(){return $this->hasOne(product::className(),array('id'=>'productId'));}
	//========================================
	public function getTitle(){return $this->product->accepter->name.':'.$this->product->name;}
}
?>