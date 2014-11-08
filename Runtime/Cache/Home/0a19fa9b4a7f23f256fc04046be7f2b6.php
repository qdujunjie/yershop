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
<script type="text/javascript" src="/Public/static/js/menudown.js"></script>
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

	<!-- 菜单 -->
	<!-- 导航条
================================================== -->

 <div class="menu-wrapper" >
    <div class="nav-all">
       <div class="all_class" id="all-class">
        <h2> <a>商品分类<span class="all_class_arrow"></span></a> </h2>
      </div>
      <div class="all-goods" style="display: none;" id="all-goods">
<?php if(is_array($categoryq)): $i = 0; $__LIST__ = $categoryq;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><div class="item">
          <div class="product"><h4><a href="<?php echo U('home/article/index/category/'.$cate['name']);?>"><?php echo ($cate["title"]); ?></a> </h4><s></s> </div>
            <?php if($cate['child'] != false): ?><div class="product-wrap pos"> 
            <!--手提袋-->
            <div class="cf">
              <div class="fl wd252 pr20">
                <h2><a href="<?php echo U('home/article/index/category/'.$cate['name']);?>"><?php echo ($cate["title"]); ?></a> </h2>
                <p class="lh30">纸质手提袋定制，设计印刷全部搞定。</p>
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
	<!-- /菜单 -->


	<!-- 主体 -->
	<div  class="wrapper">

  
<div class="main">
<div class="main_nav"><a rel="nofollow" href="/">首页</a>&gt;<?php echo (get_location_name($info["category_id"])); ?>&gt;<p  id="tit"><a class="red fwb"href="<?php echo U('Article/detail?id='.$info['id']);?>"><?php echo ($info["title"]); ?></a></p></div>
<div class="details">
<div class="details_left">
<!-- 商品描述-->
<div class="details_left_top">
<!-- jqzoom-->
<div id=wwwzzjsnet>
	<div class=jqzoom id=spec-n1 ><IMG height="350" src="<?php echo (get_cover($info["cover_id"],'path')); ?>" jqimg="<?php echo (get_cover($info["cover_id"],'path')); ?>" width="350">
	</div>
	<div id=spec-n5>
		<div class=control id=spec-left>
			<img src="/Public/Home/images/btn_mobile_prev_cur.jpg" />
		</div>
		<div id=spec-list>
			<ul class=list-h><?php if(!empty($info['pics'])){ $pics= explode(',',$info['pics']);}else{ $pics="";} ?>
  <li><img src="<?php echo (get_cover($info["cover_id"],'path')); ?>" height="50" width="50"/></li>
   <?php if(!empty($pics)): if(is_array($pics)): $i = 0; $__LIST__ = $pics;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li><img src="<?php echo (get_cover($v,'path')); ?>" data-id="<?php echo ($v); ?>"/> </li><?php endforeach; endif; else: echo "" ;endif; endif; ?> 
		<?php if(empty($pics)): ?><li><img src="<?php echo (get_cover($info["cover_id"],'path')); ?>" height="50" width="50"/></li>
				<li><img src="/Public/Home/images/img02_20110119zzjs_net.jpg"> </li>
				<li><img src="/Public/Home/images/img03_20110119zzjs_net.jpg"> </li>
				<li><img src="/Public/Home/images/img04_20110119zzjs_net.jpg"> </li>
				<li><img src="/Public/Home/images/img01_20110119zzjs_net.jpg"> </li><?php endif; ?>
			</ul>
		</div>
		<div class=control id=spec-right>
			<img src="/Public/Home/images/btn_mobile_next_cur.jpg" />
		</div>
    </div>
</div><!-- js-->
<SCRIPT src="/Public/static/js/picchange.js" type=text/javascript></SCRIPT>
<SCRIPT src="/Public/static/js/base.js" type=text/javascript></SCRIPT>
<SCRIPT type=text/javascript>
$(function(){
   $(".jqzoom").jqueryzoom({
	xzoom:400,
	yzoom:400,
	offset:10,
	position:"right",
	preload:1,
	lens:1
});
	$("#spec-list").jdMarquee({
	deriction:"left",
	width:371,
	height:56,
	step:2,
	speed:4,
	delay:10,
	control:true,
	_front:"#spec-right",
	_back:"#spec-left"
});
	$("#spec-list img").bind("mouseover",function(){
	var src=$(this).attr("src");
	$("#spec-n1 img").eq(0).attr({
		src:src.replace("\/n5\/","\/n1\/"),
		jqimg:src.replace("\/n5\/","\/n0\/")
	});
	$(this).css({
		"border":"2px solid #ff6600",
		"padding":"1px"
	});
}).bind("mouseout",function(){
	$(this).css({
		"border":"1px solid #ccc",
	"padding":"2px"
	});
});
})
</SCRIPT>
<SCRIPT src="/Public/static/js/jqueryzoom-jcarousel.js" type="text/javascript"></SCRIPT>
<!-- js over-->
<!-- jqzoom over-->
<!-- 商品参数-->
<div class="dl_goods_info">
<h2 class="dginfo_h2" ><?php echo ($info["title"]); ?></h2>
<p >价格：<span class="dginfo_price">￥<em class="price"><?php echo ($info["price"]); ?></em></span></p>
<p >净重：<em class="price"><?php echo ($info["weight"]); ?></em>g</p>
<ul class="dginfo_info">
<li>配送地：<?php echo (get_address($info["uid"])); ?></li>
<li style="clear:both; width:100%">
<form action="<?php echo U("Shopcart/order");?>" name="orderform" id="orform" method="post" onsubmit="return trySubmit()">
<input type="hidden" name="id[]" value="<?php echo ($info["id"]); ?>"/> 
<p class="num_box">数量：<a href="javascript:void(0)"   onclick="add()" >+</a>  
         <input type="text" class="num" value="1"  name="num[]" /><a onclick="reduce()" id="oneA" href="javascript:void(0)" >-</a></p>
		 
 </form></li>
 <li>预览：886次</li>
 <li class="dginfo_info_last">时间：2014-09-24</li>
 <li class="dginfo_info_last">赠送积分：<?php echo ($info["score"]); ?></li>
</ul>
<!-- buy-->
<div style="margin-top:20px;overflow:hidden"><a rel="nofollow" href="javascript:void(0)"  onclick='order(<?php echo ($info["id"]); ?>)' class="dginfo_btn">立刻购买</a>
<a  rel="nofollow" href="javascript:void(0)" onclick='buy(<?php echo ($info["id"]); ?>)' class="dginfo_btn"  >加入购物车</a>
</div>
<!-- buy-->
<p>
<span>收藏产品：<a href="javascript:vod(0);" onclick="favor()"><img title="收藏按钮" src="/Public/Home/images/icon_favorite_pro.jpg" ></a>
</span>
&nbsp;&nbsp;&nbsp;&nbsp;<span>&nbsp;&nbsp;&nbsp;分享到：<a title="分享到新浪微博" target="_blank" href="http://service.t.sina.com.cn/share/share.php?title=<?php echo ($info["title"]); ?>。（来自<?php echo C('SITENAME');?>）&amp;url=<?php echo C('DOMAIN'); echo U('Article/detail?id='.$info['id']);?>&amp;pic=<?php echo C('DOMAIN'); echo (get_cover($info["cover_id"],'path')); ?>" data-item="sina" class="J_vivo_share">
            <img alt="新浪微博" src="/Public/Home/images/icon_sina_weibo.jpg" app="b2c">        </a>                                                                
        <a title="分享到腾讯微博" target="_blank" href="http://v.t.qq.com/share/share.php?title=<?php echo ($info["title"]); ?>（来自<?php echo C('SITENAME');?>）。&amp;url=<?php echo C('DOMAIN'); echo U('Article/detail?id='.$info['id']);?>&amp;pic=<?php echo C('DOMAIN'); echo (get_cover($info["cover_id"],'path')); ?>" data-item="tencent" class="J_vivo_share">
            <img alt="腾讯微博" src="/Public/Home/images/icon_tencent_weibo.jpg" app="b2c">        </a>                                                                
        <a target="_blank" title="分享到人人网" href="http://widget.renren.com/dialog/share?resourceUrl=http://<?php echo C('DOMAIN'); echo U('Article/detail?id='.$info['id']);?>;srcUrl=<?php echo C('DOMAIN');?>&amp;title=<?php echo ($info["title"]); ?>。（来自<?php echo C('SITENAME');?>）&amp;pic=http://<?php echo C('DOMAIN'); echo (get_cover($info["cover_id"],'path')); ?>" data-item="renren" class="J_vivo_share">
            <img alt="人人网" src="/Public/Home/images/icon_renrenwang.jpg" app="b2c">        </a>           
</span></p>

</div>
<!-- 商品参数 结束-->
</div>
<!-- 商品描述结束-->
<div class="dl_goods_detail">
<h3 class="dgdm_preview_h3">商品详情</h3>
<Div style="clear:both; overflow:hidden">
        <section id="contents"><?php echo ($info["content"]); ?></section>
		</Div>
</div>
</div>



<div class="details_right"><dl><dt>本周热门物品</dt><?php if(is_array($viewlist)): $i = 0; $__LIST__ = $viewlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><dd><a class="details_right_img" href="<?php echo U('Article/detail?id='.$vo['id']);?>" title="<?php echo ($vo["title"]); ?>"><img src="<?php echo (get_cover($vo["cover_id"],'path')); ?>"  alt="<?php echo ($vo["title"]); ?>" style="display: inline-block;"></a><a href="<?php echo U('Article/detail?id='.$vo['id']);?>" class="details_right_title" title="<?php echo ($vo["title"]); ?>"><?php echo ($vo["title"]); ?></a><span class="fwb mcm_title_price">￥<span class="red"><?php echo (get_good_price($vo["id"])); ?></span></span></dd><?php endforeach; endif; else: echo "" ;endif; ?></dl></div></div>

</div>
  
   <!-- jQuery 遮罩层 begin -->
<div id="fullbg"></div>
<!-- end jQuery 遮罩层 -->
<!-- 对话框 -->
<div id="dialog">
   <!-- Modal 对话框内容 -->
<div id="myModal" class="modal">
     
  <div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="glyphicon glyphicon-remove" id="ticon" onclick="closeBg();"></i></button>
<h3 id="myModalLabel">用户登录</h3>
</div><div class="m_img">
        <a class="" href="/index.php?s=/Home/Addons/execute/_addons/SyncLogin/_controller/Base/_action/login/type/qq.html"><img src="/Public/Home/images/qq.png">&nbsp;用QQ账号登录</a></br></br>
        <a class="" href="/index.php?s=/Home/Addons/execute/_addons/SyncLogin/_controller/Base/_action/login/type/sina.html"><img src="/Public/Home/images/weibo.png">&nbsp;用微博账号登录</a>
        <!--<a class="btn btn-warning btn-block" href="">用豆瓣账号登录</a>
        <a class="btn btn-primary btn-block" href="">用人人账号登录</a>-->
    </div>
    <form class="form-horizontal" id="loginform" name="user" method="post">
    
            <div class="form_login">   <em class="user glyphicon glyphicon-user"></em> <input type="text"  id="inputusername" name="username" placeholder="用户名">
   
 </div>
    <div class="form_login">
             <em class="user glyphicon glyphicon-lock"></em> <input  class="v_yerhop"type="text"  id="inputpassword" name="password"  placeholder="密码">
			  
				
            </div><div class="form_login">
 <input type="button" class="v_yerhop"  id="login_btn_cart" value="登录"> </div>
    <div class="control-group">
    
   
   <p><span class="pull-right"><span>还没有账号? <a href="<?php echo U("User/register");?>" class="now">立即注册</a></span> </p>
 
    </div>
    </form>
</div> <!-- Modal 对话框内容 -->
</div><!-- 对话框 结束-->
<!-- jQuery 遮罩层上方的对话框 -->
<script type="text/javascript">
//显示灰色 jQuery 遮罩层
function showBg() {
    var bh = $("body").height();
    var bw = $("body").width();
    $("#fullbg").css({
        height:bh,
        width:bw,
        display:"block"
    });
    $("#dialog").show();
}
//关闭灰色 jQuery 遮罩
function closeBg() {
    $("#fullbg,#dialog").hide();
}
</script>
<!--[if lte IE 6]>
<script type="text/javascript">
// 浮动对话框
$(document).ready(function() {
    var domThis = $('#dialog')[0];
    var wh = $(window).height() / 2;
    $("body").css({
        "background-image": "url(about:blank)",
        "background-attachment": "fixed"
    });
    domThis.style.setExpression('top', 'eval((document.documentElement).scrollTop + ' + wh + ') + "px"');
});
</script>
<![endif]-->
        <!-- Contents
        ================================================== -->
    

 <script type="text/javascript">
        function trySubmit() {
            if (this.submitFlag == 1) {
                alert('数据已经提交，请勿再次提交。');
                return false;
            }
            else {
                this.submitFlag = 1;               
                return true;
            }
        }
    </script>
    <script type="text/javascript">
	//立即购买
 function order(i)
{
var array=$("#div2 li");
if(array.length==4){
document.orderform.submit();
}

else{showBg();

}
}
//收藏
function favor() { 
	var array=$(" #div2 li");
if(array.length==4){
var favorid='<?php echo ($info["id"]); ?>';
	$.ajax({
type:'post', //传送的方式,get/post
url:'<?php echo U("User/favor");?>', //发送数据的地址
data:{id:favorid},
 dataType: "json",
success:function(data){
	alert(data.msg)
	}
	,
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
})	
}

else{
showBg();
}
	
	}
	//购物车删除商品
	function delcommon(event) { 
		//获取事件源
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
//加入购物车
function buy(i)
{
	var gid=i;
var url='<?php echo U("Shopcart/addItem");?>';//地址
var gnum=$(".num").val();//数量
var gprice=$(".price").text();//价格
var src=$(".img").html();//图片
var title=$("#tit").html();//名称
$.ajax({
type:'post', //传送的方式,get/post
url:'<?php echo U("Shopcart/addItem");?>', //发送数据的地址
 data:{
	 id:gid,num:gnum,price:gprice
 },
 dataType: "json",
success:function(data)
{

var html='<li>'+src+title+'<span class="red" style="text-align:left"> '
+gprice+'元</span>'+'<a name="'+gid+'" rel="del" class="red" onclick="delcommon(event)">删除</a>'+'</li>';//创建节点
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
 //增加数量
function add() {

 var num = $(".num").val();     
num++;  
     $(".num").val(num); 
}
//减少数量
function reduce() {

 var num = $(".num").val();     

if(num>1)  
      { num--; 
    $(".num").val(num);
      }
	  else{
		  $("#oneA").addClass("important"); }

}  
 //登录后刷新页面，载入数据
$("#login_btn_cart").click(function(){
	   
   var yourname=$('#inputusername').val();
	var yourword=$('#inputpassword').val();
		
	$.ajax({
type:'post', //传送的方式,get/post
url:'<?php echo U("User/logincart");?>', //发送数据的地址
data:{username:yourname,password:yourword},
 dataType: "json",
success:function(data)
{if(data.status=="1"){alert(data.info);document.orderform.submit();}
else{alert(data.info);

}

},
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
});});
    </script>
        <hr/>
        <?php echo hook('documentDetailAfter',$info);?>
    </div>

 </div>
	<!-- /主体 -->

	<!-- 底部 -->
	
    <!-- 底部
    ================================================== -->
    <script type="text/javascript" src="/Public/static/bootstrap/js/ajaxcart.js"></script>
	<script>//购物车显示与隐藏
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
	<footer class="footer">
	<div class="container">
          <p style="height：30px;font-size:18px;color:#f0f"> 友情链接 :<a href="http://m.kuaidi100.com" target="_blank">快递查询</a> </p>
      </div>
      <div class="container">
          <p> 本站由 <strong><a href="http://www.ijquery.net/" target="_blank">yershop</a></strong> 强力驱动</p>
      </div>
    </footer>

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