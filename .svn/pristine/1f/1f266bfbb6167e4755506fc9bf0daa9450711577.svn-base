<?php
/**
 * 权限类
 */

// 引入命名空间
namespace Admin\Controller;

// 引入命名空间
use Common\Auth;

class AuthController extends Controller
{
    // 定义查询数据
    public $model = 'auth_item';

    // 定义查询条件
    public function where($params)
    {
        return [
            'name' => 'like',
            'where' => ['type' => ['eq', 2]],
        ];
    }

    /** 修改数据
     *  权限curd逻辑验证
     * 1 不是管理要验证
     * 2 删除需要验证
     * 3 权限操作需要验证
     * desc: 管理员不验证, 角色操作不是删除不验证、其他一律验证
     */
    public function update(){
        if (IS_AJAX) {
            //接受参数
            $type = post('actionType');                //操作类型
            $canType = ['insert', 'update', 'delete'];    //可执行的操作类型
            $roleType = (int)get('type');                  //角色和权限类型 1:角色 2:权限
            $this->arrError['msg'] = "操作类型错误";
            // p("213");
            //判断操作类型
            if (in_array($type,$canType,true)) {
                //开始验证权限
                $this->arrError['msg'] = "抱歉！你没有执行权限";
                if (
                    $this->user->id == 1  ||// 超级管理员id是1 , 通过认证   $this->user是用户信息,在common/controller里面定义了
                    ($roleType === Auth::ROLE_TYPE && $canType !== 'delete') ||        //角色操作不验证， 删除除外
                    ($roleType === Auth::AUTH_TYPE && Auth::can($this->user->id, 'updateAuth')) ||     //权限操作需要验证
                    ($canType === 'delete' && Auth::can($this->user->id, $roleType === Auth::ROLE_TYPE ? 'deleteRole' : 'deleteAuth'))   // 删除权限
                   ) {
                    // 处理数据返回
                    $isTrue = Auth::handleItem($type, $roleType === Auth::ROLE_TYPE ? Auth::ROLE_TYPE : Auth::AUTH_TYPE, $this->user->id);
                    $this->arrError['msg'] = '服务器繁忙, 请稍候再试...';
                    if ($isTrue === true || is_numeric($isTrue)) {
                        $this->arrError = [
                            'status' => 1,
                            'msg'    => '操作成功!',
                            'data'   => $isTrue,
                        ];
                    }
                }
            }
        }
        $this->ajaxReturn();
    }
}