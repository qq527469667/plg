<?php
namespace Admin\Controller;

use \Common\Auth;

/**
 * Class IndexController
 * @package Admin\Controller
 */
class IndexController extends \Common\Controller{

    // 初始化验证用户登录
    public function _initialize(){
        // $ip = $_SERVER["REMOTE_ADDR"];
        // if ($ip != "183.63.92.250") {
        //     echo "<script>window.location.href='http://www.fun4-play.com'</script>";
        //     exit;
        // }
    }

    // 显示登录页面
    public function index(){
        layout(false);
        // 判断是否已经登录 跳转到首页
        if ($this->isLogin()) {
            $this->assign([
                'menus' => Auth::getUserMenus(session($this->_admin.'.id')), //菜单信息
                'users' => session($this->_admin)           //用户信息,存入session
            ]);
            $strTemplate = 'Index/index';
        } else {
            $strTemplate = 'Layout/login';
        }
        // 显示页面
        $this->display($strTemplate);
    }

    // 开始登录
    public function login(){

        // 如果已经登录
        if ($this->isLogin()) {
            if (!IS_AJAX) $this->redirect('Index/index');
            $this->arrError['status'] = 1;
            $this->arrError['msg']    = '已经登录,正在为您跳转...';
        } else {
            // 判断是否有数据提交
            if (isset($_POST) && ! empty($_POST)) {
                // 创建模型对象
                $model  = M('admin');
                $isTrue = $model->validate([
                    ['username', 'require', '登录名不能为空', 1],
                    ['username', '/\S{2,12}/', '登录名需要为2到12个字符', 1],
                    ['password', 'require', '登录密码不能为空', 1],
                    ['password', '/\S{2,12}/', '登录密码需要为6到16个字符', 1],
                ])->create();
                $this->arrError['msg'] = $model->getError();
                if ($isTrue) {
                    // 查询数据是否存在
                    $admin    = $model->where([
                        'username' => $model->username,
                        'password' => sha1($model->password)
                    ])->find();
                    $this->arrError['msg'] = '登录账号或者密码错误!';
                    //判断是否登陆成功
                    if ($admin) {
                        // 更新最后登录时间位置
                        M('admin')->where(['id' => (int)$_SESSION['my_admin']['id']])->save([
                            'last_time' => time(),
                            'last_ip'   => get_client_ip(),
                        ]);
                        // 设置session
                        session('my_admin', $admin);
                        $this->arrError['status'] = 1;
                        $this->arrError['msg']    = '登录成功,正在为您跳转...';
                    }
                }
            }
        }

        $this->ajaxReturn();
    }

    public function getChild(){
        $id = post('id');
        $data = M('menu')->where(['status' => 1, 'pid' => $id])->order('sort')->select();
        foreach ($data as $key => $value) {
            $child = M('menu')->where(['status' => 1, 'pid' => $value['id']])->order('sort')->select();
            // if ($child) {
                $data[$key]['child'] = $child;
            // }
        }
        // p($data);
        exit(json_encode(array('result' => 1, 'data' => $data)));
    }

    // 退出登录
    public function logout(){
        // 查询用户数据
        if ($this->isLogin())
        {
            M('admin')->where(['id' => (int)$_SESSION['my_admin']['id']])->save([
                'last_time' => time(),
                'last_ip'   => get_client_ip(),
            ]);
        }

        // 清楚数据
        unset($_SESSION['my_admin']);
        $this->redirect('Index/index'); // 跳转到登录页
    }

    //验证码
    public function verify(){
        $Verify = new \Think\Verify();
        $Verify->codeSet = '0123456789';
        $Verify->fontSize = 13;
        $Verify->length = 4;
        $Verify->entry();
    }
}