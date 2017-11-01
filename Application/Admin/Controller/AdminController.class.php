<?php
/**
 * file: 后台管理员页面
 */

// 引入命名空间
namespace Admin\Controller;

use Common\Auth;

// 引入命名空间
class AdminController extends Controller{
    // 定义查询数据
    public $model = 'admin';


    // 显示进入首页 欢迎页
    public function login(){
        // 角色信息
        $roles = Auth::getUserRoles($this->user->id);
        $roles = empty($roles) ? ($this->user->id == 1 ? '超级管理员' : '普通用户') : implode(',', $roles); //判断是否超管登陆
//         p(session($this->_admin));
        $this->render('Admin/index', [
            'roles' => $roles,
            'users' => session($this->_admin),

        ]);
    }

    // 修改密码
    public function updatePassword(){
        // 接收参数
        $strOld  = post('oldPassword');  // 旧密码
        $strNew  = post('newPassword');  // 新密码
        $strTrue = post('truePassword'); // 确认密码
        // 验证数据不能为空
        if (IS_AJAX && $strOld && $strNew && $strTrue) {
            $this->arrError['msg'] = '密码强度太弱';
            $intLength = strlen($strNew);
            if ($intLength > 2 && $intLength < 16) {
                $this->arrError['msg'] = '没有修改密码或者确认密码错误';
                if ($strOld !== $strNew && $strNew === $strTrue) {
                    $this->arrError['msg'] = '修改用户不存在';
                    $model   = M('admin');
                    $arrUser = $model->field(['password'])->find($this->user->id);

                    // 用户存在
                    if ($arrUser) {
                        $this->arrError['msg'] = '原始密码错误';
                        if (sha1($strOld) === $arrUser['password']) {
                            $this->arrError['msg'] = '服务器繁忙, 请稍候再试...';
                            // 修改用户信息
                            if ($model->where(['id' => $this->user->id])->save(['password' => sha1($strNew)]))
                            {
                                $this->arrError = [
                                    'status' => 1,
                                    'msg'    => '修改密码成功',
                                    'data'   => $this->user,
                                ];
                            }
                        }
                    } else {
                        // 用户存在删除管理员信息
                        unset($_SESSION[$this->_admin]);
                        $this->arrError['status'] = 3;
                    }

                }
            }
        }

        $this->ajaxReturn();
    }

    // 首页显示
    public function index(){
        $this->render('Admin/admin', ['roles' => Auth::getUserRoles($this->user->id)]);
    }

    // 新增之前的处理
    public function beforeInsert(&$model){
        $model->roles       = post('roles') ? implode(',', post('roles')) : '';
        $model->password    = sha1($model->password);
        $model->create_time = $model->update_time = $model->last_time = time();
        $model->create_id   = $model->update_id   = $this->user->id;
        $model->last_ip     = get_client_ip();
        return true;
    }

    // 修改之前的处理 基类控制器update调用
    public function beforeUpdate(&$model){
        $model->roles = post('roles') ? implode(',', post('roles')) : '';
        if (empty($model->password))
            unset($model->password);
        else
           $model->password = sha1($model->password);
        return true;
    }

    // 修改之后的处理 基类控制器update调用
    public function afterSave($old, $new, $type){
        if (isset($new['face']) && ! empty($new['face'])) $_SESSION[$this->_admin]['face'] = $new['face'];
        return true;
    }

    // 上传图片之后的处理
    public function afterUpload($info){
        $path = '/Public/Uploads/'.$info['file']['savepath'].$info['file']['savename'];
        if (M('admin')->where(['id' => $this->user->id])->save(['face' => $path])) $_SESSION[$this->_admin]['face'] = $path;
        return true;
    }
}