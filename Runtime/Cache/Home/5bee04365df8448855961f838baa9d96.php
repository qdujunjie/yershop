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


<form action="<?php echo U("Search/index");?>" name="Searchform"  method="post" ><div class="header"><a href="https://www.docer.com/" class="logo" title="稻壳儿">www.docer.com</a><a href="http://www.docer.com/zhuanti/national.html?from=gif" class="gif_ad"><img src="http://www.docer.com/application/styles/images/gif_ad.gif" alt=""></a><div class="header_conter" style="display:" data-searchbar-value="" data-searchbar-radiovalue="所有" data-searchbar-readioselector="#searchRadio" data-searchbar-tags="" data-searchbar-saletype="0"><div class="search"><input type="text" name="words" placeholder="输入您想要的商品" class="search_input"><a rel="nofollow" href="javascript:vod(0)" class="search_btn"></a></div><div class="tag">热门搜索：
</form>
<?php if(is_array($hotsearch)): foreach($hotsearch as $key=>$vo): ?><a href="<?php echo U('Search/index?words='.$vo);?>"><?php echo ($vo); ?></a><?php endforeach; endif; ?>

</div></div><div class="top_right">
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

 
<div class="cartname">购物车</div>
<?php if(is_login()): if(empty($sqlcart)): ?><div class="shopcart_main_none"><div class="shopcart_main_none_img"></div><div class="shopcart_main_none_main"><p>你的购物车还是空的哦赶紧行动吧 6!</p><a rel="nofollow" href="<?php echo U("Index/index");?>">马上购物</a></div><div class="cb"></div></div><?php endif; ?>

<?php if(!empty($sqlcart)): ?><form action='<?php echo U("Shopcart/order");?>'method="post" name="myform" id="form">
<table  id="table" class="gridtable" width="100%">
        <thead>
            <tr><th class="row-selected">
					 <input class="checkbox check-all" checked="checked"type="checkbox">全选
					</th>
                <th >商品名</th>
                <th >价格</th>
                <th >数量</th>
                <th >操作</th>
            </tr>
        </thead>
        
        <tbody>
    
          <?php if(is_array($sqlcart)): $i = 0; $__LIST__ = $sqlcart;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr><td><input class="ids row-selected" checked="checked" type="checkbox" name="id[]" value="<?php echo ($vo["goodid"]); ?>"></td>
                <td><span class="img_1 img1"><A href="<?php echo U('Article/detail?id='.$vo['goodid']);?>" > <img src="<?php echo (get_cover(get_cover_id($vo["goodid"]),'path')); ?>"  width="70" height="70"/><span class="img_1_h"><?php echo (get_good_name($vo["goodid"])); ?></span></span> </A></td>
               
                <td align="center"><?php echo (get_good_price($vo["goodid"])); ?></td>
                <td ><a rel="jia"  class="jia" onclick="myfunction(event)">+</a><input type="text"  class="num"  id="<?php echo ($vo["goodid"]); ?>" name="num[]" value="<?php echo ($vo["num"]); ?>"/><a rel="jian" onclick="myfunction(event)" class="jian" id="oneA">-</a></td>
                
               <td><a  name="<?php echo ($vo["id"]); ?>" rel="del" onclick="myfunction(event)">删除</a>&nbsp;<a href="javascript:vod(0);" onclick="favor(<?php echo ($vo["id"]); ?>)">移到收藏</a></td>
            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        <tr>
   <td colspan="4">  <input class="checkbox check-all"checked="checked" type="checkbox">全选 <a  name="<?php echo ($vo["id"]); ?>" rel="del" onclick=delete(event)">删除选中的商品</a> <a  name="<?php echo ($vo["id"]); ?>" rel="del" href='<?php echo U("index/index");?>'>继续购物</a>    </td><td align="right">件数<span id="sum"> <?php echo ($sum); ?></span>件 </tr>
			  <tr><td colspan="5" align="right">种类：<span id="count"><?php echo ($count); ?></span>种</td>
			  <tr><td colspan="5" align="right">金额小计：<span id="total"><?php echo ($price); ?></span>元</td>
			</tr>
        </tbody>
      
    </table> 
      
  <div class="text" style="float:right">
 
总计（不含运费）：<em class="price" id="total"> <?php echo ($price); ?></em>元 <a class="btn_submit_pay"   href="javascript:void(0)" onclick="checklogin()" >去结算</a>
  </div>
  </form><?php endif; ?>
	<?php else: ?>
<?php if(empty($usercart)): ?><div class="shopcart_main_none"><div class="shopcart_main_none_img"></div><div class="shopcart_main_none_main"><p>你的购物车还是空的哦赶紧行动吧 !</p><a rel="nofollow" href="<?php echo U("Index/index");?>">马上购物</a></div><div class="cb"></div></div><?php endif; ?>

<?php if(!empty($usercart)): ?><form action='<?php echo U("Shopcart/order");?>'method="post" name="myform" id="form"><table  id="table" class="gridtable" width="100%">
        <thead>
            <tr><th class="row-selected">
					 <input class="checkbox check-all" type="checkbox" checked="">全选
					</th>
                <th >商品名</th>
                <th >价格</th>
                <th >数量</th>
                <th >操作</th>
            </tr>
        </thead>
      
        <tbody>
    
          <?php if(is_array($usercart)): foreach($usercart as $key=>$vo): ?><tr><td width="40"><input class="ids row-selected"  checked="" type="checkbox" name="id[]" value="<?php echo ($vo["id"]); ?>"></td>
                <td><span class="img_1 img1"><A href="<?php echo U('Article/detail?id='.$vo['id']);?>" > <img src="<?php echo (get_cover(get_cover_id($vo["id"]),'path')); ?>"  width="70" height="70"/><span class="img_1_h"><?php echo (get_good_name($vo["id"])); ?></span></span> </A></td>
               
                <td align="center"><?php echo ($vo["price"]); ?></td>
                <td ><a rel="jia"  class="jia" onclick="myfunction(event)">+</a><input type="text"  class="num"  id="<?php echo ($vo["id"]); ?>" value="<?php echo ($vo["num"]); ?>"/><a rel="jian" onclick="myfunction(event)" name="num[]" class="jian" id="oneA">-</a></td>
                
                <td><a  name="<?php echo ($vo["id"]); ?>" rel="del" onclick="myfunction(event)">删除</a>&nbsp;<a href="javascript:vod(0);" onclick="favor(<?php echo ($vo["id"]); ?>)">移到收藏</a></td>
            </tr><?php endforeach; endif; ?>
			<tr>
			  <td colspan="4">  <input class="checkbox check-all"  checked="" type="checkbox">全选 <a  name="<?php echo ($vo["id"]); ?>" rel="del" onclick=delete(event)">删除选中的商品</a> <a  name="<?php echo ($vo["id"]); ?>" rel="del" href="<?php echo U("index/index");?>">继续购物</a>    </td><td align="right">件数<span id="sum"> <?php echo ($sum); ?></span>件 </tr>
			  <tr><td colspan="5" align="right">种类：<span id="count"><?php echo ($count); ?></span>种</td>
			  <tr><td colspan="5" align="right">金额小计：<span id="total"><?php echo ($price); ?></span>元</td>
			</tr>
         
        
        </tbody>
      
    </table> 
  <div class="text" style="float:right">
 
总计（不含运费）：<em class="price" id="total"> <?php echo ($price); ?></em>元 <a class="btn_submit_pay"   href="javascript:void(0)" onclick="checklogin()" >去结算</a>
  </div> <input type="hidden" value="<?php echo ($uid); ?>" id="uid"/> 
 </form><?php endif; endif; ?>     
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
</script><!--[if lte IE 6]>
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
   
  
       <script type="text/javascript">
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
{ if(data.status=="1"){alert(data.info);window.location.reload();$("#uid").val(data.uid);}
else{alert(data.info);

}

},
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
});});
	   //全选的实现
	$(".check-all").click(function(){
		$(".ids").prop("checked", this.checked);
	});
	$(".ids").click(function(){
		var option = $(".ids");
		option.each(function(i){
			if(!this.checked){
				$(".check-all").prop("checked", false);
				return false;
			}else{
				$(".check-all").prop("checked", true);
			}
		});
	});
	var array=$(" #div2 li");
	//全选的实现 定义加、减、删的发送路径
	if(array.length!==4){
		var inc='<?php echo U("Shopcart/incNum");?>';
		var dec='<?php echo U("Shopcart/decNum");?>';
		var del='<?php echo U("Shopcart/delItem");?>';
	
	}
else{
		var inc='<?php echo U("Shopcart/incNumByuid");?>';
		var dec='<?php echo U("Shopcart/decNumByuid");?>';
		var del='<?php echo U("Shopcart/delItemByuid");?>';
	
	}

	function checklogin() {
		var uid=$("#uid").val();

		if(uid!==""){document.myform.submit();}
		else{
			showBg();
	
			}
		
		 }
function favor(id) { 
var uid=$("#uid").val();
if(uid!==""){
var favorid=id;
	$.ajax({
type:'post', //传送的方式,get/post
url:'<?php echo U("User/favor");?>', //发送数据的地址
data:{id:favorid},
 dataType: "json",
success:function(data){
	if(data.status=="1"){alert(data.msg);}
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
	   
	function myfunction(event) { 
event = event ? event : window.event; 
var obj = event.srcElement ? event.srcElement : event.target; 
//这时obj就是触发事件的对象，可以使用它的各个属性 
//还可以将obj转换成jquery对象，方便选用其他元素 
str = obj.innerHTML.replace(/<\/?[^>]*>/g,''); //去除HTML tag

	var $obj = $(obj);


	if(obj.rel=="jia"){
	var num=$obj.next().val(); 

var gid=$obj.next().attr("id");
	
 a=parseInt(num)+1;
 $obj.next().val(a); 
		$.ajax({
type:'post', //传送的方式,get/post
url:inc, //发送数据的地址
data:{id:gid},
 dataType: "json",
success:function(data)
{$("span#count").text(data.count);
$("span#total").text(data.price);
$("span#sum").text(data.sum);
	$("em.price").text(data.price);

},
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
		})}

if(obj.rel=="jian")
{ var num=$obj.prev().val(); 

var gid=$obj.prev().attr("id")	
    
     
    //如果文本框的值大于0才执行减去方法  
     if(num >0){  
      //并且当文本框的值为1的时候，减去后文本框直接清空值，不显示0  
      if(num==1)  
      { $("#oneA").addClass("important");
   return true;
      }  
      //否则就执行减减方法  
      else  
      { document.getElementById("oneA").disabled=false; 
      a=parseInt(num)-1;
	  
 $obj.prev().val(a);   
    
      } 
	  
    
     } 
	   
 


$.ajax({
type:'post', //传送的方式,get/post
url:dec, //发送数据的地址
data:{id:gid},
 dataType: "json",
success:function(data)
{$("span#count").text(data.count);
$("span#total").text(data.price);
$("span#sum").text(data.sum);
	$("em.price").text(data.price).fadeIn();

},
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
		})
}
if(obj.rel=="del")
{ var gid=obj.name;

$.ajax({
type:'post', //传送的方式,get/post
url:del, //发送数据的地址
data:{id:gid},
 dataType: "json",
success:function(data)
{var $obj = $(obj);
	$obj.parents("tr").empty();
	$("span#count").text(data.count);
$("span#total").text(data.price);
$("span#sum").text(data.sum);
	$("em.price").text(data.price);

},
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert(XMLHttpRequest+thrownError); }
		})
}


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