<?php
return [
    //设置允许访问列表
    'MODULE_ALLOW_LIST' => array('Admin','Home','Rest','MyCard'),
    'DEFAULT_MODULE'       =>    'Home',  // 默认模块

    // 'CONTROLLER_LEVEL'=>2,

	// 路由规则
    'URL_ROUTE_RULES' => [],
    'VAR_PAGE'        => 'page',                    // 分页信息提交参数
    // 前端资源配置
    'TMPL_PARSE_STRING' => [
        '__PUBLIC__'  => '/Public',                 // 更改默认的/Public 替换规则
        '__CSS__'     => '/Public/assets/css',      // css文件地址
        '__JS__'      => '/Public/assets/js',       // 增加新的JS类库路径替换规则
        '__UPLOAD__'  => '/Public/Uploads',         // 增加新的上传路径替换规则
        // '__STATIC__' => __ROOT__.'/Application/'.MODULE_NAME.'/View/' . '/Public/static'
    ],

    // 开启缓存技术  redis
    'DATA_CACHE_TYPE'   => 'redis',       //缓存类型
    'DATA_CACHE_PREFIX' => 'wx_',           //缓存标识前缀
    // 'DATA_CACHE_TIME'   => 30,               //缓存有效期


    // 数据库设置
    'DB_TYPE'               => 'mysql',                // 数据库类型
    'DB_HOST'               => '127.0.0.1',              // 服务器地址
    'DB_PORT'               => 3306,                   // 服务器端口
    'DB_NAME'               => 'plg',          // 数据库名
    'DB_USER'               => 'root',          // 用户名
    'DB_PWD'                => 'root',          // 密码
    'DB_PREFIX'             => 'my_',            // 数据库表前缀


    //邮件配置
    'MAIL_HOST' => 'smtp.exmail.qq.com',//smtp服务器的名称
    'MAIL_SMTPAUTH' =>TRUE, //启用smtp认证
    'MAIL_USERNAME' =>'no-reply@fun4-play.com',//你的邮箱名
    'MAIL_FROM' =>'no-reply@fun4-play.com',//发件人地址
    'MAIL_FROMNAME'=>'Fun4play',//发件人姓名
    'MAIL_PASSWORD' =>'Lcygame88',//邮箱密码
    'MAIL_CHARSET' =>'utf-8',//设置邮件编码
    'MAIL_ISHTML' =>TRUE, // 是否HTML格式邮件
];