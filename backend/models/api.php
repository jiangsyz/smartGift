<?php
//api
namespace backend\models;
use Yii;
use yii\base\SmartException;
//========================================
class api{
	//获取地域信息api
	const API_GET_AREA="http://app1.zhengshan.store/smartArea/backend/web/index.php?r=area/api-get-area&areaId=";
	//========================================
	static public function get($uri,$curlConf=array()){
		$reponse=Yii::$app->smartApi->get($uri,$curlConf);
		//返回值正确,获取业务数据
		if(isset($reponse['reponse'])){
			$data=json_decode($reponse['reponse'],true);
			if(isset($data['error']) && $data['error']==0 && isset($data['data'])) return $data['data'];
		}
		throw new SmartException("call api error");
	}
}
?>