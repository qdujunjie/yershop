<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com  All rights reserved.
// +----------------------------------------------------------------------
// |  Author: 烟消云散 <1010422715@qq.com> 
// +----------------------------------------------------------------------
namespace Home\Controller;
/*****个人中心
***************/
class CenterController extends HomeController {
 /*****获取用户uid,调用菜单并显示
***************/
  
    public  function index() {  if(is_login()){
			
		
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
	   $uid=$this->uid(); 
	   $this->assign('uid', $uid);
	  $menu=R('index/menulist');
	   $this->assign('categoryq', $menu);
	    /*****最近订单
***************/
       $order=D("order");
       $lateorder=$order->latestOrder();
       $this->assign('lateorder', $lateorder);
	   /*****购物车
***************/
	  $shopcart=$this->shopcart(); 
	  $this->assign('cartlist', $shopcart);
	   /*****收藏夹
***************/
      $fav=D("favortable");
	  $favor=$fav->getfavor(); 
	  $this->assign('favorlist', $favor);
    /*优惠券*/
        $member=D("member");
		$uid=$member->uid();
	  $coupon=M("usercoupon")->where("uid='$uid'")->select();
	  $num=count($coupon);
	  $this->assign('num', $num);
	  $this->display();
	  }
	  
	  else {
			$this->redirect('User/login');
		}
		 
}
 public  function reason() {
 $this->display();
 
 }

/*****用户签到
***************/
 public  function enter() {
	 

       $user=session('user_auth');
	   $uid=$user["uid"]; 
	   $iswork=D("iswork");
	   $qtime=NOW_TIME;$d=date('H:i:s',$qtime);
	   $time=$iswork->where("uid='$uid'")->order("id desc")->limit(1)->getfield('time');
	    $member=D("member"); // 实例化对象
	   if($time){/*签过到*/
	   $a=date('Ymd',$qtime);/*格式时间戳为 20141024*/
	   $b=date('Ymd',$time);
	   $c=date('H:i:s',$time);
		   if($a!==$b){/*比较*/
		   /*新增签到*/
		    $data['uid'] = $uid;
             $data['status'] = "1";
		     $data['time']=NOW_TIME;
            if($iswork->add($data))
				{
               $member->where("uid='$uid'")->setInc('score',10); // 用户的积分加10
               $data['score']=$member->where("uid='$uid'")->getfield('score');
		      $c=date('y-m-d:h:i:s',$time);
			  $data['msg'] = "已签到，积分+10";
			  $data['status'] = "1";
	          $this->ajaxreturn($data); 
		     }
         
			}
			 else{/*签过到*/
              $data['status'] = "0";
			 $data['msg'] = "今天".$c."已签过到";
			  $data['score']=$member->where("uid='$uid'")->getfield('score');
	         $this->ajaxreturn($data); 
			
			 
	        }

	   }
	   else{/*首次签到*/
	    $data['uid'] = $uid;
        $data['status'] = "1";
		 $data['time']=NOW_TIME;
       $member->where("uid='$uid'")->setInc('score',10); // 用户的积分加10

         if($iswork->add($data))
		  {  $data['score']=$member->where("uid='$uid'")->getfield('score');
			 $data['msg'] = "首次签到，已签到，积分+10,签到时间：".$d;
	     $this->ajaxreturn($data);
	     }
	  
	  
	  }

		 
}

/*****获取用户uid
***************/
 public  function uid() {
       $user=session('user_auth');
	   $uid=$user["uid"]; 
	   return $uid;
		 
}
/*****全部订单
***************/
public  function allorder(){
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
	  $menu=R('index/menulist');
	   $this->assign('categoryq', $menu);
      $all=D("order");
      $allorder=$all->allOrder(); 
	  $this->assign('allorder', $allorder);
	  $this->display();
    }
/*****未完成订单
***************/
public  function unfinished(){   /* 购物车调用*/
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
	$menu=R('index/menulist');
	   $this->assign('categoryq', $menu);
      $order=D("order");
      $unfinish=$order->unfinishedOrder(); 
	  
	  $this->assign('unfinish', $unfinish);
	   

	  $this->display();
    }
/*****已发货的订单
***************/
 public  function sended(){  
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
	$menu=R('index/menulist');
	   $this->assign('categoryq', $menu);
      $order=D("order");
      $send=$order->sendOrder(); 
	  
	  $this->assign('send', $send);


	  $this->display();
    }
/*****已完成的订单
***************/
 public  function finished(){   /* 购物车调用*/
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
	$menu=R('index/menulist');
	   $this->assign('categoryq', $menu);
      $order=D("order");
      $finish=$order->finishedOrder(); 
	  
	  $this->assign('finish', $finish);
	   

	  $this->display();
    }
/*****购物车
***************/
public  function shopcart() {

	  
        $uid=$this->uid();
		$cart=D("shopcart");
	    $cartlist=$cart->getcart();
		return $cartlist; 
}
/*****收藏夹
***************/
public  function collect() {   /* 购物车调用*/
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
	$menu=R('index/menulist');
	$this->assign('categoryq', $menu);
	$table=D("favortable");
	$favor=$table->getfavor();
    $this->assign('favorlist', $favor);
	$this->display();
}
public  function coupon() {   
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
/* 菜单调用*/
	$menu=R('index/menulist');
	$this->assign('categoryq', $menu);
	/* 会员调用*/
		$member=D("member");
		$uid=$member->uid();
	/* 优惠券调用*/
	$coupon=M("usercoupon")->where("uid='$uid' and status='1'")->select();;
    $this->assign('couponlist', $coupon);
		$fcoupon=M("fcoupon")->where("display='1' and status='1' ")->select();;
    $this->assign('fcouponlist', $fcoupon);
	$this->display();
}

/*****个人资料
***************/
public  function information() {   /* 购物车调用*/
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
	$menu=R('index/menulist');
	   $this->assign('categoryq', $menu);
        $uid=$this->uid();
		$order=D("member");
	    $ucenter=$order->where("uid='$uid'")->select();
		 $this->assign('information', $ucenter);
	  $this->display();
}
public  function update() {
	
        $uid=$this->uid();
		$member=D("member");
	    $data = $member->create(); 
		$result =$member->where("uid='$uid'")->save();
		
        if($result) {
            $this->success('操作成功！');
        }else{
            $this->error('写入错误！');
        }
  
	    
}
}
