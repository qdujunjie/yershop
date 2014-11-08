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

 <div id="check">
<div class="mt">
				<h2>填写并核对订单信息</h2>
			</div>
<script type="text/javascript">

	$(document).ready(function(){

  $("#show").click(function(){
  $("#formsender").toggle();
  });
});
function savemsg() { 
if (document.getElementById("isdefault").checked==true) {
       var info="yes";
    }
    else {
      var info="no";
    }
	var p=$("#address").val();
	var oid=$("#orderid").val();
	var real=$("#realname").val();
	var ph=$("#phone").val();
	var b=$("#youbian").val();
	
	$.ajax({
type:'post', //传送的方式,get/post
url:'<?php echo U("Shopcart/savemsg");?>', //发送数据的地址
data:{posi:p,pho:ph,rel:real,id:oid,msg:info},
 dataType: "json",
success:function(data)
{
if (data.msg=="yes") {
     $("#f_default").remove();var str='<p id="f_default"><input type="radio" name="sender" value="'+data.addressid+'" id="default" checked="checked"/>收件人：'+data.realname+'&nbsp;联系电话：'+data.cellphone+'&nbsp;'+'&nbsp;收货地址：'+data.address+'</p>';
    $("#senderdetail").append(str);}
else{
var str='<p><input type="radio" id="new" name="sender" value="'+data.addressid+'" checked="checked"/>收件人：'+data.realname+'&nbsp;联系电话：'+data.cellphone+'&nbsp;'+'&nbsp;收货地址：'+data.address+'</p>';
 $("#senderdetail").append(str);}

 $("#formsender").toggle();
},
error:function (event, XMLHttpRequest, ajaxOptions, thrownError) {
alert("表单错误，"+XMLHttpRequest+thrownError); }
		})
	 }
function makeorder() {
	//判断默认地址是否选中,获取地址id
   if (document.getElementById("default").checked==true) {
      document.getElementById("senderid").value=document.getElementById("default").value;
	  document.myform.submit();
    }
	//判断新地址是否选中,获取地址id
	if(document.getElementById("new").checked==true){
		
		document.getElementById("senderid").value=$("#new:checked").val();
	  document.myform.submit();
		
		}

		 }
</script>

<script type="text/javascript">  
$(document).ready(function(){  
  
  $("input#code").keyup(function(){  
  var str=$("input#code").val();
if(str!==""){
    $.ajax({
type:'post',
url:'<?php echo U("User/checkcode");?>', //发送数据的地址//
data:{couponid:str},
 dataType: "json",
success:function(data)
{if(data.msg=="yes"){
	$("span.tips").html(data.info);
}
else{document.getElementById("code").value="";
	$("span.tips").html(data.info);



}
} 
});//ajax结束

}//if结束
});  
});  
</script>  

      <div class="orderplace">
     

<div class="o_title"> <h2>收货人信息 <?php if(empty($uid)): else: ?><span><a href="javascript:vod(0);" id="show">新增</a></span><?php endif; ?></h2> </div> 
                     <div id="formwarp" class="place"> 
                     
                     
  <?php if(empty($address)): ?><div id="senderdetail"></div>
  
                       <div id="formsender" >
    <form id="form" name="form" >  
      <dl>        <dt>详细地址：</dt>  <dd><input type="text" class="cart_n_long" id="address" maxlength="40" data-input="text" value="" name="area"><font class="ml10 cleb6100" style="display: none;">详细地址不能为空</font></dd>        </dl>
          <dl>              <dt><span>*</span>收 货 人：</dt>              <dd><input type="text" class="cart_n_short" id="realname" maxlength="20" data-input="text" value=""><font class="ml10 cleb6100" style="display: none;">收货人不能为空</font></dd>        </dl>        <dl>              <dt><span>*</span>手&nbsp;&nbsp;&nbsp;&nbsp;机：</dt>              <dd><input type="text" class="cart_n_short" id="phone" maxlength="11" data-msg="收货手机号码格式不正确" data-input="text" data-type="cellphone" value="">&nbsp;用于接收发货通知及送货前确认</dd>        </dl>     
             <dl>                  <dd><input id="isdefault" checked="checked"  name="default" type="checkbox" class="cart_n_box">设为默认地址</dd>        </dl>      
             
               <dl>              <dt>&nbsp;</dt>              <dd><a href="javascript:void(0)" class="ncart_btn_on" onclick="savemsg();">保存</a></dd>        </dl>    
 </form></div>
                        <?php else: ?>
                        
                        
 <div id="senderdetail">
 <p id="f_default"><input type="radio" id="default" name="sender" checked="checked" value="<?php echo (get_addressid($uid)); ?>" />&nbsp;收件人：<?php echo (get_realname($uid)); ?>&nbsp;&nbsp;联系电话:<?php echo (get_cellphone($uid)); ?>&nbsp;&nbsp;收货地址：<?php echo (get_address($uid)); ?>  </p>
 
 </div>
                            <div id="formsender" style="display:none">
    <form id="form" name="form" >  
      <dl>        <dt>详细地址：</dt>  <dd><input type="text" class="cart_n_long" id="address" maxlength="40" data-input="text" value="" name="area"><font class="ml10 cleb6100" style="display: none;">详细地址不能为空</font></dd>        </dl>
          <dl>              <dt><span>*</span>收 货 人：</dt>              <dd><input type="text" class="cart_n_short" id="realname" maxlength="20" data-input="text" value=""><font class="ml10 cleb6100" style="display: none;">收货人不能为空</font></dd>        </dl>        <dl>              <dt><span>*</span>手&nbsp;&nbsp;&nbsp;&nbsp;机：</dt>              <dd><input type="text" class="cart_n_short" id="phone" maxlength="11" data-msg="收货手机号码格式不正确" data-input="text" data-type="cellphone" value="">&nbsp;用于接收发货通知及送货前确认</dd>        </dl>     
             <dl>                  <dd><input id="default" checked="checked"  name="default" type="checkbox" class="cart_n_box">设为默认地址</dd>        </dl>      
             
               <dl>              <dt>&nbsp;</dt>              <dd><a href="javascript:void(0)" class="ncart_btn_on" onclick="savemsg();">保存</a></dd>        </dl>    
 </form></div><?php endif; ?>

    
   
    
    
    </div>  </div>     <!--收货信息 结束-->          
               <!--订单支付 开始-->   
              <form action='<?php echo U("Shopcart/makeorder");?>' method="post" name="myform" id="myform">   <div class="orderplace">             <div class="o_title">     <h2>支付</h2> </div>           
                   <div id="formwarp">   <dl>                              <dt>支付方式：</dt>        <dd>                                  <input type="hidden" name="orderid"  id="orderid" value="<?php echo ($orderid); ?>">  
                    <input type="hidden" name="sender"  id="senderid" >      
                   
                       <input type="radio" name="PayType" id="huo" checked="checked" value="1">货到付款                 <input type="radio" name="PayType" id="pay"  value="2">在线支付                                                                                                 </dd>                        </dl>                                        
              </div>    </div>         <!--订单支付 结束-->  
			  
			   <!--优惠券开始-->   
                <div class="orderplace">             <div class="o_title">     <h2>优惠券</h2> </div>           
                   <div id="formwarp">   <dl>                              <dt>请输入优惠券代码：</dt>        <dd>                                   
                   
                       <input type="text" name="couponcode" id="code" >   <span class="red tips"></span>                                                                                                 </dd>                        </dl>                                        
              </div>    </div>         <!--优惠券结束-->   
			  
			  
			  <!--商品信息 开始-->    
              
               <div class="orderplace">   <div class="o_title">  <h2>商品信息</h2></div>                                   <table border="0" cellspacing="0" cellpadding="0"  class="gridtable" width="100%">  <tbody><tr class="com_list_tit">        <th>商品名称</th>      <th>净重</th>    <th>单价(元)</th> <th>数量</th>   </tr>   <?php if(is_array($shoplist)): $i = 0; $__LIST__ = $shoplist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                <td><A href="<?php echo U('Article/detail?id='.$vo['goodid']);?>" > <img src="<?php echo (get_cover(get_cover_id($vo["goodid"]),'path')); ?>"  width="70" height="70"/><?php echo (get_good_name($vo["goodid"])); ?></A></td>
               <td align="center"> <span class="weight"><?php echo (get_weight($vo["goodid"])); ?></span>g</td>
                <td align="center"><?php echo (get_good_price($vo["goodid"])); ?></td>
                 <td align="center"><?php echo ($vo["num"]); ?></td>
                 
            </tr><?php endforeach; endif; else: echo "" ;endif; ?>                    </tbody></table>                     </div>            <!--商品信息 结束-->   
                   <!--发票信息 开始-->         <div class="orderplace fapiao">
                  <h2> 发票信息</h2>   
                  <p>发票信息：不需要发票</p>   
                    <p>很抱歉，近期我们暂时不能提供发票。请联系4008-000-917申请，我们将尽快为您补寄。                              </p>                       
 </div>             
                   <!--发票信息 结束-->            <!--提交信息 开始-->           
                    <div class="orderplace trans"> 
                      <p><b ><?php echo ($allnum); ?></b>件商品</p>     
                     <p>商品金额<b><?php echo ($total); ?></b>元 </p>                     
                       <p>运费<b ><?php echo ($trans); ?></b>元</p>
                       <p><input type="checkbox" name="score" id="huo" value="<?php echo (get_score($uid)); ?>"> <b class="red" ><strong>积分<?php echo (get_score($uid)); ?>，可兑换成<?php echo ($ratio); ?>元</strong></b></p>
                          <p class="jiesuan">应付总额 <span id="TotalNeedPay" class="red">￥<?php echo ($all); ?></span>元 <a class="btn_submit_pay"   onclick="makeorder()" >提交订单</a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>            <!--提交信息 结束-->              

   
</div>   </form> 
    <script type="text/javascript">_init_area();</script>
        <hr/>
        <?php echo hook('documentDetailAfter',$info);?>
   

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