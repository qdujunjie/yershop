<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
<title><?php echo C('WEB_SITE_TITLE');?></title>
<link href="/Public/static/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/Public/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/Public/static/bootstrap/css/index.css" rel="stylesheet">
<link href="/Public/static/bootstrap/css/onethink.css" rel="stylesheet">


<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/Public/static/bootstrap/js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript" src="/Public/static/js/jquery.min.js"></script>

<!--[if lt IE 9]>
<script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/Public/static/bootstrap/js/bootstrap.min.js"></script>
<!--<![endif]-->
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>


</head>
<body>
	<!-- 工具条 -->
	<!-- 导航条
================================================== -->

<div class="top">
  <div class="top_main"><a href="<?php echo U('index/index');?>" title="页">首页</a>   
                   
              <span class="toolbar"style="float:right"><a rel="nofollow" href='<?php echo U("center/allorder");?>'>我的订单</a><a rel="nofollow" href='<?php echo U("shopcart/index");?>'>我的购物车</a><a rel="nofollow" href='<?php echo U("center/collect");?>'>我的收藏</a><a rel="nofollow" href='<?php echo U("center/index");?>'>个人中心</a></span> </div></div>
	<!-- /工具条 -->
	<!-- 头部 -->
	<!-- 导航条
================================================== -->


<form action="<?php echo U("Search/index");?>" name="Searchform"  method="post" ><div class="header"><a href="" class="logo" title="稻壳儿">www.docer.com</a><a href="http://www.docer.com/zhuanti/national.html?from=gif" class="gif_ad"><img src="http://www.docer.com/application/styles/images/gif_ad.gif" alt=""></a><div class="header_conter" style="display:" data-searchbar-value="" data-searchbar-radiovalue="所有" data-searchbar-readioselector="#searchRadio" data-searchbar-tags="" data-searchbar-saletype="0"><div class="search"><input type="text" name="words" placeholder="输入您想要的商品" class="search_input"><a rel="nofollow" href="javascript:vod(0)" class="search_btn"></a></div><div class="tag">热门搜索：
</form>
<?php if(is_array($hotsearch)): foreach($hotsearch as $key=>$vo): ?><a href="<?php echo U('Search/index?words='.$vo);?>"><?php echo ($vo); ?></a><?php endforeach; endif; ?>

</div></div><div class="top_right"><a rel="nofollow" href="<?php echo U('shopcart/index');?>" class="shopping_cart" id="shopping_cart" style="display:">购物车<span id="docerCartBtn" class="yellow"></span></a><?php if(is_login()): if(empty($usercart)): ?><div class="sc_goods"  id="goods" style="display:none;"><ul class="sc_goods_ul">
<p class="sc_goods_none" >您的购物车还是空的，赶紧行动吧！</p></ul>
<div class="sc_goods_foot" style="display: none;">
<a rel="nofollow" href="<?php echo U('shopcart/index');?>" class="my_shopping_cart_btn">查看我的购物车</a>
</div>
</div>
<?php else: ?>
<div class="sc_goods" id="goods" style="display: none;"><ul class="sc_goods_ul">
<?php if(is_array($usercart)): $i = 0; $__LIST__ = $usercart;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li> <a href="<?php echo U('Article/detail?id='.$vo['goodid']);?>"><img src="<?php echo (get_cover(get_cover_id($vo["goodid"]),'path')); ?>" width='40' height='40'/> <?php echo (get_good_name($vo["goodid"])); ?></a><span class="red"style="text-align:left">  <?php echo (get_good_price($vo["goodid"])); ?>元</span> <a name="<?php echo ($vo["goodid"]); ?>" rel="del" href="javascript:vod(0);"  class="red" onclick="delcommon(event)">删除</a></li><?php endforeach; endif; else: echo "" ;endif; ?></ul>
<div class="sc_goods_foot" style="display:block;">
<a rel="nofollow" href="<?php echo U('shopcart/index');?>" class="my_shopping_cart_btn">查看我的购物车</a>
</div>
</div><?php endif; ?>
<div class="top_login">


<div class="top_lg_info"  style="display: block;">欢迎您，<a href="<?php echo U('center/information');?>" id="div1"><?php echo get_username();?> </a>
<ul id="div2" class="top_lg_info_down" style="display: none;"><li><a rel="nofollow" href="<?php echo U('center/index');?>">我的订单</a></li><li><a rel="nofollow" href="<?php echo U('center/collect');?>">我的收藏</a></li><li><a rel="nofollow" href="<?php echo U('User/profile');?>">修改密码</a></li><li><a rel="nofollow"  href="<?php echo U('User/logout');?>">退出登录</a></li></ul></div>

 <?php else: ?>
<div class="top_lg_link" > <a href="<?php echo U('User/register');?>" style="padding-left:0;padding-right:0">注册</a>  <a href="<?php echo U('User/login');?>">登录</a></div>

 
</div><div id="goods" class="sc_goods2" style="display: none;">
<?php if(empty($usercart)): ?><ul class="sc_goods_ul">
<p class="sc_goods_none" >您的购物车还是空的，赶紧行动吧！</p>

</ul><div class="sc_goods_foot" style="display: none;">
<a rel="nofollow" href="<?php echo U('shopcart/index');?>" class="my_shopping_cart_btn">查看我的购物车</a>
</div>
<?php else: ?>

<ul class="sc_goods_ul">
 <?php if(is_array($usercart)): foreach($usercart as $key=>$vo): ?><li> <a href="<?php echo U('Article/detail?id='.$vo['id']);?>"><img src="<?php echo (get_cover(get_cover_id($vo["id"]),'path')); ?>" width='40' height='40'/> <?php echo (get_good_name($vo["id"])); ?></a><span class="red"style="text-align:left">  <?php echo (get_good_price($vo["id"])); ?>元</span> <a name="<?php echo ($vo["id"]); ?>" rel="del" href="javascript:vod(0);" class="red" onclick="delcommon(event)">删除</a></li><?php endforeach; endif; ?></ul><div class="sc_goods_foot" style="display:block;">
<a rel="nofollow" href="<?php echo U('shopcart/index');?>"  class="my_shopping_cart_btn">查看我的购物车</a>
</div><?php endif; ?>
</div><?php endif; ?>
</div><div class="cb"></div></div>
	<!-- /头部 -->
	
	<!-- 主体 -->
	<div  class="wrapper">

 
<div class="nav-wrap">
  <div class="nava">
    <div class="goods">
      <div>
        <h2> <a>商品分类</a> </h2>
      </div>
       <div class="all-goods"  id="all-goods">
<?php if(is_array($categoryq)): $i = 0; $__LIST__ = $categoryq;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><div class="item">
          <div class="product"><h4><a href="<?php echo U('home/article/index/category/'.$cate['name']);?>"><?php echo ($cate["title"]); ?></a> </h4><s></s> </div>
            <?php if($cate['child'] != false): ?><div class="product-wrap pos"> 
            <!--手提袋-->
            <div class="cf">
              <div class="fl wd252 pr20">
                <h2><a href="<?php echo U('home/article/index/category/'.$cate['name']);?>"><?php echo ($cate["title"]); ?></a> </h2>
                <p class="lh30"><?php echo ((isset($cate["description"]) && ($cate["description"] !== ""))?($cate["description"]):"分类描述ㄨㄨㄨ"); ?></p>
                <ul class="cf">
                <?php if(is_array($cate['child'])): $i = 0; $__LIST__ = $cate['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate_sub): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('home/article/index/category/'.$cate_sub['name']);?>"><?php echo ($cate_sub["title"]); ?><i class="icon-chevron-right"></i> </a>
                    
              
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
</div>
              <dl class="fl wd185 pl20 blee">
                <dt class="lh36">促销活动</dt>
                <dd id="stdads"><a href="http://www.xwcms.net" target="_blank" title="手提袋"><img src="/Public/static/bootstrap/img/0934218124.jpg"></a></dd>
              </dl>
            </div> </div><?php endif; ?>
       
        </div><?php endforeach; endif; else: echo "" ;endif; ?>
        
      </div></div>
    
    <ul class="menu-list cf">
      <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): ?><li>
                            <a href="<?php echo (get_nav_url($nav["url"])); ?>" target="<?php if(($nav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($nav["title"]); ?></a>
                      </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    
  </div>
</div>
 <div id="myCarousel" class="carousel slide">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active">1</li>
    <li data-target="#myCarousel" data-slide-to="1">2</li>
    <li data-target="#myCarousel" data-slide-to="2">3</li>
  </ol>
  <!-- Carousel items -->
  <div class="carousel-inner">
   

    <?php if(is_array($carousel)): $i = 0; $__LIST__ = array_slice($carousel,1,2,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pos): $mod = ($i % 2 );++$i;?><div class="item">
<a href="<?php echo U('Article/detail?id='.$pos['id']);?>" target="_blank"><img src="<?php echo (get_cover(get_good_adid($pos["id"]),'path')); ?>"/></a>

  <div class="carousel-caption">
                      <h4><?php echo (get_good_name($pos["id"])); ?></h4>
                      <p><?php echo ($pos["adtitle"]); ?></p>
                    </div>
</div><?php endforeach; endif; else: echo "" ;endif; ?>

  </div>
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>
<script>$().ready(function () {
	  var eq=$(".carousel-inner>div").eq(0).attr("class","active item");
	  })</script><!--bootstrap幻灯片首个item设置class为active item-->
<div  class="rside">
<span><img data-img="2" src="http://img12.360buyimg.com/da/jfs/t307/47/730614248/16617/d99caa4b/542157edN66043046.jpg" width="310" height="70" alt=""></span>
<div class="note"><ul><li class="selected">公告</li><li>活动</li></ul></div>
<div id="msg">
<div class="message"><ul><?php $category=D('Category')->getChildrenId(56);$__LIST__ = D('Document')->page(!empty($_GET["p"])?$_GET["p"]:1,10)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$article): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                     <?php echo ($article["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?> </ul></div>
<div class="message"  style="display: none"><ul><?php $category=D('Category')->getChildrenId(52);$__LIST__ = D('Document')->page(!empty($_GET["p"])?$_GET["p"]:1,10)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$article): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                     <?php echo ($article["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?></div>
<div class="message"  style="display: none"></div>
</div>
</div>
<div class="d-propose"><div class="t1"><ul><li class="selected">最新上架</li><li>限时抢购</li><li>热卖商品</li></ul></div>
<div id="p-list-wrap">
<div class="list"><ul><?php if(is_array($bytime)): $i = 0; $__LIST__ = $bytime;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><div>
 <a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                        <img src="<?php echo (get_cover(get_cover_id($vo["id"]),'path')); ?>"/></a></div>
                        <p class="name">
 <a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                       <?php echo (get_good_name($vo["id"])); ?></a></p>
                       
</li><?php endforeach; endif; else: echo "" ;endif; ?>
      
                        
                        </ul></div>
<div class="list"  style="display: none"><ul><?php if(is_array($timelist)): $i = 0; $__LIST__ = $timelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><div>
 <a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                        <img src="<?php echo (get_cover(get_cover_id($vo["id"]),'path')); ?>"/></a></div>
                        <p class="name">
 <a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                       <?php echo (get_good_name($vo["id"])); ?></a></p>
                        
</li><?php endforeach; endif; else: echo "" ;endif; ?>  </ul></div>
<div class="list"  style="display: none"><ul><?php if(is_array($totalsales)): $i = 0; $__LIST__ = $totalsales;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><div>
 <a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                        <img src="<?php echo (get_cover(get_cover_id($vo["id"]),'path')); ?>"/></a></div>
                        <p class="name">
 <a href="<?php echo U('Article/detail?id='.$vo['id']);?>">
                       <?php echo (get_good_name($vo["id"])); ?></a></p>
                       
</li><?php endforeach; endif; else: echo "" ;endif; ?>  </ul></div>
</div></div><div class="blank"></div>
<div class="category-recommend-1"><div class="c-logo"><a href="http://www.benlai.com/notice-231.html
" target="_blank"><img alt="" src=""> </a></div>
<!--栏目调用开始-->
<!--栏目推荐位调用开始-->

<div class="r-t2">新鲜水果</div>
<div class="blank"></div>
<div class="r-p-wrap">
<div class="bpic"><?php $__POSLIST__ = D('Document')->position(2,57,1,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pos): $mod = ($i % 2 );++$i;?><a href="<?php echo U('Article/detail?id='.$pos['id']);?>" target="_blank"><img src="<?php echo (get_cover(get_good_adid($pos["id"]),'path')); ?>"/><?php endforeach; endif; else: echo "" ;endif; ?></a></div>

<!--栏目推荐位调用结束-->
<!--栏目文章调用开始-->
<ul class="r-list">
  <?php $category=D('Category')->getChildrenId(52);$__LIST__ = D('Document')->page(!empty($_GET["p"])?$_GET["p"]:1,10)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$article): $mod = ($i % 2 );++$i;?><li>
                    <div class="pic" name="55">
                        <a class="sy" benlai-source="1" benlai-location="13-1" href="<?php echo U('Article/detail?id='.$article['id']);?>" target="_blank" title="<?php echo ($article["title"]); ?>">
                            <img width="140" height="140" alt="<?php echo ($article["title"]); ?>" onerror="this.onerror=null;this.src='<?php echo (get_cover($article["cover_id"],'path')); ?>'" src="<?php echo (get_cover($article["cover_id"],'path')); ?>" style="display: inline; opacity: 1; margin-top: 0px;"></a>
                        <div class="buy" >
                            <a href="javascript:;" onclick="AddProductToCart(<?php echo ($article["id"]); ?>)">
                                <img width="140" height="30" src="/Public/static/images/btn_buy.gif" style="width:140px;height:30px;">
                            </a>
                        </div>
                    </div>
                    <div class="name"><a href="<?php echo U('Article/detail?id='.$article['id']);?>" benlai-source="1" benlai-location="13-1" target="_blank" title="<?php echo ($article["title"]); ?>"><?php echo (get_good_shorttitle($article["id"])); ?></a></div>
                    <div class="price">
                        <font>￥</font><span><?php echo (get_good_price($article["id"])); ?></span>
                        <span style="color: #999999; font-size: 12px; font-weight: 400; margin-left: 3px; text-decoration: line-through"><?php echo (get_good_yprice($article["id"])); ?></span>
                    </div>
  </li><?php endforeach; endif; else: echo "" ;endif; ?> 
                </ul>
				<!--栏目文章调用开始-->
</div>
<!--栏目调用结束-->
</div>
 
<script type="text/javascript">

function AddProductToCart(i)
{ var a='<?php echo ($url); ?>';
	var goodid=i;
var url='<?php echo U("Shopcart/addItem");?>';//地址
$.ajax({
type:'post', //传送的方式,get/post
url:'<?php echo U("Shopcart/addgood");?>', //发送数据的地址
 data:{
	 id:goodid,tag:1
 },
 dataType: "json",
success:function(data)
{

var html='<li><img src="'+data.src+'">'+data.title+'<span class="red" style="text-align:left"> '
+data.price+'元</span>'+'<a name="'+goodid+'" rel="del" class="red" onclick="delcommon(event)">删除</a>'+'</li>';//创建节点
if(data.exsit=="1"){
	alert("购物车已存在该商品，数量+1");
//后台返回数据，判断购物车中是否已存在，存在，不追加节点

}	
else{
alert(data.msg);//后台返回数据，判断购物车中是否已存在，不存在，追加节点
	$("p.sc_goods_none").remove();//移除节点
$("ul.sc_goods_ul").append(html);//追加节点

}
if(data.num=="0"){ //判断数量是否为0，为0则隐藏底部查看工具
						$("div.sc_goods_foot").hide();
	}
	else{$("div.sc_goods_foot").show();}
},
error:function (XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
		})
}

	function delcommon(event) { //获取事件源
event = event ? event : window.event; 
var obj = event.srcElement ? event.srcElement : event.target; 
//这时obj就是触发事件的对象，可以使用它的各个属性 
//还可以将obj转换成jquery对象，方便选用其他元素 
str = obj.innerHTML.replace(/<\/?[^>]*>/g,''); //去除HTML tag

	var $obj = $(obj);
	
	if(obj.rel=="del")
{ var gid=obj.name;
var array=$("#div2 li");//登录用户显示的li的个数
var arr=$("#goods li");//未登录用户显示的li的个数
	//全选的实现 定义删的发送路径
	if(array.length!==4){
		var del='<?php echo U("Shopcart/delItem");?>';
	
	}
else{
var del='<?php echo U("Shopcart/delItemByuid");?>';
	
	}
$.ajax({
type:'post', //传送的方式,get/post
url:del, //发送数据的地址
data:{id:gid},
 dataType: "json",
success:function(data)
{var $obj = $(obj);
	$obj.parent().remove();

	if(data.num=="0"){  //判断购物车数量是否为0，为0则隐藏底部查看工具
						$("div.sc_goods_foot").hide();
						var html='<p class="sc_goods_none" >您的购物车还是空的，赶紧行动吧！</p>';
					$("ul.sc_goods_ul").html(html);
				
	
	}
	else{$("div.sc_goods_foot").show();}

},
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
		})
}
	
	} 
  var oDiv1 = document.getElementById('div1');
            var oDiv2 = document.getElementById('div2');
            var timer = null;//定义定时器变量
            //鼠标移入div1或div2都把定时器关闭了，不让他消失
            oDiv1.onmouseover = oDiv2.onmouseover = function ()
            {
                oDiv2.style.display = 'block';
                clearTimeout(timer);
            }
            //鼠标移出div1或div2都重新开定时器，让他延时消失
            oDiv1.onmouseout = oDiv2.onmouseout = function ()
            {
                //开定时器
                timer = setTimeout(function () { 
                    oDiv2.style.display = 'none'; }, 200);
            }
			
			var a= document.getElementById('shopping_cart');
  var b = document.getElementById('goods');
            var timer5 = null;//定义定时器变量
            //鼠标移入div1或div2都把定时器关闭了，不让他消失
            a.onmouseover = b.onmouseover = function ()
            {
                b.style.display = 'block';
                clearTimeout(timer5);
            }
            //鼠标移出div1或div2都重新开定时器，让他延时消失
            a.onmouseout = b.onmouseout = function ()
            {
                //开定时器
                timer5= setTimeout(function () { 
                    b.style.display = 'none'; }, 500);
            }
			</script>


            

 </div>
	<!-- /主体 -->

	<!-- 底部 -->
	
    <!-- 底部
    ================================================== -->
   <script type="text/javascript" src="/Public/static/js/menudown.js"></script> 
	<script>
	//购物车显示与隐藏
	var a= document.getElementById('shopping_cart');
  var b = document.getElementById('goods');
            var timerr = null;//定义定时器变量
            //鼠标移入div1或div2都把定时器关闭了，不让他消失
            a.onmouseover = b.onmouseover = function ()
            {
                b.style.display = 'block';
                clearTimeout(timerr);
            }
            //鼠标移出div1或div2都重新开定时器，让他延时消失
            a.onmouseout = b.onmouseout = function ()
            {
                //开定时器
                timerr= setTimeout(function () { 
                    b.style.display = 'none'; }, 500);
            }
			
			
			</script>

<div class="footer">
    <div class="foot_center">        
        <ul class="foot_title clearfix">
            <li class="foot_title_first"><a href="/helpcenter-after_sales.html#service"></a></li>
            <!-- <li class="foot_title_second"><a href="/helpcenter-after_sales.html#service"></a></li>
             -->
            <li class="foot_title_third"><a href="/helpcenter-send.html#cost"></a></li>
            <li class="foot_title_forth"><a href="/helpcenter-after_sales.html#query"></a></li>
        </ul>
        <div class="foot_list clearfix">
            <dl class="dl_foot_list_first">
    <dt class="dt_foot_list_first"><img src="http://shop.vivo.com.cn/themes/vivo/widgets/vivo_helper/images/txt_gmlc.jpg" alt="购买流程"></dt>
    <dd><a href="<?php echo U("Service/index?id=19");?>" title="支付宝支付">支付宝支付</a></dd>
    <dd><a href="/helpcenter-purchase_process.html#invoice" title="发票说明">发票说明</a></dd>
    <dd><a href="/helpcenter-purchase_process.html#coupon" title="优惠券说明">优惠券说明</a></dd>
</dl>
<dl class="dl_foot_list_second">
    <dt class="dt_foot_list_second"><img src="http://shop.vivo.com.cn/themes/vivo/widgets/vivo_helper/images/txt_psfs.jpg" alt="配送方式"></dt>
    <dd><a href="/helpcenter-send.html#way" title="配送方式">配送方式</a></dd>
    <dd><a href="/helpcenter-send.html#cost" title="配送费用">配送费用</a></dd>
    <dd><a href="/helpcenter-send.html#notice" title="签收须知">签收须知</a></dd>
</dl>
<dl class="dl_foot_list_third">
    <dt class="dt_foot_list_third"><img src="http://shop.vivo.com.cn/themes/vivo/widgets/vivo_helper/images/txt_fwzc.jpg" alt="服务支持"></dt>
    <dd><a href="/helpcenter-service_guarantee.html" title="服务保证">服务保证</a></dd>
    <dd><a href="/helpcenter-after_sales.html#service" title="售后服务">售后服务</a></dd>
    <dd><a href="/helpcenter-after_sales.html#query" title="售后网点查询">售后网点查询</a></dd>
</dl>
<dl class="dl_foot_list_forth">
    <dt class="dt_foot_list_forth"><img src="http://shop.vivo.com.cn/themes/vivo/widgets/vivo_helper/images/txt_ppfw.jpg" alt="品牌服务"></dt>
    <dd><a href="http://www.vivo.com.cn/service-faq_zhineng.html" title="常见问题" target="_blank">常见问题</a></dd>
    <dd><a href="http://www.vivo.com.cn/download.html" title="相关下载" target="_blank">相关下载</a></dd>
    <dd><a href="/helpcenter-contact_us.html" title="联系我们">联系我们</a></dd>
</dl>
<div class="online">
    <h3><img src="http://shop.vivo.com.cn/themes/vivo/widgets/vivo_helper/images/pic_xv.jpg" alt="小V在线时段"></h3>
    <p>周一至周五 08:00-21:00</p>
    <p>周六、周日 09:00-18:00</p>
	<p><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo C('QQ');?>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<?php echo C('QQ');?>:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></p>
</div>
        </div>
    </div>
   
<div class="theme-footer"> 
    
	<p><span style="color: rgb(83, 83, 83); font-family: 'Microsoft YaHei'; text-align: center;">友情链接 :<a href="http://m.kuaidi100.com" target="_blank">快递查询</a> </span></p>
  
      
       <p><span style="color: rgb(83, 83, 83); font-family: 'Microsoft YaHei'; text-align: center;"> Copyright 2014-2015 本站由 <strong><a href="http://www.ijquery.net/" target="_blank">yershop</a></strong> 强力驱动 保留一切权利粤B2-20080267 | 粤ICP备05100288号</p>
    
	</div>
<script type="text/javascript">
(function(){
	var ThinkPHP = window.Think = {
		"ROOT"   : "", //当前网站地址
		"APP"    : "/index.php?s=", //当前项目地址
		"PUBLIC" : "/Public", //项目公共目录地址
		"DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
		"MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
		"VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
	}
})();
</script>
 <!-- 用于加载js代码 -->
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<?php echo hook('pageFooter', 'widget');?>

	<!-- /底部 -->
</body>
</html>