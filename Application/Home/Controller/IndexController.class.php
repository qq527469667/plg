<?php

// 引入命名空间
namespace Home\Controller;

/**
 * Class IndexController
 * @package Home\Controller
 * desc: 首页控制器
 */

class IndexController extends \Think\Controller
{
    public $model = 'article';
    public function notice($game = 'renren')
    {
        $game_id = M('games')->where(['game_sign' => $game])->find();
        $game_id = $game_id['id'];

        $type = M('articletype')->select();


        foreach ($type as $k => $v) {
            $arr = M($this->model)->where(['game_id' => $game_id, 'tid' => $v['id']])->limit(5)->order('is_top desc, priority asc ')->select();
            // foreach ($arr as $key => $value) {
            //     $arr[$key]['atype'] = $v['title'];
            // }
            $arr['atype'] = $v['title'];
            $arr['tid'] = $v['id'];
            // foreach ($arr as $key => $value) {
            //     $arr[$key] = ;
            // }
            $data[$v['id']] = $arr;
        }

        // 综合查询
        $arr = M($this->model)->limit(5)->order('is_top desc, priority asc ')->select();
        foreach ($arr as $key => $value) {
            foreach ($type as $k => $v) {
                if ($value['tid'] == $v['id']) {
                    $arr[$key]['atype'] = $v['title'];
                }
            }
        }
        // p($data);
        $this->assign(['data' => $data, 'type'=>$type, 'zonghe' => $arr]);
        $this->display('notice');
    }

    public function index(){
        $this->display('index');
    }

    public function test(){
        $this->display('test');
    }
    public function test2(){

    }

    public function event_m(){
        $data['ip'] = $_SERVER["REMOTE_ADDR"];
        $data['time'] = time();
        $arr = M('plg_ydl')->add($data);
        $arr = M('plg_preview')->order('id desc')->find();
        $num = $arr['num'];
        $num1 = 7-strlen($num);
        for ($i=0; $i < $num1; $i++) {
            $num = "0".$num;
        }
        $this->assign(['num' => $num]);
        $this->display('event_m');
    }

    public function event(){
        $data['ip'] = $_SERVER["REMOTE_ADDR"];
        $data['time'] = time();
        $arr = M('plg_ydl')->add($data);
        $arr = M('plg_preview')->order('id desc')->find();
        $num = $arr['num'];
        $num1 = 8-strlen($num);
        for ($i=0; $i < $num1; $i++) {
            $num = "0".$num;
        }
        $this->assign(['num' => $num]);
        $this->display('event');
    }

    // 统计登陆人数的
    public function preview(){
        $data['mobile'] = post('mobile');
        $data['are'] =  post('are');
        if ($data['are'] == "1") {
            if (!empty($data['mobile'])) {
                if (!preg_match('/^([-_－—\s\(]?)([\(]?)((((0?)|((00)?))(((\s){0,2})|([-_－—\s]?)))|(([\)]?)[+]?))(886)?([\)]?)([-_－—\s]?)([\(]?)[0]?[1-9]{1}([-_－—\s\)]?)[1-9]{2}[-_－—]?[0-9]{3}[-_－—]?[0-9]{3}$/', $data['mobile'])) {
                    exit(json_encode(array('result'=>0, 'msg'=>'手機號碼錯誤')));
                }
            }else{
                exit(json_encode(array('result'=>0, 'msg'=>'手機號碼不能為空')));
            }
            $data['are'] =  "台灣";
        }else{
            if (!empty($data['mobile'])) {
                if (preg_match('/^((((0?)|((00)?))(((\s){0,2})|([-_－—\s]?)))|(([(]?)[+]?))(852)?([)]?)([-_－—\s]?)((2|3|5|6|9)?([-_－—\s]?)\d{3})(([-_－—\s]?)\d{4})$/', $data['mobile'])) {
                }else if(preg_match('/^((((0?)|((00)?))(((\s){0,2})|([-_－—\s]?)))|([+]?))(853)?([]?)([-_－—\s]?)(28[0-9]{2}|((6|8)[0-9]{3}))[-_－—\s]?[0-9]{4}$/', $data['mobile'])){
                }else{
                    exit(json_encode(array('result'=>0, 'msg'=>'手機號碼錯誤')));
                }
            }else{
                exit(json_encode(array('result'=>0, 'msg'=>'手機號碼不能為空')));
            }
            $data['are'] =  "香港";
        }


        $data['ip'] = $_SERVER["REMOTE_ADDR"];
        $data['time'] = time();
        $arr = M('plg_preview')->where(['mobile' => $data['mobile']])->find();
        if ($arr) {
            exit(json_encode(array('result'=>0, 'msg'=>'該號碼已被綁定')));
        }else{
            $arr = M('plg_preview')->order('id desc')->find();
            $data['num'] = $arr['num']+rand(1, 8);
            $arr = M('plg_preview')->add($data);
            if ($arr) {
                exit(json_encode(array('result'=>1)));
            }else{
                exit(json_encode(array('result'=>0, 'msg'=>'線路異常')));
            }
        }
    }
    public function home(){
        // 游戏标识 site
        // if ( empty(get('site')) ) {
        //    exit(json_encode( array("code" => 0 , "msg" => "参数错误") ));
        // }
        // $_SESSION['site'] = get('site');

        // // 服务器id
        // if ( empty(get('serverId')) ) {
        //    exit(json_encode( array("code" => 0 , "msg" => "参数错误") ));
        // }
        // $_SESSION['serverId'] = get('serverId');

        // // 服务器名字
        // if ( empty(get('serverName')) ) {
        //    exit(json_encode( array("code" => 0 , "msg" => "参数错误") ));
        // }
        // $_SESSION['serverName'] = get('serverName');

        // // 角色名字
        // if ( empty(get('userName')) ) {
        //    exit(json_encode( array("code" => 0 , "msg" => "参数错误") ));
        // }
        // $_SESSION['userName'] = get('userName');

        // // SDK账号id
        // if ( empty(get('accountId')) ) {
        //    exit(json_encode( array("code" => 0 , "msg" => "参数错误") ));
        // }
        // $_SESSION['accountId'] = get('accountId');



        // $this->assign([]);
        $this->display('home');
    }

    // public function xinyongka(){
    //     // print_r("type:");
    //     // p($_SESSION['type']);
    //     // // $this->display('home');
    // }

    public function dataSet(){
        $type = post('type');
        $_SESSION['type'] = $type;
        // 判断类型是否为空
        if (empty($type)) {
            exit(json_encode( array("code" => 0 , "msg" => "非法操作") ));
        }

        if ($type == "game") {
            // 游戏名字
            if ( empty(post('game_name')) ) {
               exit(json_encode( array("code" => 0 , "msg" => "游戏名字为空") ));
            }
            $_SESSION['game_name'] = post('game_name');

            // 服务器名字
            if ( empty(post('server_name'))) {
               exit(json_encode( array("code" => 0 , "msg" => "服务器名字为空") ));
            }
            $_SESSION['server_name'] = post('server_name');

            // 角色名字
            if ( empty(post('user_name'))) {
               exit(json_encode( array("code" => 0 , "msg" => "角色名字为空") ));
            }
            $_SESSION['user_name'] = post('user_name');

            exit(json_encode( array("code" => 1 , "msg" => "成功") ));
        }
    }

    public function mycard(){
        $url = "http://test.b2b.mycard520.com.tw/MyBillingPay/api/AuthGlobal";
        $key = '3AAF09D64D0D980B44430656115782E0';


        $data = array();

        $data['FacServiceId'] = 'klsodo';           //key id   mycard那边给的
        $data['FacTradeSeq'] = '201707060544061000611236';  //廠商自訂，每筆訂單編號不得重覆，為訂單資料 key 值
        $data['TradeType'] = '2';       //交易模式1:Android SDK (手遊適用) 2:WEB
        $data['ServerId'] = '10001';    //服务器id
        $data['CustomerId'] = '100057';    //SDK账号id
        // $data['PaymentType'] = '';    //SDK账号id
        // $data['ItemCode'] = '';            //商品id
        $data['ProductName'] = '60元宝';      //产品名称
        $data['Amount'] = '150';            //金额
        $data['Currency'] = 'TWD';          //货币类型
        $data['SandBoxMode'] = 'true';      //是否沙盒测试
        $data['Hash'] = $data['FacServiceId'] . $data['FacTradeSeq'] . $data['TradeType'] . $data['ServerId'] . $data['CustomerId'] . $data['PaymentType'] . $data['ItemCode'] . $data['ProductName'] . $data['Amount'] . $data['Currency'] . $data['SandBoxMode'] . $key;
        $data['Hash'] = urlencode($data['Hash']);

        $w1 = strpos($data['Hash'],"%");
        $w2 = strpos($data['Hash'],$data['Amount']);

        $hash = substr($data['Hash'], $w1, ($w2-$w1) );

        $data['Hash'] = str_replace($hash, strtolower($hash), $data['Hash']);
        $data['Hash'] = hash("sha256",$data['Hash']);
        // print_r($w1);
        // print_r($w2);die;
        // p($data);


        $curl = curl_init();

        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // post数据
        curl_setopt($curl, CURLOPT_POST, 1);
        // post的变量
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

        $data = curl_exec($curl);

        curl_close($curl);

        $data = json_decode($data, true);

        if ($data['ReturnCode'] == "1") {
            exit(json_encode( array("code" => 1 , "data" => $data) ));
        }else{
            exit(json_encode( array("code" => 0 , "data" => $data) ));
        }
        //打印获得的数据
        // print_r($output);
    }
}