<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
  <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
  <![endif]-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui-1.10.3.full.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
<title>用户管理</title>
</head>

<body>
<div class="page-content">
 <!--用户管理-->
 <div class="user_Manager_style">
 <form id="form1" name="form1" method="post" action="">
  <div class="Manager_style add_user_info">
    <div class="title_name">添加用户</div>
     <button class="btn btn-primary" type="button" id="Add_user_btn">添加用户</button>
     <div id="Add_user_style" style="display:none">
    <div class="add_user_style clearfix">
<!--    <div class="reset_style"><input name="reset" type="reset" value="重置" /class="btn btn-warning"> </div>-->
     <ul class="clearfix">
      <li><label class="label_name">登录用户名</label> <input name="登录用户名" type="text"  class="" id="name"/><i style="color:#F60; ">*</i></li>
      <li><label class="label_name">登录密码</label><input name="登录密码" type="password"  class="" id="password"/><i style="color:#F60; ">*</i></li>
      <li><label class="label_name">用户角色</label>
      <select name="用户角色" size="1" id="select_Roles" class="">
       <option selected value="">--请选择--</option>
        <option value="1">管理员</option>
        <option value="2">询价员</option>
        <option value="3">船名</option>
      </select>
      <i style="color:#F60; ">*</i>
      </li>
      <li><label class="label_name">手机号</label><input name="手机号" type="text"  class="" id="phone"/><i style="color:#F60; ">*</i></li>
      <li><label class="label_name">用户姓名</label><input name="用户姓名" type="text"  class="" id="user_name"/><i style="color:#F60; ">*</i></li>
      <li><label class="label_name">用户状态</label> 
          <select name="用户状态" size="1" id="select_status">
           <option selected value="">--请选择--</option>
        <option value="1">启用</option>
        <option value="2">停用</option>
      </select>
       <i style="color:#F60; ">*</i>
      </li>
      <li><label class="label_name">用户性质</label>
        <div class="radio"><label><input name="check" type="radio" class="ace" onclick="hide1()"/><span class="lbl">油船</span></label></div>
        <div class="radio"><label><input name="check" type="radio" class="ace" onclick="display1()"/><span class="lbl">供应商</span></label></div>
      </li>
      <li id="ycxz" style="display:none"><label class="label_name">油船选择</label> 
       <select name="油船选择" size="1" id="yc_name">
       <option selected value="">--请选择--</option>
        <option value="1">长江号</option>
        <option value="2">南京号</option>
        <option value="3">飞天虎号</option>
      </select></li>
      <li id="gys_name" style="display:none"><label class="label_name">供应商名称</label> 
      <select name="供应商名称" size="1" id="gys_name">
      <option selected value="">--请选择--</option>
        <option value="1">公司名称1</option>
        <option value="2">公司名称</option>
        <option value="3">公司名称</option>
      </select></li>  
     </ul>
     <div id="hao"></div>
     <div class="Remark"><label class="label_name">备注</label><textarea name="" cols="" rows="" style=" width:700px; height:100px; padding:5px;"></textarea></div>
    </div><!--onclick="return checkNull()"-->
    </div>
    </div>
     </form> 
      <div class="Manager_style">
    <div class="title_name">用户列表</div>
    <div class="Role_list">
     <table id="Role_list" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
      <thead>
       <tr>
		   <th width="60">序列号</th><th>用户名</th>
		   <th width="5%">角色名称</th><th>用户姓名</th>
		   <th>用户状态</th><th>用户性质</th>
		   <th>手机号</th><th>所属名称</th>
		   <th width="20%">备注</th><th>操作</th>
	   </tr>
      </thead>
      <tbody>
       <tr>
       <td width="60">1</td>
	   <td>YH23234</td>
       <td width="5%">超级管理员</td><td>张三</td>
       <td>启用</td><td></td>
       <td>13505140602</td><td></td>
	   <td >超级管理员没有用户性质和所属名称</td>
       <td class="User_Action_btn">      
        <button  type="button" class="btn btn-primary ">修改</button> 
        <button  type="button" class="btn btn-warning">删除</button>
        <button  type="button" class="btn btn-pink reset_Password">重置密码</button>
        </td>
        </tr>
        <tr>
       <td width="60">2</td>
       <td width="5%">YH232</td>
       <td>管理员</td><td>李四</td>
       <td>启用</td><td></td>
       <td>13505140602</td><td></td>
	   <td >管理员没有用户性质和所属名称</td>
       <td class="User_Action_btn">      
        <button  type="button" class="btn btn-primary ">修改</button> 
        <button  type="button" class="btn btn-warning">删除</button>
        <button  type="button" class="btn btn-pink reset_Password">重置密码</button>
        </td>
        </tr> 
        <tr>
       <td width="60">3</td>
       <td>YH232W</td>
       <td>报价员</td><td>李一</td>
       <td>启用</td><td>供应商</td>
       <td>13505140602</td><td>A供应商</td>
	   <td></td>
       <td class="User_Action_btn">      
        <button  type="button" class="btn btn-primary ">修改</button> 
        <button  type="button" class="btn btn-warning">删除</button>
        <button  type="button" class="btn btn-pink reset_Password">重置密码</button>
        </td>
        </tr>  
        <tr>
       <td width="60">4</td>
       <td>YH232Q</td>
       <td>用户</td><td>李二</td>
       <td>启用</td><td>油船</td>
       <td>13505140602</td><td>珊瑚号</td>
	   <td >备注</td>
       <td class="User_Action_btn">      
        <button  type="button" class="btn btn-primary ">修改</button> 
        <button  type="button" class="btn btn-warning">删除</button> 
         <button  type="button" class="btn btn-pink reset_Password">重置密码</button> 
        </td>
        </tr>   
      </tbody>
     </table>
    </div>
  </div>
 </div>
 </div>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->
    <!--[if !IE]> -->
    <script type="text/javascript">
        window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>
    <!-- <![endif]-->

    <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
	<script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/assets/layer/layer.js"></script>
<script type="text/javascript">
function hide1(){
document.getElementById('ycxz').style.display='';
document.getElementById('gys_name').style.display='none';
  
}
function display1(){
document.getElementById('ycxz').style.display='none';
document.getElementById('gys_name').style.display='';
} 
/***判断用户添加文本**/
 $('#Add_user_btn').on('click', function(){
	   layer.open({
        type: 1,
        title: '添加用户',
		maxmin: true, 
		shadeClose: true, //点击遮罩关闭层
        area : ['860px' , '400px'],
        content:$('#Add_user_style'),		
		btn: ['添加','取消'],
	    yes: function(index, layero){ 	 
		  if ($("#name").val()==""){
			  layer.alert('登录用户名不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }  
          if ($("#password").val()==""){
			  layer.alert('密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  
		   if ($("#select_Roles").val()==""){
			  layer.alert('用角色不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }   
		    
		   if ($("#phone").val()==""){
			  layer.alert('电话号码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }  
		   if ($("#user_name").val()==""){
			  layer.alert('用户名不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  
		  if ($("#select_status").val()==""){
			  layer.alert('用户状态能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }   
		 if(!$(':radio[name=check]:checked').length) {
              layer.alert('请选择用户性质!',{
                title: '提示框',				
				icon:0,				
          }); 
		   return false;
		   
             } 			  
	     else{			  
			 //ajaxtijiao 
/* 			$.get("",{keyword:sfvalue},function(data){
			,"json"); */
	    	 layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  }); 
			  layer.close(index);      
		  }	
     } 	, 
	 cancel: function(index){
		 
		   layer.alert('确定退出！',{
               title: '提示框',				
			  icon:1,		
			  });
		
	} 
    });
});
 $('.reset_Password').on('click', function(){
	 layer.confirm('是否重置密码，重置后原密码将失效？', {
  btn: ['重置','取消'] //按钮
}, function(){
  layer.msg('重置成功！', {time: 1000,icon: 1});
});

});
</script>
</body>
</html>