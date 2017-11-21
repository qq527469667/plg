<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>后台管理系统</title>
    <meta name="description"    content="后台管理系统" />
    <meta name="author"         content="LaoW" />
    <meta name="keyword"        content="后台管理系统" />
    <meta name="renderer" content="webkit">
    <meta name="viewport"       content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- 加载CSS -->
    <link rel="stylesheet" href="/Public/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/Public/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="/Public/css/style.min.css" />
    <link rel="stylesheet" href="/Public/css/style-responsive.min.css" />
    <link rel="stylesheet" href="/Public/css/retina.css" />
    <link rel="stylesheet" href="/Public/css/jquery.datetimepicker.css" />
    <link rel="stylesheet" href="/Public/js/jcrop/jquery.Jcrop.min.css" />

    <!-- 判断IE的CSS -->
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link id="ie-style" href="css/ie.css" rel="stylesheet">
    <![endif]-->
    <!--[if IE 9]>
    <link id="ie9style" href="/Public/css/ie9.css" rel="stylesheet">
    <![endif]-->
    <script type="text/javascript" src="/Public/Admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/layer/layer.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/base.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/dataTable.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/validate.message.js"></script>
</head>
<body>

<div class="container-fluid-full">
	<div class="row-fluid">
		<div class="login-box">
			<h2>用户登录:</h2>
			<form class="form-horizontal login" name="login" action="#" method="post">
				<fieldset>
					<input class="input-large span12" name="username" id="username" type="text" placeholder="用户名" required="true" rangelength="[2,20]" />
					<input class="input-large span12" name="password" id="password" type="password" placeholder="密码" required="true" rangelength="[6,15]" />
	              <!--   <div class="form-group">
                    <label for="exampleInputCode">验证码</label>
                    <div class="row">
	                        <div class="col-md-8">
	                            <input type="text"  name="verify" class="form-control" id="exampleInputCode" placeholder="验证码">
	                        </div>
	                        <div class="col-md-4">
	                            <a href="javascript:void(0)"><img class="verify" src="<?php echo U('login/verify');?>" alt="点击刷新"/></a>
	                        </div>
	                    </div>
	                </div> -->
					<div class="clearfix"></div>
					<button type="submit" class="btn btn-primary span12">登录</button>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		// 登录验证
		$('.login').submit(function(){
			// 验证通过
			if ($(this).validate().form())
			{
				var intLoad = layer.load(2);		//加载层开
				// ajax请求登录
				$.ajax({
					"url": "<?php echo U('Index/login');?>",
					"type": "POST",
					"data": $(this).serialize(),
					"dataType": "json"
				}).always(function(){	//总是执行
					layer.close(intLoad);	//加载层关
				}).done(function(json) {	//成功执行
					layer.tips(json.msg, ".btn-primary", {tips: [3, (json.status == 1 ? "#78BA32" : "")], time:1000});
					if (json.status == 1) window.location.href = "<?php echo U('index/index');?>";
				}).fail(function(){		//失败执行
					layer.msg("服务器繁忙，请稍候再试...", {time:800})
				});
			}

			return false;
		});


		// 验证码
        // $(".verify").click(function(){
        //     var src = "<?php echo U('index/verify');?>";
        //     var random = Math.floor(Math.random()*(1000+1));
        //     $(this).attr("src",src+"&random="+random);

        // });
	});
</script>
</body>
</html>