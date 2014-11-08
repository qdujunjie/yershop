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
class SearchController extends HomeController {

    /* 文档模型频道页 */
	public function index(){
    $keyword= I('get.words');//获取分类的英文名称
	if(!$keyword){
		$keyword=$_POST["words"];
		}
 
	$map['title|name|description']  = array('like','%'.$keyword.'%');
    $list=M('Document')->where($map)->select();
     $this->assign('searchlist', $list);
	  $this->assign('keyword', $keyword);
	 /* 左侧菜单 */
	 $menu=R('index/menulist');
	 $this->assign('categoryq', $menu);
    /* 购物车调用*/
     $cart=R("shopcart/usercart");
    $this->assign('usercart',$cart);
      if(!session('user_auth'))
		{ 
		 $usercart=$_SESSION['cart'];
       $this->assign('usercart',$usercart); 
	    }
  /* 热词调用*/
    $hotsearch=R("Index/getHotsearch");
    $this->assign('hotsearch',$hotsearch);
	
		$this->display();
	}

}
