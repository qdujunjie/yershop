<?php if (!defined('THINK_PATH')) exit();?>﻿
<?php if(!empty($config['type'])){ ?>
<div class="login">
    <div class="legend">第三方账号登录</div>
    <div style="text-align:left;padding-top:25px;">
        <a class="" href="<?php if(in_array('Qq',$config['type'])){ echo addons_url('SyncLogin://Base/login',array('type'=>'qq'));} ?>"><img src="/Public/Home/images/qq.png">用QQ账号登录</a></br></br>
        <a class="" href="<?php if(in_array('Sina',$config['type'])){ echo addons_url('SyncLogin://Base/login',array('type'=>'sina'));} ?>"><img src="/Public/Home/images/weibo.png">用微博账号登录</a>
        <!--<a class="btn btn-warning btn-block" href="<?php if(in_array('Douban',$config['type'])){ echo addons_url('SyncLogin://Base/login',array('type'=>'duban'));} ?>">用豆瓣账号登录</a>
        <a class="btn btn-primary btn-block" href="<?php if(in_array('Renren',$config['type'])){ echo addons_url('SyncLogin://Base/login',array('type'=>'renren'));} ?>">用人人账号登录</a>-->
    </div>
</div>
<?php } ?>