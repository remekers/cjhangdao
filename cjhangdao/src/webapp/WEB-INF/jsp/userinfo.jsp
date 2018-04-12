<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
  <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome-ie7.min.css" />
  <![endif]-->
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
        <div class="radio"><label><input name="check" type="radio" class="ace" onclick="hide1()" value="油船"/><span class="lbl">油船</span></label></div>
        <div class="radio"><label><input name="check" type="radio" class="ace" onclick="display1()" value="供应商"/><span class="lbl">供应商</span></label></div>
      </li>
      <li id="ycxz" style="display:none"><label class="label_name">油船选择</label> 
       <select name="油船选择" size="1" id="yc_name">
       <option selected value="">--请选择--</option>
        <option value="长江号">长江号</option>
        <option value="南京号">南京号</option>
        <option value="飞天虎号">飞天虎号</option>
      </select></li>
      <li id="gys_name" style="display:none"><label class="label_name">供应商名称</label> 
      <select name="供应商名称" size="1" id="gys_name">
      <option selected value="">--请选择--</option>
        <option value="公司名称1">公司名称1</option>
        <option value="公司名称2">公司名称2</option>
        <option value="公司名称3">公司名称3</option>
      </select></li>  
     </ul>
     <div id="hao"></div>
     <div class="Remark"><label class="label_name">备注</label><textarea id="note" name="" cols="" rows="" style=" width:700px; height:100px; padding:5px;"></textarea></div>
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
      <tbody id="tbody">  
      </tbody>
     </table>
    </div>
  </div>
 </div>
 </div>
 <div id="page1"></div> 
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
 <script src="${pageContext.request.contextPath}/js/bootstrap-paginator.js" type="text/javascript"></script>
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
	 		$.get("${pageContext.request.contextPath}/cjhangdao/userinfo/add",
	 				{name:$("#name").val(),
	 				 password:$("#password").val(),
	 				role_id:$("#select_Roles").val(),
	 				phone:$("#phone").val(),
	 				username:$("#user_name").val(),
	 				status:$("#select_status").val(),
	 				usernature:$(':radio[name=check]:checked').val(),
	 				belongName1:$("#yc_name").val(),
	 				belongName2:$("#gyc_name").val(),
	 				note:$("#note").val(),
	 				},"json");
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
 
 $(function () {
     var carId = 1;
     var spath = "${pageContext.request.contextPath}/cjhangdao/userinfo/page";
     $.ajax({
         url: spath,
         datatype: 'json',
         type: "post",
         data: "pagesize=5",
         success: function (data) {  
        	 var listdata = eval("(" + data + ")").result;//得到集合数据
                PackagData(listdata);        	
                 var pageCount = eval("(" + data + ")").pagecount; //取到pageCount的值(把返回数据转成object类型)
                 var currentPage = eval("(" + data + ")").currenpage; //得到urrentPage
                 var options = {
                     bootstrapMajorVersion: 2, //版本
                     currentPage: currentPage, //当前页数
                     totalPages: pageCount, //总页数
                     itemTexts: function (type, page, current) {
                         switch (type) {
                             case "first":
                                 return "首页";
                             case "prev":
                                 return "上一页";
                             case "next":
                                 return "下一页";
                             case "last":
                                 return "末页";
                             case "page":
                                 return page;
                         }
                     },//点击事件，用于通过Ajax来刷新整个list列表
                     onPageClicked: function (event, originalEvent, type, page) {
                         var saddpath= "${pageContext.request.contextPath}/cjhangdao/userinfo/page";
                     	$.ajax({
                             url: saddpath,
                             type: "Post",
                             data: "pageindex=" + page,
                             success: function (data1) {
                             
                             	 var listdata2 = eval("(" + data1 + ")").result;
                                  PackagData(listdata2);
                                
                             }
                         });
                     }
                 };
                 $('#page1').bootstrapPaginator(options);
             }
         });
     });
    

    
function PackagData(res){	
     var content="";  
     for(var i=0;i<res.length;i++){  
         content+="<tr><td>";  
         content+=(i+1);  
         content+="</td><td>";  
         content+=res[i].username;  
         content+="</td><td>";  
         content+=res[i].role_id;  
         content+="</td><td>";  
         content+=res[i].name;  
         content+="</td><td>";
         content+=res[i].usernature;  
         content+="</td><td>"; 
         content+=res[i].status;  
         content+="</td><td>";  
         content+=res[i].phone;  
         content+="</td><td>";  
         content+=res[i].belongName; 
         content+="</td><td>";  
         content+=res[i].note; 
         content+="</td><td>";  
         content+="<button type=\"button\" class=\"btn btn-primary\" onclick=\"updateitem("+res[i].user_id+");\">修改</button> ";  
         content+="<button type=\"button\" class=\"btn btn-warning\" onclick=\"delitem("+res[i].user_id+");\">删除</button>";  
         content+="<button type=\"button\" class=\"btn btn-warning\" onclick=\"redpwd("+res[i].user_id+");\">重置密码</button>"; 
         content+="</td></tr>";             
     }  
     $("#tbody").html(content);  
}  
function  delitem(id){
	alert('是否删除')
	window.location.href="${pageContext.request.contextPath}/cjhangdao/userinfo/delete?user_id="+id
}
function redpwd(id){
	 layer.alert('确定重置！',{
         title: '提示框',				
		  icon:1,		
		  });
	$.get(
		"${pageContext.request.contextPath}/cjhangdao/userinfo/redpwd",
		{user_id:id},
		"json"
	); 		
}
function updateitem(id){
	   layer.open({
	        type: 1,
	        title: '修改用户',
			maxmin: true, 
			shadeClose: true, //点击遮罩关闭层
	        area : ['860px' , '400px'],
	        content:$('#Add_user_style'),		
			btn: ['修改','取消'],
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
		  		window.location.href="${pageContext.request.contextPath}/cjhangdao/userinfo/update?name="+$("#name").val()+
		  				"&userid="+id+
		  				"&password="+$("#password").val()+
		  				"&role_id="+$("#select_Roles").val()+
		  				"&phone="+$("#phone").val()+
		  				"&username="+$("#user_name").val()+
		 				"&status="+$("#select_status").val()+
		 				"&usernature="+$(':radio[name=check]:checked').val()+
		 				"&belongName1="+$("#yc_name").val()+
		 				"&belongName2="+$("#gyc_name").val()+
		 				"&note="+$("#note").val();
		 			layer.alert('修改成功！',{
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
}

</script>
</body>
</html>