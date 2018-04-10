<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function searchUser(){
		var f=$("#f");
        f.submit();
        window.location='query.jsp';
		//拼接年龄的字符串
        var strage ='';
        var optionagetype = $("#agetype").combobox('getValue');
        var minage = $("#age1").val();
        var maxage = $("#age2").val();
        if( optionagetype=="区间"){
	        if(minage!=''){
	        	strage = " age > "+minage+" ";
	        }
	        if(maxage!=''){
	        	if(strage!=''){
	        		strage = strage + "and age < "+maxage+"";
	        	}else{
	        		strage = strage +  " age < "+maxage+"";
	        	}
	        }
        }else{
        	if(minage!=''){
	        	strage = "age "+optionagetype+" "+minage+"";

	        }
        }
		
		
		$("#dg").datagrid('load',{ 
			"stuname":$("#stuname").val(),
			"subjectname":$("#subjectname").val(),
			"age":$("#age").val(),
			"conditional":strage
		});
	}
	$(function () {
		 $("#agetype").combobox({
	          onSelect: function () {
	              optionagetype = $("#agetype").combobox('getValue');
	              if (optionagetype == "区间") {
	            		$("#age2").show();
	              } else {
	            	  $("#age2").hide();
	             }
	         }    
		})
	});	
</script>
</head>
<body style="margin: 1px">
<div id="tb">
 <div>
 	<form action="student/query" id="f" method="get">
		 学生姓名：<input type="text" id="stuname" name="name" class="easyui-validatebox" />
		科目：<input type="text" id="subjectname" name="xueke" class="easyui-validatebox" />
		年龄：<!-- <input type="text" id="age" name="age" class="easyui-validatebox" /> -->
		    <select id="agetype"  name="agetype" class="easyui-combobox">
		       <option value=">">大于</option>
		       <option value="<">小于</option>
		       <option value="!=">不等于</option>
		       <option value="=">等于</option>
		       <option value="区间">区间</option>
		    </select>
		    <input type="hidden" value="0" name="conditional"/>
		    <input type="text" id="age1" name="age1" class="easyui-textbox"/>
		    <input type="text" id="age2" name="age2" style="display:none;" class="easyui-textbox"/>
	</form>
 	<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 </div>
</div>
<table id="dg" title="学生管理" class="easyui-datagrid"
  fitColumns="true" pagination="true" rownumbers="true"
  url="stuInfo/getstuinfos.action" fit="true" toolbar="#tb">
 <thead>
 	<tr>
 		<th field="cb" checkbox="true" align="center"></th>
 		<th field="stuname" width="80" align="center">学生名</th>
 		<th field="age" width="80" align="center">年龄</th>
 		<th field="subjectname" width="50" align="center">学科</th>
 		<th field="score" width="50" align="center">分数</th>
 		<th field="remark" width="100" align="center">备注</th>
 	</tr>
	<c:forEach items="${list }" var="student">
		<tr>
	 		<th field="cb" checkbox="true" align="center"></th>
	 		<th field="stuname" width="80" align="center">${student.name}</th>
	 		<th field="age" width="80" align="center">${student.age}</th>
	 		<th field="subjectname" width="50" align="center">${student.xueke }</th>
	 		<th field="score" width="50" align="center">${student.score }</th>
	 		<th field="remark" width="100" align="center">备注</th>
		</tr>
	</c:forEach>
 </thead>
</table>
<div>
版权所有
</div>
</body>
</html>