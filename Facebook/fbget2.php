<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Facebook</title>
	<link rel="stylesheet" type="text/css" href="" />
	<style type="text/css"></style>
	<script type="text/javascript" src=""></script>
</head>
<body>
	<?php

		$code = $_GET["code"];
		$redirect_uri = "http://www.fun4-play.com/Facebook/fbget2.php"; // 回调URL
		$client_secret = "a0050604e4793f55e1492125a29b040f"; // 应用密钥由Facebook获得
		$appId = "1892750304331640";
		// echo "code---:".$code."</br></br>";
		// 获取访问口令
		$url="https://graph.facebook.com/v2.9/oauth/access_token?client_id=".$appId."&redirect_uri=".$redirect_uri."&client_secret=".$client_secret."&code=".$code;
		// echo "url---".$url."</br>";
		$json = file_get_contents($url); // get请求

		// 这里改用curl会比file_get_contents好
		// $ch = curl_init();
		// curl_setopt ($ch, CURLOPT_URL, $url);
		// curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
		// curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT,10);
		// $json = curl_exec($ch);
		// curl_close($ch);

		// echo "json---".$json."</ br><hr />";

		$content = json_decode($json);
		// print_r($content);die;
		$token = $content->access_token; // 取得token
		// echo "token---".$token."</ br><hr />";

		// 生成应用访问口令
		$createTokenURL = "https://graph.facebook.com/debug_token?input_token=".$token."&access_token=".$appId."|".$client_secret;

		// 检查访问口令 取得验证数据
		$userInfo = file_get_contents($createTokenURL);
//		echo "userInfo---".$userInfo."</ br><hr />";
		// $ch = curl_init();
		// curl_setopt ($ch, CURLOPT_URL, $createTokenURL);
		// curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
		// curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT,10);
		// $userInfo = curl_exec($ch);
		// curl_close($ch);

		// 获取userID
		$user = json_decode($userInfo);
		$userID = $user->data->user_id;    //下面的写法比上面的好，上面的写法不符合php语法规范，会出现notice？waring提示提示
		// $userID = $user['data']['user_id'];
		// echo "userInfo---".$userID."</ br><hr />";

//		返回userID
		echo "<script>window.location.href=\"http://objc://jscallback:$userID\"</script>";

	?>
</body>
</html>
