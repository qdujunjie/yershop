<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台订单控制器
  * @author 烟消云散 <1010422715@qq.com>
 */
class OrderController extends AdminController {

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index(){
        /* 查询条件初始化 */
	
       $map  = array('status' => 1);
       $list = $this->lists('order', $map,'id');

        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        
        $this->meta_title = '订单管理';
        $this->display();
    }

    /**
     * 新增订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function add(){
        if(IS_POST){
            $Config = D('order');
            $data = $Config->create();
            if($data){
                if($Config->add()){
                    S('DB_CONFIG_DATA',null);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($Config->getError());
            }
        } else {
            $this->meta_title = '新增配置';
            $this->assign('info',null);
            $this->display('edit');
        }
    }

    /**
     * 编辑订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function edit($id = 0){
        if(IS_POST){
            $Form = D('order');
          $user=session('user_auth');
          $uid=$user['uid'];
            if($_POST["id"]){ 
                $Form->create();
				$id=$_POST["id"];
				$Form->update_time = NOW_TIME;
			$Form->assistant = $uid;

           $result=$Form->where("id='$id'")->save();
                if($result){
                    //记录行为
                    action_log('update_order', 'order', $data['id'], UID);
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败55'.$id);
                }
            } else {
                $this->error($Config->getError());
            }
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('order')->find($id);
$detail= M('order')->where("id='$id'")->select();
$list=M('shoplist')->where("orderid='$id'")->select();

            if(false === $info){
                $this->error('获取订单信息错误');
            }
$this->assign('list', $list);
            $this->assign('detail', $detail);
			 $this->assign('info', $info);
			 $this->assign('a', $orderid);
            $this->meta_title = '编辑订单';
            $this->display();
        }
    }
  /**
     * 订单发货
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function send($id = 0){
        if(IS_POST){
            $Form = D('order');
        $user=session('user_auth');
          $uid=$user['uid'];
            if($_POST["id"]){ 
				$id=$_POST["id"];
				//销量加1 库存减1
             $sales= M('document_product')->where("id='$id'")->setInc('totalsales');
              $stock= M('document_product')->where("id='$id'")->setDec('stock');
               $Form->create();
			$user=session('user_auth');
            $uid=$user['uid'];
            $Form->assistant = $uid;
			$Form->update_time = NOW_TIME;
            $Form->status="2";
			$orderid=M('order')->where("id='$id'")->getField("orderid");
			//$confirm="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/confirm/id/".$orderid."'>确认收货</a>";
           // $cancle="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/confirm/id/".$orderid."'>取消订单</a>";
		    //增加查看物流
			$wuliu="<A href='http://".$_SERVER['HTTP_HOST']."/index.php?s=/Home/Order/wuliu/id/".$orderid."'>查看物流</a>";
		  $Form->act_getwuliu=$wuliu;
         // $Form->act_confirm=$confirm;
		// $Form->act_cancel=$cancle;
            $result=$Form->where("id='$id'")->save();
                if($result){
                    //记录行为
                    action_log('update_order', 'order', $data['id'], UID);
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败55'.$id);
                }
            } else {
                $this->error($Config->getError());
            }
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('order')->find($id);
$detail= M('order')->where("id='$id'")->select();
$list=M('shoplist')->where("orderid='$id'")->select();

            if(false === $info){
                $this->error('获取订单信息错误');
            }
$this->assign('list', $list);
            $this->assign('detail', $detail);
			 $this->assign('info', $info);
			
            $this->meta_title = '订单发货';
            $this->display();
        }
    }

  
   /**
     * 删除订单
     * @author yangweijie <yangweijiester@gmail.com>
     */
    public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $order = M("order");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $order->where("id='$id'")->delete();
							 $shop=M("shoplist");
							 $shop->where("orderid='$id'")->delete(); 
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("order");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }




}