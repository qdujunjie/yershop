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
class OrderController extends HomeController {

    /* 文档模型频道页 */
	public function detail(){
    $id= I('get.id');//获取id
	$typeCom=M("order")->where("orderid='$id'")->getField("tool"); 
	$typeNu=M("order")->where("orderid='$id'")->getField("toolid"); 
    if(isset($typeCom)&&$typeNu){ 
		$retData=$this->getkuaidi($typeCom,$typeNu );
	 }
	 else{$retData="";
	 }
	 $this->assign('kuaidata', $retData);
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
	 /* uid调用*/
     $Member=D("member");
	 $uid=$Member->uid();
      $order=D("order");
	  $detail=$order->where("orderid='$id'")->select(); 
	  $list=M("shoplist");
	foreach($detail as $n=> $val){
       $detail[$n]['id']=$list->where('orderid=\''.$val['id'].'\'')->select();
      
     }
 
	$addressid=$order->where("orderid='$id'")->getField("addressid"); 
	   $trans=M("transport")->where("id='$addressid'")->select();

    $this->assign('translist',$trans); 
	 $this->assign('detaillist',$detail); 
		$this->display();
	}
public function cancel(){
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
	 if(IS_POST){
	 $id= I('post.id');//获取orderid
     $order=M("order");
     $num=$order->where("orderid='$id'")->getField("status");
	 $shopid=$order->where("orderid='$id'")->getField("id");
    $data=$order->where("id='$shopid'")->select();
    foreach ($data as $k=>$val) {
    $goodid=$val['goodid'];
    $price=get_good_price($goodid);
			 /*取消的商品总额*/
            $cash+= $val['num'] * $price;
			/*退货中的商品件数*/
			$num+=$val['num'];
			 /*退货中的商品种类数*/
			$count+=1;
  
  }
	 //订单已提交或未支付直接取消
	 if($num=="1"){
		 //保存数据到取消表中后台调用
   $cancel=D("cancel");
   $cancel->create();
   $cancel->time=NOW_TIME;
    $cancel->status=3;
	$cancel->orderid=$id;
	$cancel->cash=$cash;//取消的金额
	$cancel->num=$num;//取消的数量
	$cancel->count=$count;//取消的种类
	$cancel->info="自助取消";
   $cancel ->add();
   //设置订单为订单已取消
$act="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/canceldetail/id/".$id."'>订单已取消</a>";

   $data = array('status'=>'6','backinfo'=>'订单已关闭','act_cancel'=>$act);
	  //更新订单列表订单状态为已取消，清空取消订单操作
	  if($order->where("orderid='$id'")->setField($data)) {
               $this->success('申请成功，订单已取消',U("center/allorder"));
            }
		else{
                $this->error('申请失败，请重试');
            }	
   }
//订单已发货，或已支付未发货,需申请，申请状态码4，拒绝5，同意6
  else{
	   $cancel=D("cancel");
   $cancel->create();
   $cancel->time=NOW_TIME;
   $cancel->status=1;
   $cancel->orderid=$id;
    $cancel->cash=$cash;//取消的金额
	$cancel->num=$num;//取消的数量
	$cancel->count=$count;//取消的种类
   $cancel ->add();$act="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/canceldetail/id/".$id."'>订单取消审核中</a>";
   $data = array('status'=>'4','act_cancel'=>$act);//设置订单状态为已提交，发货等状态不变
	  if($order->where("orderid='$id'")->setField($data)) {
               $this->success('申请成功，订单取消审核中',U("center/allorder"));
            }
		else{
                $this->error('申请失败，请重试');
            }	
   
   }
}
else{
  $id= I('get.id');//获取orderid
  $msg="申请取消订单:";

   $order=M("order");
$detail=$order->where("orderid='$id'")->select(); 
$num=$order->where("orderid='$id'")->getField("status");
if($num=="1"){ 
	$paynum=$order->where("orderid='$id'")->getField("ispay");
  if($paynum=="1"){
   $info="当前订单状态为未完成支付";
  
  }
  if(!$paynum){
   $info="当前订单已提交等待发货中";
  
  }
  }
if($num=="2"){
 $info="当前提交的订单已发货,需审核通过后取消";

}

	$list=M("shoplist");
	foreach($detail as $n=> $val){
       $detail[$n]['id']=$list->where('orderid=\''.$val['id'].'\'')->select();
      
     }
  $this->assign('info',$info); 
  $this->assign('detaillist',$detail); 
  $this->assign('id',$id); 
   $this->assign('msg',$msg); 
  $this->display('center/reason');

}

}
public function canceldetail(){
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
 $orderid= I('get.id');//获取orderid
  $cancel=M("cancel");
$list= $cancel->where("orderid='$orderid'")->select();
$info= M("order")->where("orderid='$orderid'")->getField("backinfo");
  $this->assign('list',$list); 
  $this->assign('backinfo',$info); 
$this->assign('id',$orderid); 
$msg="申请取消订单:"; 
$this->assign('msg',$msg); 
$this->display(); 

}
public function backdetail(){
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
 $id= I('get.id');//获取orderid
  $back=M("backlist");
$list= $back->where("shopid='$id'")->select();
$info= M("backlist")->where("shopid='$id'")->getField("backinfo");
  $this->assign('list',$list); 
  $this->assign('backinfo',$info); 
$this->assign('id',$id); 
$msg="退货:"; 
$this->assign('msg',$msg); 
$this->display('canceldetail'); 

}

public function changedetail(){ 
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
 $id= I('get.id');//获取orderid
  $change=M("change");
$list= $change->where("shopid='$id'")->select();
$info= M("change")->where("shopid='$id'")->getField("backinfo");
  $this->assign('list',$list); 
  $this->assign('backinfo',$info); 
$this->assign('id',$id); 
$msg="退货:"; 
$this->assign('msg',$msg); 
$this->display('canceldetail'); 

}
public function wuliu(){
 $id= I('get.orderid');//获取id
	$typeCom=M("order")->where("orderid='$id'")->getField("tool"); 
	$typeNu=M("order")->where("orderid='$id'")->getField("toolid"); 
    if(isset($typeCom)&&$typeNu){ 
		$retData=$this->getkuaidi($typeCom,$typeNu );
	 }
	 else{$retData="";
	 }
	 $this->assign('kuaidata', $retData);
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

public function back(){
	 if(IS_POST){
	 $id= I('post.id');//获取id
	 //保存信息到退货表
     $back=D("backlist");
	 $back->create();
     $back->goodid=get_shop_goodid($id);
	 $back->time=NOW_TIME;
     $back->status=1;
	 $back->backinfo="申请退货中";
	 $result=$back->add();
	 //更改商品的售后信息
$shopback="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/backdetail/id/".$id."'>退货中</a>";
           // $change="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/change/id/".$byid."'>换货</a>";
		   // $backmoney="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/backmoney/id/".$byid."'>退款</a>";
$data['back']=$shopback;
$data['change']='';
$data['backmoney']='';
$shop=M("shoplist");
 $shop->where("id='$id'")->save($data);
	  if($result)
		  {
                $this->success('申请成功');
            }
			else{
                $this->error('申请失败，或重复操作');
            }
}
else{
  $id= I('get.id');//获取id
  $msg="申请退货:";
  $detail=M("shoplist")->where("id='$id'")->select();
  //获取购物清单
  $this->assign('detaillist',$detail); 
//获取物品id
  $this->assign('id',$id); 
  $this->assign('msg',$msg); 
  $this->display();

}

}
public function change(){
    
	 if(IS_POST){
	 $id= I('post.id');//获取id
     $change=D("change");
	  $change->create();
	  $change->goodid=get_shop_goodid($id);
	 $change->time=NOW_TIME;
     $change->status=1;
	 $change->add();
//更改商品的售后信息
  $shopchange="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/changedetail/id/".$id."'>换货中</a>";
$data['back']='';
$data['change']=$shopchange;
$data['backmoney']='';
$shop=M("shoplist");

	  if($shop->where("id='$id'")->save($data)) {
                $this->success('申请成功');
            }
			else{
                $this->error('申请失败，或重复操作');
            }
}
else{
  $id= I('get.id');//获取id
  $msg="申请换货:";
  $detail=M("shoplist")->where("id='$id'")->select();
  //获取购物清单
  $this->assign('detaillist',$detail); 
//获取物品id
  $this->assign('id',$id); 
  $this->assign('msg',$msg); 
  $this->display(); 
  $this->display();

}

}
public function getkuaidi($typeCom,$typeNu ){
 
//$typeCom = $_GET["com"];//快递公司
 //$typeNu = $_GET["nu"];  //快递单号

//echo $typeCom.'<br/>' ;
//echo $typeNu ;

$AppKey=C('100KEY');//请将XXXXXX替换成您在http://kuaidi100.com/app/reg.html申请到的KEY
$url ='http://api.kuaidi100.com/api?id='.$AppKey.'&com='.$typeCom.'&nu='.$typeNu.'&show=2&muti=1&order=asc';

//请勿删除变量$powered 的信息，否者本站将不再为你提供快递接口服务。
$powered = '查询数据由：<a href="http://kuaidi100.com" target="_blank">KuaiDi100.Com （快递100）</a> 网站提供 ';


//优先使用curl模式发送数据
if (function_exists('curl_init') == 1){
  $curl = curl_init();
  curl_setopt ($curl, CURLOPT_URL, $url);
  curl_setopt ($curl, CURLOPT_HEADER,0);
  curl_setopt ($curl, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt ($curl, CURLOPT_USERAGENT,$_SERVER['HTTP_USER_AGENT']);
  curl_setopt ($curl, CURLOPT_TIMEOUT,5);
  $get_content = curl_exec($curl);
  curl_close ($curl);
}else{
   Vendor("Snoopy.Snoopy");
  $snoopy=new \Vendor\Snoopy\Snoopy();
  $snoopy->referer = 'http://www.google.com/';//伪装来源
  $snoopy->fetch($url);
  $get_content = $snoopy->results;
}
return $get_content;
//print_r($get_content . '<br/>' . $powered);

 
 }
}
