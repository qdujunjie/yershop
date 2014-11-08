<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com  All rights reserved.
// +----------------------------------------------------------------------
// | Author: 烟消云散 <1010422715@qq.com> 
// +----------------------------------------------------------------------
namespace Home\Controller;
/*****购物车的类
 功能：添加商品、添加/删除/查看某一个商品的数量、查看商品的总类/总数量、清空购物车、计算购物车总价格、返回购物车商品列表
***************/
class ShopcartController extends HomeController {

    /*
    添加商品
    param int $id 商品主键
          string $name 商品名称
          float $price 商品价格
          int $num 购物数量
    */
    public  function addItem($id) {
            $num=$_POST['num'];
            $id=$_POST['id'];
            $price=$_POST['price']; 
	  
	   if(!isset($_SESSION['cart'])){
            $_SESSION['cart'] = array();
        }
	    $item = array();
	    //如果该商品已存在则直接加其数量
        if (isset($_SESSION['cart'][$id])) {
             $_SESSION['cart'][$id]['num'] += $num;
         
         $item['id'] = $id;
        $item['price'] = $price;
        $item['num'] = $_SESSION['cart'][$id]['num'];
        $_SESSION['cart'][$id] = $item;
		$exsit="1";
		
		}
		else{
			 $item['id'] = $id;
        $item['price'] = $price;
        $item['num'] = $num;
        $_SESSION['cart'][$id] = $item;$exsit="0";
			
			}
//登录用户，处理详情页ajaxt提交的数据保存到数据库
      if(session('user_auth')){ 
 $table=D("shopcart");
 $data['goodid']=$id;
 $data['num']=$num;
$member=D("member");
$uid=$member->uid();
 $data['uid']=$uid;
$pnum=M("shopcart")->where("goodid='$id'and uid='$uid'")->getField("num");
if($pnum)
	 {$exsit="1";
	$data['num']=$pnum+$num;
$table->where("goodid='$id'and uid='$uid'")->save($data);
}
else{
$data['num']=$num;
$table->add($data);$exsit="0";
}
$data['sql'] ='sql';
	 $data['status'] =1;
	$data['num'] = M("shopcart")->where("goodid='$id'and uid='$uid'")->getField("num");
       $data['msg'] = '已添加到购物车';
	     $data['exsit'] = $exsit;
      $this->ajaxReturn($data);
  }
else{	 $data['exsit'] = $exsit;
		 $data['status'] = 1;
		 $data['num'] = $item['num'];
       $data['msg'] = '已添加到购物车';
      $this->ajaxReturn($data);}
		  
			
    }
     /*
    添加商品  添加商品
    param int $id 商品主键
       
          int $num 购物数量
    */
    public  function addgood($id) {
            $tag=$_POST['tag'];
			$num=1;
            $id=$_POST['id'];
            $price=get_good_price($id); 
	  
	   if(!isset($_SESSION['cart'])){
            $_SESSION['cart'] = array();
        }
	    $item = array();
	    //如果该商品已存在则直接加其数量
        if (isset($_SESSION['cart'][$id])) {
             $_SESSION['cart'][$id]['num'] += $num;
         
         $item['id'] = $id;
        $item['price'] = $price;
        $item['num'] = $_SESSION['cart'][$id]['num'];
        $_SESSION['cart'][$id] = $item;
		$exsit="1";
		
		}
		else{
			 $item['id'] = $id;
        $item['price'] = $price;
        $item['num'] = $num;
        $_SESSION['cart'][$id] = $item;
		$exsit="0";
			
			}
 $data['status'] = 1;
$data['price']=get_good_price($id);
$coverid=get_cover_id($id);
$data['src']=get_good_img($coverid);
$data['title']=get_good_name($id);

//登录用户，处理详情页ajaxt提交的数据保存到数据库
if(session('user_auth')){ 
 $table=D("shopcart");
 $data['goodid']=$id;
 $data['num']=$num;
$member=D("member");
$uid=$member->uid();
 $data['uid']=$uid;
$pnum=M("shopcart")->where("goodid='$id'and uid='$uid'")->getField("num");
if($pnum)
	 {$exsit="1";
	$data['num']=$pnum+$num;
$table->where("goodid='$id'and uid='$uid'")->save($data);
}
else{
$data['num']=$num;
$table->add($data);
$exsit="0";
}
$data['sql'] ='sql';
	
	$data['num'] = M("shopcart")->where("goodid='$id'and uid='$uid'")->getField("num");
       $data['msg'] = '添加成功';
	     $data['exsit'] = $exsit;
      $this->ajaxReturn($data);
  }
 //非登陆用户
else{	 $data['exsit'] = $exsit;
		
		 $data['num'] = $item['num'];
       $data['msg'] = '添加成功';
      $this->ajaxReturn($data);
	  }
		  
			
    }
    /*
    修改购物车中的商品数量
    int $id 商品主键
    int $num 某商品修改后的数量，即直接把某商品
    的数量改为$num
    */
    public function modNum($id,$num=1) {
        if (!isset($_SESSION['cart'][$id])) {
            return false;
        }
	    $_SESSION['cart'][$id]['num'] = $num;
    }
 
    /*
    商品数量+1
    */
    public function incNum($id,$num=1) {
		 $id=$_POST['id'];
        if (isset($_SESSION['cart'][$id])) {
            $_SESSION['cart'][$id]['num'] += $num;
			   
        }
		 $count=$this->getCnt(); /*查询购物车中商品的种类 */
     $sum= $this->getNum();/* 查询购物车中商品的个数*/
     $price=$this->getPrice(); /* 购物车中商品的总金额*/
	  $data['count'] =$count;
	 	 $data['price'] =$price;
		 $data['sum'] =  $sum;
       $data['status'] = 1;
       $this->ajaxReturn($data);
		
		
    }
 
    /*
    商品数量-1
    */
    public function decNum($id,$num=1) { 
		$id=$_POST['id'];
        if (isset($_SESSION['cart'][$id])) {
            $_SESSION['cart'][$id]['num'] -= $num;
        }
 
        //如果减少后，数量为0，则把这个商品删掉
        if ($_SESSION['cart'][$id]['num'] <1) {
            unset($_SESSION['cart'][$id]);
        }
		 $count=$this->getCnt(); /*查询购物车中商品的种类 */
     $sum= $this->getNum();/* 查询购物车中商品的个数*/
     $price=$this->getPrice(); /* 购物车中商品的总金额*/
	  $data['count'] =$count;
	 	 $data['price'] =$price;
		 $data['sum'] =  $sum;
       $data['status'] = 1;
       $this->ajaxReturn($data);
   
   
    }
 
    /*
    订单明细
    */
    public function detail() {
        $count=$this->getCnt(); /*查询购物车中商品的种类 */
        $sum= $this->getNum();/* 查询购物车中商品的个数*/
        $money=$this->getPrice(); /* 购物车中商品的总金额*/
	 
        $this->assign('sum', $sum);
		$this->assign('money',  $money);
        $this->assign('list',$_SESSION['cart']); 
		
		$this->display();
    }
 public function index() {
	  /*查询购物车*/
    $menu=R('index/menulist');
	$this->assign('categoryq', $menu);//无限分类遍历
	 /* 热词调用*/
    $hotsearch=R("Index/getHotsearch");
    $this->assign('hotsearch',$hotsearch);
      $count=count($_SESSION['cart']); /*查询购物车中商品的种类 */
	 if(session('user_auth'))
		 { 
		 $cartter=$this->usercart();
    $this->assign('usercart',$cartter);
	  $cart=D("shopcart");
     $result= $cart->getcart();
     $this->assign('sqlcart',$result); 
	   $count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
        $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
        $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
	  $member=D("member");
     $uid=$member->uid();
	  }
	  else{
		  $uid="";
		$count=$this->getCnt(); /*查询购物车中商品的种类 */
        $sum= $this->getNum();/* 查询购物车中商品的个数*/
        $price=$this->getPrice(); /* 购物车中商品的总金额*/
	    $usercart=$_SESSION['cart'];
        $this->assign('usercart',$usercart);
		
		}
		$this->assign('uid',$uid);
		$this->assign('count',$count);
        $this->assign('sum', $sum);
	    $this->assign('price',$price);
		$this->display();
    }

   public function delItem($id) { 
       $id=$_POST['id'];
       unset($_SESSION['cart'][$id]);
       $count=$this->getCnt(); /*查询购物车中商品的种类 */
      $sum= $this->getNum();/* 查询购物车中商品的个数*/
       $price=$this->getPrice(); /* 购物车中商品的总金额*/
	   $data['count'] =$count;
	 	 $data['price'] =$price;
		 $data['num'] =  $sum;
       $data['status'] = 1;
       $this->ajaxReturn($data);
	   }
    /*
    获取单个商品
    */
    public function getItem($id) {
        return $_SESSION['cart'][$id];
    }
 
    /*
    查询购物车中商品的种类
    */
    public function getCnt() {
        return count($_SESSION['cart']);
    }
     
    /*
    查询购物车中商品的个数
    */
    public function getNum(){
        if ($this->getCnt() == 0) {
            //种数为0，个数也为0
            return 0;
        }
 
        $sum = 0;
        $data = $_SESSION['cart'];
        foreach ($data as $item) {
            $sum += $item['num'];
        }
        return $sum;
    }
 
    /*
    购物车中商品的总金额
    */
    public function getPrice() {
        //数量为0，价钱为0
        if ($this->getCnt() == 0) {
            return 0;
        }
        $price = 0.00;
        $data = $_SESSION['cart'];
        foreach ($data as $item) {
            $price += $item['num'] * $item['price'];
        }
        return sprintf("%01.2f", $price);
    }
 
    /*
    清空购物车
    */
    public function clear() {
        $_SESSION['cart'] = array();
    }


  public function order() {
	   /* 菜单调用*/
	$menu=R('index/menulist');
	$this->assign('categoryq', $menu);
	 /* 热词调用*/
    $hotsearch=R("Index/getHotsearch");
    $this->assign('hotsearch',$hotsearch);
		/* uid调用*/
	$user=session('user_auth');
    $uid=$user['uid'];
	$score=get_score($uid);
	/* 积分兑换*/
	$ratio= $score/C('RATIO');
    $this->assign('ratio', $ratio);
	$this->assign('uid', $uid);

	/* 创建订单*/
	if(IS_POST){
	$order=D("order");
	$goodlist =M("shoplist"); 
    $makeid=$this->ordersn();
    $order->orderid=$makeid;
     $order->uid=$uid;
	
    $order->add();
    $orderid=$order->where("orderid='$makeid'")->getField('id');
	 for($i=0;$i<count($_POST["id"]);$i++)
	{
            $id = $_POST ["id"] [$i];
            $num = $_POST ["num"] [$i];
            $goodlist->goodid = $id;
			$goodlist->status = 1;
			$goodlist->orderid = $orderid;
            $goodlist->num = $num;
			$goodlist->time= NOW_TIME;
			$goodprice=get_good_price($id);
             $goodtotal=$num*$goodprice;
              $goodlist->total =$goodtotal;
            $result = $goodlist->add();
        } 

$shoplist=$goodlist->where("orderid='$orderid'")->select();
      $this->assign('shoplist',$shoplist);
	  $this->assign('uid',$uid);
      $this->assign('orderid', $orderid);
	  $msg=get_address($uid);
	 $total=$this->getPricetotal($orderid);
	 if($total<C('LOWWEST')){
		 $trans=C('SHIPPRICE');
	 
	 }
	 else{$trans=0;
	 }
    $all=$total+$trans;
    $allnum=$this->getpriceNum($orderid);
    $this->assign('all', $all);
    $this->assign('allnum', $allnum);
    $this->assign('trans', $trans);
	 $this->assign('total', $total);
	$this->assign('address',$msg);
	}
		$this->display();

    }
	
public function makeorder() { 
	  /* 菜单调用*/
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
$id = $_POST["orderid"];
  $del= M("order")->where("total=''")->delete();

$order=D("order");
//计算提交的订单的商品总额
$total=$this->getPricetotal($id);


//计算提交的订单的商品运费
if($total<C('LOWWEST')){$trans=C('SHIPPRICE');
	 
	 }
 else{$trans=0;
	 }
//计算提交的积分兑换
if($_POST["score"]){
$score=$_POST["score"];
//读取配置，1000积分兑换1元
$ratio= $score/C('RATIO');
$data['score']=$score;
}
else{
	$ratio=0;

}
//计算提交的优惠券
if($_POST["couponcode"])
	{
$code=$_POST["couponcode"];
$codeid=M("fcoupon")->where("code='$code'")->getfield('id');
$deccode=get_coupon_price($codeid);
$data['codeid']=$codeid;
}
else{
$deccode=0;
}
  $senderid=$_POST ["sender"];
$data['addressid']=$senderid;
$data['total']=$total;
$data['ptime']=NOW_TIME;
$data['shipprice']=$trans;
//计算提交的订单的总费用
$all=$total+$trans-$ratio-$deccode;
$data['pricetotal']=$all;

//修改订单状态为用户已提交
if($_POST["PayType"]=="1"){

  $data['status']="1";

$data['backinfo']="已提交等待发货";
//增加取消订单
$cid=$order->where("id='$id'")->getField('orderid');
 $cancle="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/cancel/id/".$cid."'>取消订单</a>";
$data['act_cancel']=$cancle;

//根据订单id保存对应的费用数据
$order->where("id='$id'")->save($data);
//根据订单id获取购物清单
$del=M("shoplist")->where("orderid='$id'")->select();
	//获取会员uid
$member=D("member");
$uid=$member->uid();
//遍历购物清单，删除登录用户购物车中的货物id
foreach($del as $k=>$val)
	{
//获取购物清单数据表产品id，字段goodid
$delbyid=$val["goodid"];
//删除购物车中用户的产品id
M("shopcart")->where("goodid='$delbyid'and uid='$uid'")->delete();
 }
$ordercode=$order->where("id='$id'")->getField('orderid');
    $this->assign('codeid',$ordercode);
$this->display('success');

}
else{ 
	//设置订单状态为用户为未能完成，不删除数据
$data['backinfo']="等待支付";
	$data['ispay']="1";
	//根据订单id保存对应的费用数据
     $order->where("id='$id'")->save($data);

  $ordercode=$order->where("id='$id'")->getField('orderid');
    $this->assign('codeid',$ordercode);
	 $this->assign('goodprice',$all);
	 //支付页
     $this->display('Pay/index');

}


}


public function buynow() {
	$user=session('user_auth');
$uid=$user["uid"];

$buy=D("order");
$buy->create();
$buy->uid=$uid;
$buy->goodclass='1';
$buy->add();
$this->display('success');
}
function ordersn(){
    $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
    $orderSn = $yCode[intval(date('Y')) - 2011] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%04d%02d', rand(1000, 9999),rand(0,99));
    return $orderSn;
}
 public function savemsg() {
           $User = M("member"); // 实例化User对象
          $Transport = M("transport"); // 实例化transport对象
    // 要修改的数据对象属性赋值
	$user=session('user_auth');
//方式一：只能输出值value不能输出key
	$id=$_POST["id"];
	$uid=$user["uid"];
	$data['address'] = $_POST["posi"];
    $data['cellphone'] = $_POST["pho"];
	$data['realname'] = $_POST["rel"];
	if($_POST["msg"]=="yes"){
            //默认地址更新会员
       $result=$User->where("uid='$uid'")->save($data); // 根据条件保存修改的数据
	//地址库有默认地址，有则保存
	   $data['status'] = 1;
       $data['time']=NOW_TIME;
	   $data['orderid'] = $id;
       $Transport->add($data); 
	   $data['value'] = "default";
       
	   $data['addressid']=$Transport->where("uid='$uid' and status='1'")->getField("id");
	  $data['msg'] = 'yes'; }
	else{
		$data['time']=NOW_TIME;
	    $data['orderid'] = $id;
        $result=$Transport->add($data); // 根据条件保存修改的数据
	   $data['addressid'] = M("transport")->where("orderid='$id'")->getField("id");
	// 返回新增标识
	 $data['msg'] = 'no';}
   
    $this->ajaxReturn($data);
	}

public function delorder() { 

for($i=0;$i<count($_POST["id"]);$i++)
	{ $id = $_POST ["id"] [$i];
        M("order")->where("orderid='$id'")->delete();
		$delid= M("order")->where("orderid='$id'")->getField("id");
        $result= M("shoplist")->where("id='$delid'")->delete();  
        $did+=$id ; 
        } 
 if(isset($did)) { $this->success('删除成功！');
            }
			else{
                $this->error('删除成功！');
            }

}
public function usercart(){
		$cart=D("shopcart");
		$result= $cart->getcart();
 return $result;
}
public function incNumByuid(){
		$id=$_POST['id'];
		$cart=D("shopcart");
		$result= $cart->inc($id);
		$count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
        $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
        $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
    
		if($result){$data['new'] ='新个数'.$result;
			$data['count'] = $count;
			$data['status'] = 1;
			$data['price'] =$price;
		 $data['sum'] = $sum;
        $data['msg'] = '处理成功';
		 $this->ajaxReturn($data);
		}
 
}
public function decNumByuid(){
		$cart=D("shopcart");$id=$_POST['id'];
		$result= $cart->dec($id);
		$count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
        $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
        $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
    
		if($result){$data['new'] ='新个数'.$result;
			$data['count'] = $count;
			$data['status'] = 1;
			$data['price'] =$price;
		 $data['sum'] = $sum;
       $data['msg'] = '处理成功';
		 $this->ajaxReturn($data);
		}

}
public function delItemByuid(){
		$cart=D("shopcart");
		$id=$_POST['id'];
		 $user=D("member");
	    $uid=$user->uid();
	     if($result= $cart->where("goodid='$id'and uid='$uid'")->delete()){
		$count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
        $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
        $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
		 $data['status'] = 1;
		 $data['goodid'] =$id;
		  $data['num'] =  $sum;
         $data['msg'] = '处理成功';
		 $this->ajaxReturn($data);}
		

}
 public function getPricetotal($id) { 

        $data = M("shoplist")->where("orderid='$id'")->select();
        foreach ($data as $k=>$val) {
			$goodid=$val['goodid'];
			$price=get_good_price($goodid);
            $total += $val['num'] * $price;
        }
        return sprintf("%01.2f", $total);
    }
 
public function getpriceNum($id) { 
	 
        $price = 0.00;
        $data = M("shoplist")->where("orderid='$id'")->select();
         foreach ($data as $k=>$item) {
            $sum += $item['num'];
        }
        return  $sum;
    }

}
