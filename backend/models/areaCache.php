<?php
//区域缓存
namespace backend\models;
use Yii;
use yii\base\SmartException;
use yii\db\SmartActiveRecord;
//========================================
class areaCache extends SmartActiveRecord{
	static public function cacheArea($areaId){
		$uri=api::API_GET_AREA.$areaId;
		$data=api::get($uri);
		if(!isset($data['full_area_name'])) throw new SmartException("address miss full_area_name");
		$areaCache=self::addObj(array('areaId'=>$areaId,'areaData'=>json_encode($data)));
		return json_decode($areaCache->areaData,true);	
	}
	//========================================
	//获取地域
	static public function getArea($areaId){
		$areaCache=self::find()->where("`areaId`='{$areaId}'")->one();
		if($areaCache) return json_decode($areaCache->areaData,true);
		return self::cacheArea($areaId);
	}
}
?>