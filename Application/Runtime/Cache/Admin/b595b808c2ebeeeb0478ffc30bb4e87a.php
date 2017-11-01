<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- 首页 -->
<html lang="zh_CN" style="overflow: hidden;">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="renderer" content="webkit">
    <meta charset="utf-8">
    <title>后台管理系统 </title>
    <meta name="description" content="This is page-header (.page-header &gt; h1)">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/main.css">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/font-awesome.min.css"  >
    <!--[if IE 7]>
    <link rel="stylesheet" href="/Public/Admin/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
    <![endif]-->
</head>
<body style="min-width:900px;" screen_capture_injected="true">
<div id="loading">
    <i class="loadingicon"></i><span>加载中...</span>
</div>
<div id="right_tools_wrapper">
    <span id="refresh_wrapper" title="加载页面"><i class="fa fa-refresh right_tool_icon"></i></span>
    <span id="toggle-fullscreen" title="全屏"><i class="fa fa-arrows-alt right_tool_icon"></i></span>
</div>
<!-- 顶栏 -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a href="<?php echo U('admin/index/index');?>" class="brand"> <small>
                我的管理后台
            </small>
            </a>
            <div class="pull-left nav_shortcuts" >
                <a id="main-menu-toggle" data-on="false" href="javascript:;" class="brand">
                    <i class="fa fa-reorder"></i>
                </a>
            </div>
            <ul class="nav simplewind-nav pull-right">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
<!--                         <?php if($users['face']): ?><img class="nav-user-photo" width="30" height="30" src="<?php echo ($users["face"]); ?>" alt="<?php echo ($users["username"]); ?>" />
                        <?php else: ?>
                            <img class="nav-user-photo" width="30" height="30" src="/Public/img/avatar.jpg" alt="<?php echo ($users["username"]); ?>"><?php endif; ?> -->
                        <span class="user-info">
						欢迎登录，<?php echo ($users["username"]); ?>
                        </span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
                       <!--  <li>
                            <a href="javascript:openapp('<?php echo U('admin/login');?>#message', 'my_info', '我的信息');">
                                <i class="fa fa-cog"></i> 我的信息
                            </a>
                        </li>
                        <li>
                            <a href="javascript:openapp('<?php echo U('admin/login');?>#info', 'update_password','修改密码');">
                                <i class="fa fa-user"></i> 修改密码
                            </a>
                        </li> -->
                        <li><a href="<?php echo U('index/logout');?>"><i class="fa fa-sign-out"></i> 退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- <?php print_r($menus); ?> -->
<div class="main-container container-fluid">

    <!-- 菜单类 -->
    <div class="sidebar" id="sidebar">
        <!-- <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        </div> -->
        <div id="nav_wraper">
            <ul class="nav nav-list" style="background: #383e4b;">
                <!-- 获取菜单 -->
                <?php if(is_array($menus)): foreach($menus as $key=>$value): ?><li style="background: #383e4b;">
                        <!-- 判断是否有子菜单 -->
                        <a <?php if((0 < count($value['child']))): ?>class="dropdown-toggle" href="#" <?php else: ?> href="javascript:openapp('<?php echo U($value['url']);?>', '<?php echo ($value["id"]); ?>', '<?php echo ($value["menu_name"]); ?>', true);"<?php endif; ?> >

                        <i class="<?php echo ($value["icons"]); ?> normal"></i>

                        <!-- 父菜单名字 -->
                        <span class="menu-text normal"><?php echo ($value["menu_name"]); ?></span>

                        <!-- 显示子菜单的数量 -->
                        <?php if((0 < count($value['child']))): ?><span class="label label-success"><?php echo (count($value["child"])); ?></span>
                            <b class="arrow fa fa-angle-right normal"></b>
                            <i class="fa fa-reply back"></i>
                            <span class="menu-text back">返回</span><?php endif; ?>

                        </a>


                        <!-- 子菜单生成 -->
                        <?php if((0 < count($value['child']))): ?><ul class="submenu" style="background: #383e4b;">
                                <?php if(is_array($value["child"])): foreach($value["child"] as $key=>$val): ?><li style="background: #383e4b;">

                                    <?php if((0 < count($val['child']))): ?><a class="submenu" id="menu-id<?php echo ($val["id"]); ?>" href="#">
                                            <i class="<?php echo ($val["icons"]); ?>"></i>
                                            <span class="menu-text"><?php echo ($val["menu_name"]); ?></span>
                                            <b class="arrow fa fa-angle-right"></b>
                                        </a>

                                        <ul class="submenu" id="menu<?php echo ($val["id"]); ?>" data-on="false">
                                            <?php if(is_array($val["child"])): foreach($val["child"] as $key=>$va): if((0 < count($va['child']))): ?><li style="background: #FFF;     margin-left: 10px;" class="menu-list" >


                                                    <a class="submenu morem" id="menu-id<?php echo ($va["id"]); ?>" href="#" data-id="<?php echo ($va["id"]); ?>" data-on="false" data-in="true">
                                                        <i class="<?php echo ($va["icons"]); ?>"></i>
                                                        <span class="menu-text"><?php echo ($va["menu_name"]); ?></span>
                                                        <b class="arrow fa fa-angle-right"></b>
                                                    </a>

                                                    <?php else: ?>
                                                        <li style="background: #FFF;     margin-left: 10px;">
                                                        <a class="submenu" href="javascript:openapp('<?php echo U($va['url']);?>', '<?php echo ($va['id']); ?>', '<?php echo ($va['menu_name']); ?>', true);">
                                                        <i class="icon-align-justify"></i>
                                                        <span class="menu-text"><?php echo ($va["menu_name"]); ?></span>
                                                        <b class="arrow fa fa-angle-right"></b>
                                                        </a><?php endif; ?>
                                                </li><?php endforeach; endif; ?>
                                        </ul>
                                        <!-- <?php $data = json_encode($val['child']) ?> -->
                                        <script type="text/javascript" src="/Public/Admin/js/jquery.min.js"></script>
                                        <script type="text/javascript">
                                            $("#menu-id<?php echo ($val["id"]); ?>").on('click', function() {
                                                var id = "menu<?php echo ($val["id"]); ?>";
                                                var thisN = $(this);
                                                // menuclose(thisN);

                                                if ($('#'+id).attr("data-on") == 'true') {
                                                    $('#'+id).hide(200);
                                                    $('#'+id).attr("data-on", "false");
                                                }else{
                                                    $('#'+id).show(200);
                                                    $('#'+id).attr("data-on", "true");
                                                };
                                            });
                                        </script>
                                    <?php else: ?>
                                        <a class="submenu" href="javascript:openapp('<?php echo U($val['url']);?>', '<?php echo ($val['id']); ?>', '<?php echo ($val['menu_name']); ?>', true);">
                                            <i class="<?php echo ($val["icons"]); ?>"></i>
                                            <span class="menu-text"><?php echo ($val["menu_name"]); ?></span>
                                            <b class="arrow fa fa-angle-right"></b>
                                        </a><?php endif; ?>

                                </li><?php endforeach; endif; ?>
                            </ul><?php endif; ?>
                    </li><?php endforeach; endif; ?>
            </ul>
        </div>
    </div>


    <!-- 内容展示 -->
    <div class="main-content" id="me-content">
        <div class="breadcrumbs" id="breadcrumbs">
            <a id="task-pre" class="task-changebt">
                <i class="fa fa-arrow-left back"></i>
            </a>
            <!-- 标签页 -->
            <div id="task-content">
                <ul class="macro-component-tab" id="task-content-inner">
                    <li class="macro-component-tabitem" app-id="0" app-url="<?php echo U('main/index');?>" app-name="首页">
                        <span class="macro-tabs-item-text">欢迎登录</span>
                        <a class="macro-component-tabclose" href="javascript:void(0)" title="点击关闭标签"><span></span><b class="macro-component-tabclose-icon">×</b></a>
                    </li>
                </ul>
                <div style="clear:both;"></div>
            </div>
            <a id="task-next" class="task-changebt">
                <i class="fa fa-arrow-right back"></i>
            </a>
        </div>

        <!-- 根据id content 追加内容 追加标签列表 -->
        <div class="page-content" id="content">
            <iframe src="<?php echo U('admin/admin/login');?>" style="width:100%; height: 100%;" frameborder="0" id="appiframe-0" class="appiframe"></iframe>
        </div>
    </div>
</div>
<script type="text/javascript" src="/Public/Admin/js/jquery.min.js"></script>
<script type="text/javascript" src="/Public/Admin/js/bootstrap.min.js"></script>
<script>

    // 点击全屏显示
    $("#toggle-fullscreen").click(function() {
        var c = $(this),
            b = document.documentElement;
        if (!c.hasClass("active")) {
            $("#thumbnails").addClass("modal-fullscreen");
            if (b.webkitRequestFullScreen) {
                b.webkitRequestFullScreen(window.Element.ALLOW_KEYBOARD_INPUT)
            } else {
                if (b.mozRequestFullScreen) {
                    b.mozRequestFullScreen()
                }
            }
        } else {
            $("#thumbnails").removeClass("modal-fullscreen");
            (document.webkitCancelFullScreen || document.mozCancelFullScreen || $.noop).apply(document)
        }
    });

    // 点击显示隐藏
    $("#main-menu-toggle").click(function(){
        if ($(this).attr("data-on") == "false") {
            $("#sidebar").css("display", "none");
            $("#me-content").css("margin-left", "0px");
            $(this).attr("data-on", "true");
        } else {
            $("#sidebar").css("display", "block");
            $("#me-content").css("margin-left", "190px");
            $(this).attr("data-on", "false");
        }

    });

    var ismenumin = $("#sidebar").hasClass("menu-min");
    // 菜单效果
    $(".nav-list").on( "click",function(event) {
        var closest_a = $(event.target).closest("a");
        if (!closest_a || closest_a.length == 0) {
            return
        }
        if (!closest_a.hasClass("dropdown-toggle")) {
            if (ismenumin && "click" == "tap" && closest_a.get(0).parentNode.parentNode == this) {
                var closest_a_menu_text = closest_a.find(".menu-text").get(0);
                if (event.target != closest_a_menu_text && !$.contains(closest_a_menu_text, event.target)) {
                    return false
                }
            }
            return
        }
        var closest_a_next = closest_a.next().get(0);
        if (!$(closest_a_next).is(":visible")) {
            var closest_ul = $(closest_a_next.parentNode).closest("ul");
            if (ismenumin && closest_ul.hasClass("nav-list")) {
                return
            }
            closest_ul.find("> .open > .submenu").each(function() {
                if (this != closest_a_next && !$(this.parentNode).hasClass("active")) {
                    $(this).slideUp(150).parent().removeClass("open")
                }
            });
        }
        if (ismenumin && $(closest_a_next.parentNode.parentNode).hasClass("nav-list")) {
            return false;
        }
        $(closest_a_next).slideToggle(150).parent().toggleClass("open");
        return false;
    });

    $task_content_inner = null;
    $mainiframe=null;
    var tabwidth=118;
    $loading=null;
    $nav_wraper=$("#nav_wraper");
    $(function () {
        $mainiframe=$("#mainiframe");
        $content=$("#content");
        $loading=$("#loading");
        var headerheight=86;
        $content.height($(window).height()-headerheight);
        $nav_wraper.height($(window).height()-45);
        $nav_wraper.css("overflow","auto");
        $(window).resize(function(){
            $nav_wraper.height($(window).height()-45);
            $content.height($(window).height()-headerheight);
            calcTaskitemsWidth();
        });
        $("#content iframe").load(function(){
            $loading.hide();
        });
        $task_content_inner = $("#task-content-inner");
        $("#searchMenuKeyWord").keyup(function () {
            var wd = $(this).val();
            var $tmp = $("<div></div>");
            if (wd != "") {
                $("#allmenus a:contains('" + wd + "')").each(
                    function () {
                        $clone = $(this).clone().prepend('<img src="/images/left/01/note.png">');
                        $clone.wrapAll('<div class="menuitemsbig"></div>').parent().attr("onclick", $clone.attr("onclick")).appendTo($tmp);
                    }
                );
                $("#searchedmenus").html($tmp.html());
                $("#searchedmenus").show();
                $("#allmenus").hide();
                $("#defaultstartmenu").hide();
                $("#allmenuslink .menu_item_linkbutton").html("返回");
                isAllDefault = false;
            }
        });

        $("#appbox  li .delete").click(function (e) {
            $(this).parent().remove();
            return false;
        });

        $(".apps_container li").on("click", function () {
            var app = '<li><span class="delete" style="display:inline">×</span><img src="" class="icon"><a href="#" class="title"></a></li>';
            var $app = $(app);
            $app.attr("data-appname", $(this).attr("data-appname"));
            $app.attr("data-appid", $(this).attr("data-appid"));
            $app.attr("data-appurl", $(this).attr("data-appurl"));
            $app.find(".icon").attr("src", $(this).attr("data-icon"));
            $app.find(".title").html($(this).attr("data-appname"));
            $app.appendTo("#appbox");
            $("#appbox  li .delete").off("click");
            $("#appbox  li .delete").click(function () {
                $(this).parent().remove();
                return false;
            });
        });

        ///
        $("#tdshortcutsmor1").click(function () {
            $(".window").hide();
        });

        $(".task-item").on("click", function () {
            var appid = $(this).attr("app-id");
            var $app = $('#' + appid);
            showTopWindow($app);
        });


        $(document).on('click', '#task-content-inner li', function(){
            openapp($(this).attr("app-url"), $(this).attr("app-id"), $(this).attr("app-name"));
            return false;
        });

        $(document).on('click', "#task-content-inner a.macro-component-tabclose", function () {
            closeapp($(this).parent());
            return false;
        });

        // 上一个
        $("#task-next").click(function () {
            var marginleft = $task_content_inner.css("margin-left");
            marginleft = marginleft.replace("px", "");
            var width = $("#task-content-inner li").length * tabwidth;
            var content_width = $("#task-content").width();
            var lesswidth = content_width - width;
            marginleft = marginleft - tabwidth <= lesswidth ? lesswidth : marginleft - tabwidth;
            $task_content_inner.stop();
            $task_content_inner.animate({ "margin-left": marginleft + "px" }, 300, 'swing');
        });

        // 下一个
        $("#task-pre").click(function () {
            var marginleft = $task_content_inner.css("margin-left");
            marginleft = parseInt(marginleft.replace("px", ""));
            marginleft = marginleft + tabwidth > 0 ? 0 : marginleft + tabwidth;
            $task_content_inner.stop();
            $task_content_inner.animate({ "margin-left": marginleft + "px" }, 300, 'swing');
        });

        $("#refresh_wrapper").click(function() {
            var $current_iframe = $("#content iframe:visible");
            $loading.show();
            $current_iframe[0].contentWindow.location.reload();
            return false;
        });

        calcTaskitemsWidth();
    });

    function calcTaskitemsWidth() {
        var width = $("#task-content-inner li").length * tabwidth;
        $("#task-content-inner").width(width);
        if (($(document).width()-268-tabwidth- 30 * 2) < width) {
            $("#task-content").width($(document).width() -268-tabwidth- 30 * 2);
            $("#task-next,#task-pre").show();
        } else {
            $("#task-next,#task-pre").hide();
            $("#task-content").width(width);
        }
    }

    function closeapp($this){
        if(!$this.is(".noclose")){
            $this.prev().click();
            $this.remove();
            $("#appiframe-"+$this.attr("app-id")).remove();
            calcTaskitemsWidth();
            $("#task-next").click();
        }
    }

    var task_item_tpl ='<li class="macro-component-tabitem">'+
        '<span class="macro-tabs-item-text"></span>'+
        '<a class="macro-component-tabclose" href="javascript:void(0)" title="点击关闭标签"><span></span><b class="macro-component-tabclose-icon">×</b></a>'+
        '</li>';
    var appiframe_tpl='<iframe style="width:100%;height: 100%;" frameborder="0" class="appiframe"></iframe>';
    function openapp(url, appid, appname, refresh)
    {
        var $app = $("#task-content-inner li[app-id='"+appid+"']");
        $("#task-content-inner .current").removeClass("current");
        if ($app.length == 0) {
            var task = $(task_item_tpl).attr("app-id", appid).attr("app-url",url).attr("app-name",appname).addClass("current");
            task.find(".macro-tabs-item-text").html(appname).attr("title",appname);
            $task_content_inner.append(task);
            $(".appiframe").hide();
            $loading.show();
            $appiframe=$(appiframe_tpl).attr("src",url).attr("id","appiframe-"+appid);
            $appiframe.appendTo("#content");
            $appiframe.load(function(){
                $loading.hide();
            });
            calcTaskitemsWidth();
        } else {
            $app.addClass("current");
            $(".appiframe").hide();
            var $iframe=$("#appiframe-"+appid);
            var src=$iframe.get(0).contentWindow.location.href;
            src=src.substr(src.indexOf("://")+3);
            if (refresh===true) {
                $loading.show();
                $iframe.attr("src", url);
                $iframe.load(function(){
                    $loading.hide();
                });
            }
            $iframe.show();
        }

        var itemoffset= $("#task-content-inner li[app-id='"+appid+"']").index()* tabwidth;
        var width = $("#task-content-inner li").length * tabwidth;
        var content_width = $("#task-content").width();
        var offset=itemoffset+tabwidth-content_width;
        var lesswidth = content_width - width;
        var marginleft = $task_content_inner.css("margin-left");
        marginleft =parseInt( marginleft.replace("px", "") );
        var copymarginleft=marginleft;
        if(offset>0){
            marginleft=marginleft>-offset?-offset:marginleft;
        }else{
            marginleft=itemoffset+marginleft>=0?marginleft:-itemoffset;
        }

        if(-itemoffset==marginleft){
            marginleft = marginleft + tabwidth > 0 ? 0 : marginleft + tabwidth;
        }

        if(content_width-copymarginleft-tabwidth==itemoffset){
            marginleft = marginleft - tabwidth <= lesswidth ? lesswidth : marginleft - tabwidth;
        }

        $task_content_inner.animate({ "margin-left": marginleft + "px" }, 300, 'swing');
    }


    $('.menu-list').on('click', '.morem', function() {
        var thisN = $(this);
        var menuid = $(this).attr('data-id');
        var data = {
            id : menuid
        }

        if ($(this).attr('data-on') == 'false') {
            // 获取子菜单信息
            $.post('getChild', data, function(data) {
                data = JSON.parse(data);
                var child = data.data;
                console.log(child);


                var html ='<ul class="submenu" id="menu'+menuid+'" data-on="false" style="display: block;">';
                for(var i = 0, length = child.length; i< length; i++){
                    console.log(child[i].child.length);
                    if (child[i].child.length >0) {
                        html +='<li style="background: #FFF;    margin-left: 10px; " class="menu-list">';
                        html +='<a class="submenu morem" id="menu-id'+child[i]['id']+'" href="#" data-id="'+child[i]['id']+'" data-on="false" data-in="true">';

                    }else{
                        html +='<li style="background: #FFF;     margin-left: 10px;">';
                        var url1 = "'"+child[i]['url']+"', '"+child[i]['id']+"', '"+child[i]['menu_name']+"'";
                        html +='<a class="submenu" href="javascript:openapp('+url1+', true);">';
                    };
                    html +='<i class="'+child[i]['icons']+'"></i>';
                    html +='<span class="menu-text">'+child[i]['menu_name']+'</span>';
                    html +='<b class="arrow fa fa-angle-right"></b>';
                    html +='</a>';
                    html +='</li>';
                }
                html +='</ul>';
                console.log(html);

                thisN.closest("li").append(html);
                $("#menu"+menuid).show(200);
                thisN.attr('data-on', 'ture');
            });

        }else{
            if ($(thisN).attr('data-in') == 'true') {
                $("#menu"+menuid).hide(200);
                $(thisN).attr('data-in', 'false');
                // menuclose(thisN);
            }else{
                $("#menu"+menuid).show(200);
                $(thisN).attr('data-in', 'true');
            };
        };

    });


    // function menuclose(thisN){
    //     var meneIsClose = 1;
    //     // while(meneIsClose){
    //         if (thisN.children("ul").attr('data-on') == 'true') {
    //             thisN = thisN.children("ul").attr("id");
    //             alert(thisN);
    //             $(thisN).hide(200);
    //             $(thisN).attr('data-in', 'false');
    //         };
    //         alert(thisN.closest('li').children("ul").attr('data-on'));
    //         // meneIsClose = 0;
    //     // }
    // }
</script>
</body>
</html>