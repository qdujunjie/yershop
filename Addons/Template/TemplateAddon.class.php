<?php

namespace Addons\Template;
use Common\Controller\Addon;

/**
 * 模版编辑插件插件
 * @author Marvin(柳英伟)
 */

    class TemplateAddon extends Addon{

        public $info = array(
            'name'=>'Template',
            'title'=>'模版管理',
            'description'=>'模版在线编辑插件',
            'status'=>1,
            'author'=>'Marvin(柳英伟)',
            'version'=>'1.0'
        );

        public $admin_list = array(
            'model'=>'addons',		//要查的表
			
        );
		public $custom_adminlist='Template.html';//后台显示页面
		

        public function install(){
			//获取模板路径写入配置文件
			$appName=APP_PATH;//项目名称
			$module=C('DEFAULT_MODULE') ;//默认模块名称
			$view=C('DEFAULT_V_LAYER');//默认视图文件名称
			$str='../../.'.$appName.$module.'/'.$view;
			$tpl_url=fopen("./Addons/Template/tpl_url.txt", "w"); 
			fwrite($tpl_url,$str);
			fclose($tpl_url);
			//添加钩子
			$Hooks = M("Hooks");
			$Template = array(array(
				'name' => 'Template',
				'description' => '模版管理插件钩子',
				'type' => 1,
				'update_time' => NOW_TIME,
				'addons' => 'Template'
			));
			$Hooks->addAll($Template,array(),true);
            return true;
        }

        public function uninstall(){
			//删除创建文件
			unlink("./Addons/Template/tpl_url.txt");
			//卸载钩子
			$Hooks = M("Hooks");
			$map['name']  = array('in','Template');
			$res = $Hooks->where($map)->delete();
			if($res == false){
				session('addons_install_error',$Hooks->getError());
				return false;
			}
            return true;
        }

        //实现的Template钩子方法
        public function Template($param){

        }

    }