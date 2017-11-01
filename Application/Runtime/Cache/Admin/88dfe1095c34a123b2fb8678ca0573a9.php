<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>后台管理系统</title>
    <meta name="description"    content="后台管理系统" />
    <meta name="author"         content="LaoW" />
    <meta name="keyword"        content="后台管理系统" />
    <meta name="viewport"       content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- 加载CSS -->
    <link rel="stylesheet" href="/Public/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/Public/css/style.min.css" />
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
    <script type="text/javascript" src="/Public/Admin/js/base.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/dataTable.js"></script>
</head>
<body>
<div class="row-fluid">
    <!-- start: 主要内容 -->
    <div id="content">
        <div class="row-fluid">
            <div class="box span12">
                <!--前面导航信息-->
<div class="box-header" data-original-title="">
    <h2><i class="icon-desktop"></i><span class="break"></span></h2>
    <div class="box-icon">
        <!-- <a title="导出" class="me-table-export"><i class="icon-download-alt"></i></a> -->
        <a title="添加" href="#" class="me-table-insert"><i class="icon-plus"></i></a>
        <a class="btn-minimize" title="隐藏" href="#"><i class="icon-chevron-up"></i></a>
    </div>
</div>
<div class="box-content">
    <!--表格数据-->
    <table class="table table-striped table-bordered table-hover" id="showTable"></table>
</div>
<script src="/Public/Admin/js/layer/layer.js"></script>
<script type="text/javascript">
    var choice = {'1' : 'A' , '2' : 'B' , '3' : 'C' , '4' : 'D'};
    var myTable = new MeTable({sTitle:"单选题编辑"},{
        "aoColumns":[
            {"data":"id", "title":"id", "sName":"id", "edit":{"type":"hidden"}, "search":{"type":"text"}},
            {"data":"title", "sName":"title","bSortable":false, "edit":{"type":"text","options":{"required":1,"rangelength":"[1, 255]"}}, "title":"题目"},
            {"data":"a_choice", "sName":"a_choice","bSortable":false, "edit":{"type":"text","options":{"required":1,"rangelength":"[1, 255]"}}, "title":"A选项"},
            {"data":"b_choice", "sName":"b_choice","bSortable":false, "edit":{"type":"text","options":{"required":1,"rangelength":"[1, 255]"}}, "title":"B选项"},
            {"data":"c_choice", "sName":"a_choice","bSortable":false, "edit":{"type":"text","options":{"required":1,"rangelength":"[1, 255]"}}, "title":"C选项"},
            {"data":"d_choice", "sName":"b_choice","bSortable":false, "edit":{"type":"text","options":{"required":1,"rangelength":"[1, 255]"}}, "title":"D选项"},
            {"data":"answer", "sName":"answer","bSortable":false, "title":"正确答案", "edit":{"type": "select", "default":1, "options":{"required":1, "number":1}}, "value":choice,"createdCell":function(td, data, rowdata, row, col){
                $(td).html(choice[data])
            } , "search":{"type":"select"}},
            {"data":"analysis", "sName":"analysis","bSortable":false, "edit":{"type":"textarea","options":{"required":1,"rangelength":"[1, 2000]"}}, "title":"答案解析"},
            {"data":"time", "sName":"time", "title":"修改时间", "bSortable":true,"createdCell":dateTimeString},
            {"data": null, "title":"操作", "bSortable":false, "createdCell":setOperate, "width":"120px"}
        ],

        // 设置隐藏和排序信息
        // "order":[[2, "desc"]],
        // "columnDefs":[{"targets":[2,3], "visible":false}],
    });

    // 显示之前
    // myTable.beforeShow = function(data, isData) {
    //     $(this.options.sFormId +' input[name=game_sign]').attr('readonly', this.actionType !== 'insert');
    //     $(this.options.sFormId +' select[name=origin_id]').attr('disabled', this.actionType !== 'insert');
    //     return true;
    // };

    $(function(){
        myTable.init();
    })


    $(".num-edit").on('click', function() {
        var data = {
            'num' : $("#num-edit").val()
        }
        $.post('numEdit.html', data, function(data) {
            data = JSON.parse(data);
            if (data.result == 1) {
                layer.msg(data.msg);
            }else{
                layer.msg(data.msg);
            };
        });
    });
</script>
            </div>
        </div>
    </div>
     <!--end: 主要内容 -->
</div>
<script type="text/javascript" src="/Public/Admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src='/Public/Admin/js/jquery.dataTables.min.js'></script>
<script type="text/javascript" src="/Public/Admin/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/Public/Admin/js/validate.message.js"></script>
<script type="text/javascript" src="/Public/Admin/js/layer/layer.js"></script>
<script type="text/javascript" >
    $(function(){
        $(".btn-minimize").click(function(c) {
            c.preventDefault();
            var b = $(this).parent().parent().next(".box-content");
            if (b.is(":visible")) {
                $("i", $(this)).removeClass("icon-chevron-up").addClass("icon-chevron-down")
            } else {
                $("i", $(this)).removeClass("icon-chevron-down").addClass("icon-chevron-up")
            }
            b.slideToggle()
        });

        // 隐藏内容
        $('.btn-close:first').click(function () {
            $('.main-menu li.active a').append('<span class="label">显示</span>').addClass('isShow').bind('click', function (e) {
                e.preventDefault();
                $('.row-fluid .box:first').fadeIn();
                $('.box:gt(0)').fadeOut();
                $(this).unbind('click').find('span:last').remove();
                return false;
            });
        });
    })
</script>
</body>
</html>