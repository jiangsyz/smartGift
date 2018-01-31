<?php
//订单
namespace backend\models;
use Yii;
use yii\base\SmartException;
use yii\db\SmartActiveRecord;
//========================================
class order extends SmartActiveRecord{
	public function rules(){
	    return array(
	        //去空格
	        array(array('name','phone','uniqueId','address','memo'),'trim'),
	        //必填
	        array(array('name','phone','uniqueId','areaId','address','dateFlag'),'required'),
	        //唯一
	        array(array('uniqueId'),'unique'),
	    );
	}
	//========================================
	public function init(){
		parent::init();
		$this->on(self::EVENT_BEFORE_INSERT,array($this,"checkGift"));
		$this->on(self::EVENT_BEFORE_INSERT,array($this,"checkPhone"));
		$this->on(self::EVENT_BEFORE_INSERT,array($this,"checkDateFlag"));
		$this->on(self::EVENT_BEFORE_INSERT,array($this,"initCreateTime"));
	}
	//========================================
	public function initCreateTime(){$this->createTime=time();}
	//========================================
	public function getGift(){return $this->hasOne(gift::className(),array('uniqueId'=>'uniqueId'));}
	//========================================
	public function checkGift(){if(!$this->gift) throw new SmartException("miss gift");}
	//========================================
	public function checkDateFlag(){
		if(!in_array($this->dateFlag,array(1,2,3))) throw new SmartException("error dateFlag");
	}
	//========================================
	public function checkPhone(){}
	//========================================
	public function getDataMemo(){
		if($this->dateFlag==1) return "工作日";
		if($this->dateFlag==2) return "休息日";
		if($this->dateFlag==3) return "不限";
		throw new SmartException("error dataFalg");
		
	}
	//========================================
	public function getMemo(){
		if($this->memo) return $this->memo;
		return "无备注";
	}
}
?>