<?php
namespace backend\controllers;
use Yii;
use yii\web\SmartWebController;
use yii\base\Exception;
use yii\base\SmartException;
use backend\models\product;
use backend\models\gift;
use backend\models\areaCache;
use backend\models\order;
class SiteController extends SmartWebController{
	public $enableCsrfValidation=false;
	//========================================
	//创建验证码
	public function actionCreateGift(){
		try{
			//开启事务
			$trascation=Yii::$app->db->beginTransaction();
			//获取产品
			$productId=Yii::$app->request->get('productId',false);
			if(!$productId) throw new SmartException("miss productId");
			//获取数量
			$count=Yii::$app->request->get('count',false);
			if(!$count) throw new SmartException("miss count");
			//获取产品
			$product=product::find()->where("`id`='{$productId}'")->one();
			if(!$product) throw new SmartException("miss product");
			//创建兑换码
			$product->createGift($count);
			//提交
			$trascation->commit();
			$this->response(1,array('error'=>0));
		}
		catch(Exception $e){
			//回滚
			$trascation->rollback();
			$this->response(1,array('error'=>-1,'msg'=>$e->getMessage()));
    	}
	}
	//========================================
	//兑换验证码
	public function actionApiGetGift(){
		try{
			//允许跨域
			header("Access-Control-Allow-Origin: *");
			//开启事务
			$trascation=Yii::$app->db->beginTransaction();
			//获取产品
			$productId=Yii::$app->request->post('productId',false);
			if(!$productId) throw new SmartException("miss productId");
			//获取兑换码
			$uniqueId=Yii::$app->request->post('uniqueId',false);
			if(!$uniqueId) throw new SmartException("miss uniqueId");
			//获取姓名
			$name=Yii::$app->request->post('name',false);
			if(!$name) throw new SmartException("miss name");
			//获取手机
			$phone=Yii::$app->request->post('phone',false);
			if(!$phone) throw new SmartException("miss phone");
			//获取区号
			$areaId=Yii::$app->request->post('areaId',false);
			if(!$areaId) throw new SmartException("miss areaId");
			//获取地址
			$address=Yii::$app->request->post('address',false);
			if(!$address) throw new SmartException("miss address");
			//获取收货日备注
			$dateFlag=Yii::$app->request->post('dateFlag',false);
			if(!$dateFlag) throw new SmartException("miss dateFlag");
			//获取备注
			$memo=Yii::$app->request->post('memo',NULL);
			//获取礼品
			$sql="SELECT * FROM ".gift::tableName()." WHERE `uniqueId`='{$uniqueId}' AND `productId`='{$productId}' FOR UPDATE";
			$gift=gift::findBySql($sql)->one();
			if(!$gift) throw new SmartException("miss gift");
			//创建订单
			$gift->createOrder($name,$phone,$areaId,$address,$dateFlag,$memo);
			//提交
			$trascation->commit();
			$this->response(1,array('error'=>0));
		}
		catch(Exception $e){
			//回滚
			$trascation->rollback();
			$this->response(1,array('error'=>-1,'msg'=>$e->getMessage()));
    	}
	}
	//========================================
	//验证兑换码
	public function actionApiCheckGift(){
		try{
			//开启事务
			$trascation=Yii::$app->db->beginTransaction();
			//获取产品
			$productId=Yii::$app->request->get('productId',false);
			if(!$productId) throw new SmartException("miss productId");
			//获取兑换码
			$uniqueId=Yii::$app->request->get('uniqueId',false);
			if(!$uniqueId) throw new SmartException("miss uniqueId");
			//获取礼品
			$sql="SELECT * FROM ".gift::tableName()." WHERE `uniqueId`='{$uniqueId}' AND `productId`='{$productId}' AND `locked`='0' FOR UPDATE";
			$gift=gift::findBySql($sql)->one();
			if(!$gift) throw new SmartException("miss gift");
			//提交
			$trascation->commit();
			$this->response(1,array('error'=>0));
		}
		catch(Exception $e){
			//回滚
			$trascation->rollback();
			$this->response(1,array('error'=>-1,'msg'=>$e->getMessage()));
    	}
	}
	//========================================
	//订单列表
	public function actionOrderList(){
		$data=array();
		$orders=order::find()->all();
		foreach($orders as $order){
			$orderData=$order->getData();
			$orderData['memo']=$order->getMemo();
			$orderData['title']=$order->gift->getTitle();
			$areaInfo=areaCache::getArea($order->areaId);
			$orderData['areaName']=$areaInfo['full_area_name'];
			$orderData['dateMemo']=$order->getDataMemo();
			$data[]=$orderData;
		}
		//var_dump($data);exit;
		$this->renderPartial('orderList',array('data'=>$data));
	}
}