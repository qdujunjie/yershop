<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;
/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ServiceController extends HomeController {
    /* 频道封面页 */
	public function index(){
   
	/* 左侧菜单 */
	 $menu=R('index/menulist');
	 $this->assign('categoryq', $menu);
	   	    /**
 * 购物车调用
 */
   $cart=R("shopcart/usercart");
   $this->assign('usercart',$cart);
   if(!session('user_auth')){$usercart=$_SESSION['cart'];
        $this->assign('usercart',$usercart);
   
   }
    /*栏目页统计代码实现，tag=2*/
     if(1==C('IP_TONGJI')){
	   $record=IpLookup("",4,$name); 
	 }
	  /* 热词调用*/
    $hotsearch=R("Index/getHotsearch");
    $this->assign('hotsearch',$hotsearch);  
		/* 分类信息 */
	$id= I('get.id');//获取id
	 $this->assign('id',$id);
		$this->display();
	}


}
