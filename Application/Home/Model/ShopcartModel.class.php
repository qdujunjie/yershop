<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 烟消云散 <1010422715@qq.com> 
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;
use Think\Page;

/**
 * 登录用户的购物车类
 */
class ShopcartModel extends Model{

 /*
    查询购物车
    */  
public  function getcart() {
	    $user=D("member");
	    $uid=$user->uid();
		$cart=M("shopcart");
	    $cartlist=$cart->where("uid='$uid'")->select();
		return $cartlist; 
}
       
 /*
    查询购物车中商品的种类
    */
	public  function getCnt(){
	    $user=D("member");
	    $uid=$user->uid();
		$cart=M("shopcart");
	    $cartlist=$cart->where("uid='$uid'")->select();
		return count($cartlist); 
}
public  function getCntByuid(){
	    $user=D("member");
	    $uid=$user->uid();
		$cart=M("shopcart");
	    $cartlist=$cart->where("uid='$uid'")->select();
		return count($cartlist); 
}
  /*
    查询登录用户购物车中商品的总金额
    */
  public function getPriceByuid() { 
	  $user=D("member");
	    $uid=$user->uid();
        //数量为0，价钱为0
        if ($this->getCnt() == 0) {
            return 0;
        }
        $price = 0.00;
        $data = M("shopcart")->where("uid='$uid'")->select();
        foreach ($data as $k=>$val) {
			$id=$val['goodid'];
			$price=get_good_price($id);
            $total += $val['num'] * $price;
        }
        return sprintf("%01.2f", $total);
    }
/* 查询登录用户购物车中商品的个数*/
 public function getNumByuid(){ 
	   $user=D("member");
	    $uid=$user->uid();
        if ($this->getCnt() == 0) {
            //种数为0，个数也为0
            return 0;
        }
 
        $sum = 0;
       $data = M("shopcart")->where("uid='$uid'")->select();
        foreach ($data as $k=>$item) {
            $sum += $item['num'];
        }
        return $sum;
    }
/* 登录用户增加购物车中商品的个数*/
public function inc($id){
	    $user=D("member");
	    $uid=$user->uid();
		$cart=D("shopcart");
		$num= $cart->where("goodid='$id'and uid='$uid'")->getField("num");
        $new=$num+1;
       $cart->where("goodid='$id'and uid='$uid'")->setField('num',$new);
return $new;
}
/* 登录用户减少购物车中商品的个数*/
public function dec($id){
	    $user=D("member");
	    $uid=$user->uid();
		$cart=D("shopcart");
		$num= $cart->where("goodid='$id'and uid='$uid'")->getField("num");
       $new=$num-1;
     $cart->where("goodid='$id'and uid='$uid'")->setField('num',$new);
return $new;

}
/* 登录用户删除购物车中商品的个数*/
public function deleteid($id){
	    $user=D("member");
	    $uid=$user->uid();
		$cart=D("shopcart");
		$result= $cart->where("goodid='$id'and uid='$uid'")->delete();

return $id;
}

}
