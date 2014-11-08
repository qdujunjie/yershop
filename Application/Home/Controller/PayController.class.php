<?php

namespace Home\Controller;

use Think\Controller;

class PayController extends Controller {

    public function index() {
        if (IS_POST) {
            //页面上通过表单选择在线支付类型，支付宝为alipay 财付通为tenpay
            $paytype = I('post.paytype');
            $pay = new \Think\Pay($paytype, C('payment.' . $paytype));
           
			if(!empty($_POST['orderid'])){ 
		$order_no=$_POST['orderid'];//未付款订单号
			$body= C('SITENAME')."订单支付";//商品描述
			$title=C('SITENAME')."订单支付";//设置商品名称
				}
			//else{
			// $order_no = $pay->createOrderNo(); //充值，生成订单号
			// $body= C('SITENAME')."会员充值"；//商品描述
				//}
            $vo = new \Think\Pay\PayVo();
            $vo->setBody($body)
                    ->setFee(I('post.money')) //支付金额
                    ->setOrderNo($order_no)//订单号
                    ->setTitle($title)//设置商品名称
                    ->setCallback("Home/Pay/success")/*** 设置支付完成后的后续操作接口 */
                    ->setUrl(U("Home/Pay/over")) /* 设置支付完成后的跳转地址*/
                    ->setParam(array('order_id' => $order_no));
            echo $pay->buildRequestForm($vo);
        } 
		
		else {
            //在此之前goods1的业务订单已经生成，状态为等待支付
		$id=I("get.orderid");
		  $order=D("order");
		 
		 $this->assign('codeid',$id);
	
	   $total=$order->where("orderid='$id'")->getField('pricetotal');
	   $this->assign('goodprice',$total);
            $this->display();
        }
    }

    /**
     * 订单支付成功
     * @param type $money
     * @param type $param
     */
    public function success($money, $param) {
        if (session("pay_verify") == true) {
            session("pay_verify", null);
            //处理goods1业务订单、改名good1业务订单状态
           // M("Goods1Order")->where(array('order_id' => $param['order_id']))->setInc('haspay', $money);
 
      $data = array('status'=>'1','ispay'=>'2');//设置订单为已经支付,状态为已提交
	M('order')->where(array('orderid' => $param['order_id']))->setField($data);

        } 
		
		else {
            E("Access Denied");
        }
    }

	 public function over() {

 
            $this->display('success');

       
    }

}
