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
class ArticleController extends HomeController {
    /* 频道封面页 */
	public function index(){
    $cateid= $id ? $id : I('get.category', 0);//获取分类的英文名称
	$category = D('Category')->info($cateid);
    $id=$category['id']; 
	//获取分类的id
	$name=$category['name'];
     $child=M('Category')->where("pid='$id'")->select();
	 $this->assign('num', $num);
     $this->assign('childlist', $child);
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
	   $record=IpLookup("",2,$name); 
	 }
	  /* 热词调用*/
    $hotsearch=R("Index/getHotsearch");
    $this->assign('hotsearch',$hotsearch);  
		/* 分类信息 */
	$category = $this->category();
		//频道页循环3级分类
	
   // $parentid=$category['id'];
		//$menu=M('category')->where("pid='$parentid'")->select();//获取父类是当前类的所有分类，2级
//if(!empty($menu)){ 
	//判断2级是否为空
//$arr = array();//储存2级分类的2级数组

//foreach($menu as $n=>$val){
	//储存2级分类的一维数组
//$arr[$n]=$val['id'];

//}

//}
//$array=array();//储存3级分类的2级数组
//for($i = 0;$i <count($arr);$i++ ){
 //     $array[$i]=M('category')->where('pid=\''.$arr[$i].'\'')->getField('id',true);
//   
//}

 //for($i=0;$i<count($array);$i++){
  // $a[]=array();//储存3级分类的一维数组
//for($j=0;$j<count($array[$i]);$j++){
  
 // $a[]=$array[$i][$j];
   
//}
///
//}
//$detail=M("Document"); 
 //foreach($a as $n=> $val){ //3级分类遍历,2维数组
  //    $b[]=$detail->where('category_id=\''.$val.'\'')->select();
  //   }
//dump($b);//3级分类及其文章

 //foreach($menu as $n=> $val){ //2级分类遍历
    //  $menu[$n]['id']=$detail->where('category_id=\''.$val['id'].'\'')->select();
    // }
//$this->assign('b', $b);//2级分类及其文章
//$this->assign('arr', $menu);//2级分类及其文章
//dump($menu);
		/* 模板赋值并渲染模板 */
$this->assign('category', $category);
	 
 $this->display($category['template_index']);
	}
	/* 列表页 */
	public function lists($p = 1){
    $rankid= $rank? $rank : I('get.rank', 0);//获取分类的英文名称
		/* 分类信息 */
		$category = $this->category();//一维数组
		/* 获取当前分类列表 */
		$Document = D('Document');
		if(empty($rankid)){
			$order = '`view` DESC';
		$list = $Document->page($p, $category['list_row'])->lists($category['id'],$order);
		}
		else{$order = '`id` DESC';
		$list = $Document->page($p, $category['list_row'])->lists($category['id'],$order);
		}
		if(false === $list){
			$this->error('获取列表数据失败！');
		}
		/* 模板赋值并渲染模板 */
		$key="new";
		$this->assign('keyw', $key);
		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->display($category['template_lists']);
	}
	/* 文档模型详情页 */
public function detail($id = 0, $p = 1){
    /* 热词调用*/
    $hotsearch=R("Index/getHotsearch");
    $this->assign('hotsearch',$hotsearch);
 /* 购物车调用*/
   $cart=R("Shopcart/usercart");
   $this->assign('usercart',$cart);
   if(!session('user_auth')){$usercart=$_SESSION['cart'];
        $this->assign('usercart',$usercart);
   
   }
/* 左侧分类列表*/
$mlist=R('Index/menulist');
$this->assign('categoryq', $mlist);
/* 浏览量排行前7个商品*/
$view=M('Document')->where("display=1")->order("view desc")->select();
  
$this->assign('viewlist', $view);
		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
			$this->error('文档ID错误！');
		}
		/* 页码检测 */
		$p = intval($p);
		$p = empty($p) ? 1 : $p;
		/* 获取详细信息 */
		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
			$this->error($Document->getError());
		}
		/* 分类信息 */
		$category = $this->category($info['category_id']);
		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}
		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');
/*内容页统计代码实现，tag=3*/
 if(1==C('IP_TONGJI')){
	   $record=IpLookup("",3,$id); 
	  }
		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('page', $p); //页码
		$this->display($tmpl);
	}
	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}
		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
				//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}
}
