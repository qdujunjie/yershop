<?php if (!defined('THINK_PATH')) exit();?><script src="Public/Admin/js/jquery.mousewheel.js" type="text/javascript"></script>
<script type="text/javascript">
$("div").remove(".search-form");
$("div").remove(".cf");
$("div").remove("#top-alert");
</script>
<div class="tools" style="margin-bottom:10px;">
   <a class="btn" href="<?php echo addons_url('OTcaiji://OTcaiji/caji');?>">采 集</a>
    <button class="btn ajax-post confirm" target-form="ids" url="<?php echo addons_url('OTcaiji://OTcaiji/delList');?>">删 除</button>
</div>

<table>
    <thead>
        <tr>
            <th class="row-selected row-selected"><input class="check-all" type="checkbox"></th>
            <th>序号</th>
            <th>标题</th>
            <th>来源</th>
            <th>采集时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
    <?php if(is_array($_list)): $i = 0; $__LIST__ = $_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$lv): $mod = ($i % 2 );++$i;?><tr>
            <td><input class="ids" type="checkbox" name="id[]" value="<?php echo ($lv["id"]); ?>"></td>
            <td><?php echo ($lv["id"]); ?></td>
            <td><a href="<?php echo ($lv["url"]); ?>" target="_blank"><?php echo ($lv["title"]); ?></a></td>
            <td><a href="<?php echo ($lv["sourceurl"]); ?>" target="_blank"><?php echo ($lv["source"]); ?></a></td>
            <td><?php echo (time_format($lv["create_time"])); ?></td>
            <td id="zt"><?php if($lv["zt"] == 1): ?><font color='#gde967'>未入库</font><?php else: ?><font color='red'>已入库</font><?php endif; ?></td>
            <td style="width: 120px;">
                <a href="<?php echo addons_url('OTcaiji://OTcaiji/add',array('id'=>$lv['id'],'cate_id'=>2,'model_id'=>2));?>" id="rk">[入库]</a>&nbsp;|&nbsp;
                <a href="<?php echo addons_url('OTcaiji://OTcaiji/delList',array('id'=>$lv['id']));?>">[删除]</a>
            </td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
</tbody>
</table>

<script type="text/javascript" src="/Public/static/uploadify/jquery.uploadify.min.js"></script>