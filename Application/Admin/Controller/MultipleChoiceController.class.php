<?php
/**
 * file: 后台管理员页面
 */

// 引入命名空间
namespace Admin\Controller;

// 引入命名空间
use Common\Auth;

class UnitChoiceController extends Controller{
    // 定义查询数据
    public $model = 'unit_choice';

    // 首页显示处理
    public function index(){
        // 查询单选题
        $this->display('index');
    }

    // 修改人数
    public function numEdit(){
        $data['num'] = post('num');


        $arr = M('plg_preview')->order('id desc')->find();

        $data = M('plg_preview')->where(['id' => $arr['id']])->save($data);
        if ($data) {
            exit(json_encode( array("result" => 1 , "msg" => "修改成功") ));
        }else{
            exit(json_encode( array("result" => 0 , "msg" => "网络异常") ));
        }
    }

}