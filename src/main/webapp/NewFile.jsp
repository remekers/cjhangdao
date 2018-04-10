<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="static/jquery-3.1.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<table border="1px black"  id="table1">
    <tr>
        <th>品牌</th>
        <th>车型</th>
        <th>性别</th>
        <th>配额数</th>
        <th>完成数</th>
        <th>完成数</th>
    </tr>
    <tr>
        <td>宝马</td>
        <td>3系</td>
        <td>男</td>
        <td>200</td>
        <td>100</td>
        <td>100</td>
    </tr>
    <tr>
        <td>宝马</td>
        <td>3系</td>
        <td>女</td>
        <td>100</td>
        <td>57</td>
        <td>57</td>
    </tr>
    <tr>
        <td>宝马</td>
        <td>5系</td>
        <td>男</td>
        <td>100</td>
        <td>68</td>
        <td>68</td>
    </tr>
    <tr>
        <td>宝马</td>
        <td>5系</td>
        <td>女</td>
        <td>200</td>
        <td>94</td>
        <td>94</td>
    </tr>
    <tr>
        <td >宝马</td>
        <td>7系</td>
        <td>男</td>
        <td>100</td>
        <td>68</td>
        <td>68</td>
    </tr>
    <tr>
        <td>宝马</td>
        <td>7系</td>
        <td>女</td>
        <td>100</td>
        <td>68</td>
        <td>68</td>
    </tr>
        <tr>
        <td>宝马</td>
        <td>7系</td>
        <td>男</td>
        <td>100</td>
        <td>68</td>
        <td>68</td>
    </tr>
        <tr>
        <td>宝</td>
        <td>7系</td>
        <td>女</td>
        <td>100</td>
        <td>68</td>
        <td>68</td>
    </tr>   
</table>
</body>
</html>
<script>
    jQuery.fn.rowspan = function(colIdx) { //封装的一个JQuery小插件
        return this.each(function(){
            var that;
            $('tr', this).each(function(row) {
                $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
                    if (that!=null && $(this).html() == $(that).html()) {
                        rowspan = $(that).attr("rowSpan");
                        if (rowspan == undefined) {
                            $(that).attr("rowSpan",1);
                            rowspan = $(that).attr("rowSpan"); }
                        rowspan = Number(rowspan)+1;
                        $(that).attr("rowSpan",rowspan);
                        $(this).hide();
                    } else {
                        that = this;
                    }
                });
            });
        });
    }
    $(function() {
        $("#table1").rowspan(0);//传入的参数是对应的列数从0开始
        $("#table1").rowspan(3)
    });
</script>