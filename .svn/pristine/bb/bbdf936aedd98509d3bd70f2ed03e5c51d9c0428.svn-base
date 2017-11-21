<?php
/**
 * file: 后台管理员页面
 */

// 引入命名空间
namespace Admin\Controller;

// 引入命名空间
use Common\Auth;

class ArticleController extends Controller{
    // 定义查询数据
    public $model = 'article';
    public function where($params)
    {
        // p(123);
        return [
            'id'    => 'eq',
            'title' => 'like',
            'where' => ['game_id' => ['eq', $_SESSION['game_id']]],
        ];
    }

    // 首页显示处理
    public function index(){
        $id = get('id');
        if ($id) {
            $_SESSION['game_id'] = $id;
        }else{
            $id = $_SESSION['game_id'];
        }
        $atype = M('articletype')->select();
        $atype = json_encode($atype);
        $this->assign(['atype' => $atype]);
        // 查询文章
        $this->display('index');
    }

    public function search_by_id(){
        $id = post('id');
        $data = M($this->model)->where(['id'=>$id])->find();

        $atype = M('articletype')->where(['id'=>$data['tid']])->find();

        // p($atype);
        $data['atype'] = $atype['title'];
        exit(json_encode(array('result' => 1, 'data' => $data)));
    }

    public function view(){
        $id = get('id');
        $data = M($this->model)->where(['id'=>$id])->find();

        $atype = M('articletype')->select();

        // p($atype);

        $this->assign(['data' => $data, 'atype' => $atype, 'is_top' => $data['is_top']]);
        $this->display('edit');
    }

    public function add(){
        $atype = M('articletype')->select();
        $this->assign(['atype' => $atype]);
        $this->display('add');
    }

    public function top(){
        $id = post('id');
        $data = M($this->model)->where(["id"=>$id])->find();
        if (empty($data['is_top'])) {
            $data['is_top'] = 1;
            M($this->model)->where(["id"=>$id])->save($data);
        exit(json_encode(array('result' => 1, 'data' => "置顶", 'msg' => "置顶成功")));
        }else{
            $data['is_top'] = 0;
            M($this->model)->where(["id"=>$id])->save($data);
        exit(json_encode(array('result' => 1, 'data' => "" , 'msg' => "取消置顶")));
        }
    }

    public function lamp(){
        $id = post('id');
        $data = M($this->model)->where(["id"=>$id])->find();
        if (empty($data['is_lamp'])) {
            $data['is_lamp'] = 1;
            M($this->model)->where(["id"=>$id])->save($data);
        exit(json_encode(array('result' => 1, 'data' => "常亮", 'msg' => "常亮成功")));
        }else{
            $data['is_lamp'] = 0;
            M($this->model)->where(["id"=>$id])->save($data);
        exit(json_encode(array('result' => 1, 'data' => "" , 'msg' => "取消常亮")));
        }
    }

    public function add_submit(){
        $id = post('id');
        $data['title'] = post('title');
        $data['author'] = post('author');
        $data['tid'] = post('tid');
        $data['keywords'] = post('keywords');
        $data['desc'] = post('desc');
        $data['is_top'] = post('is_top');
        $data['is_lamp'] = post('is_lamp');
        $data['priority'] = post('priority');
        $data['content'] = post('content');
        $data['createtime'] = $data['edittime'] = time();
        $data['game_id'] = $_SESSION['game_id'];
        $isTrue = M($this->model)->add($data);
        // p($data['content']);
        if ($isTrue) {
            $this->arrError = [
                'status' => 1,
                'msg'    => '恭喜你,操作成功',
            ];
            $this->ajaxReturn();
            // 失败

        }else{
            $this->arrError = [
                'status' => 0,
                'msg'    => '编辑失败',
            ];
            $this->ajaxReturn();
        }
    }
    public function edit_submit(){
        $id = post('id');
        $data['title'] = post('title');
        $data['author'] = post('author');
        $data['tid'] = post('tid');
        $data['keywords'] = post('keywords');
        $data['desc'] = post('desc');
        $data['is_top'] = post('is_top');
        $data['is_lamp'] = post('is_lamp');
        $data['priority'] = post('priority');
        $data['content'] = post('content');
        $data['edittime'] = time();

        $isTrue = M($this->model)->where(['id'=>$id])->save($data);
        // p($data['tid']);
        if ($isTrue) {
            $this->arrError = [
                'status' => 1,
                'msg'    => '恭喜你,操作成功',
            ];
            $this->ajaxReturn();
            // 失败

        }else{
            $this->arrError = [
                'status' => 0,
                'msg'    => '编辑失败',
            ];
            $this->ajaxReturn();
        }
    }
}