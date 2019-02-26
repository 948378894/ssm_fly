<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>发表问题 编辑问题 公用</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="fly,layui,前端社区">
  <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/res/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/res/css/global.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/res/editor-md-master/css/editormd.css" />
  <script type="text/javascript" src="${ pageContext.request.contextPath }/res/js/jquery-2.1.4.min.js"></script>
  <script src="${pageContext.request.contextPath}/res/editor-md-master/editormd.min.js"></script>
	<style>
		.layui-form select {display:block;height:38px;width:100px}
	</style>
	<script>
$(function(){
  		
  		// 加载markdown组件
  		var testEditor = editormd({
            id: "test-editormd",
            height: 500,
            width: "100%",
            placeholder : "Markdown编辑器",
            path: "${pageContext.request.contextPath}/res/editor-md-master/lib/",
            toolbarIcons: function () {
                return ["undo", "redo", "|", "watch", "fullscreen", "preview"]
            },
            //toolbar  : false,             // 关闭工具栏
            codeFold: true,
            searchReplace: true,
            saveHTMLToTextarea: true,      // 保存 HTML 到 Textarea
            htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
            emoji: true,
            taskList: true,
            tocm: true,          // Using [TOCM]
            tex: true,                      // 开启科学公式 TeX 语言支持，默认关闭
            //previewCodeHighlight : false,  // 关闭预览窗口的代码高亮，默认开启
            flowChart: true,                // 疑似 Sea.js与 Raphael.js 有冲突，必须先加载 Raphael.js ，Editor.md 才能在 Sea.js 下正常进行；
            sequenceDiagram: true,          // 同上
            //dialogLockScreen : false,      // 设置弹出层对话框不锁屏，全局通用，默认为 true
            //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为 true
            //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为 true
            //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为 0.1
            //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为 #fff
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "{:url('api/uploader/uploadEditorImg?pic_type=10')}",
            onload: function () {
                this.on('paste', function () {
                    console.log(1);
                });
            },
            onpreviewing : function() {
                this.watch();
                console.log("onpreviewing =>", this, this.id, this.settings);
                // on previewing you can custom css .editormd-preview-active
            },
            onpreviewed : function() {
                console.log("onpreviewed =>", this, this.id, this.settings);
                this.unwatch();
            }
        });
  		
  		
  		/**
         * 上传图片
         */
        $("#test-editormd").on('paste', function (ev) {
            var data = ev.clipboardData;
            var items = (event.clipboardData || event.originalEvent.clipboardData).items;
            for (var index in items) {
                var item = items[index];
                if (item.kind === 'file') {
                    var blob = item.getAsFile();
                    var reader = new FileReader();
                    reader.onload = function (event) {
                        var base64 = event.target.result;
                        console.log(base64);
                        //ajax上传图片
                        $.ajax({
                            url : "${pageContext.request.contextPath}/article/uploadimg",
                            type : 'post',
                            data : {'base':base64},
                            async : true,
                            dataType: 'json',
                            success : function (res) {
                                if (res.code === 1) {
                                    //新一行的图片显示
                                    testEditor.insertValue("\n![" + "image.png" + "](${pageContext.request.contextPath}/" + res.path + ")");
                                }
                            },
                            error : function(){
                                alert('图片上传错误');
                            }
                        });
                    }; // data url!
                    var url = reader.readAsDataURL(blob);
                }
            }
        });

			$('select').eq(1).change(function(){
					if($(this).val()>${login_user.kissnum}){
						$('#feiwen_check_msg').html('您飞吻数不够!剩余:'+${login_user.kissnum}).css('color','red');	
				}else{
					$('#feiwen_check_msg').html('');
				}
				
			})
				// 表单提交验证
  		$('#release_form').submit(function(){
  			var kissnum = '${ login_user.kissnum }';
  			if($('#kissnum_sel').val() >  Number(kissnum)){
  				alert('您的飞吻数不足，请赚取更多飞吻');
  				return false;
  			}
  			if($('#topic_markdown_content').val() == null || $('#topic_markdown_content').val().trim() == ''){
  				alert('请填写一些内容再发布');
  				return false;
  			}
  		})

	}) 

	</script>


</head>
<body>

<div class="header">
  <div class="main">
    <a class="logo" style="background:url(${pageContext.request.contextPath}/res/images/sylg4.png) no-repeat;" href="http://www.sylu.edu.cn/sylusite/" title="沈阳理工大学官网">沈阳理工大学官网</a>
    <div class="nav">
      <a class="nav-this" href="${pageContext.request.contextPath }/go/index">
        <i class="iconfont icon-wenda"></i>问答
      </a>
      <a href="http://www.layui.com/" target="_blank">
        <i class="iconfont icon-ui"></i>框架
      </a>
    </div>
    
    <div class="nav-user">      
      <!-- 登入后的状态 -->
      
      <a class="avatar" href="${pageContext.request.contextPath }/go/home">
        <img src="${ pageContext.request.contextPath}/res/images/avatar/${login_user.head}">
        <cite>${login_user.nickname}</cite>
        <i>SVIP18</i>
      </a>
      <div class="nav">
        <a href="${pageContext.request.contextPath }/go/set"><i class="iconfont icon-shezhi"></i>设置</a>
        <a href="${ pageContext.request.contextPath}/go/logou"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退出</a>
      </div>
      
    </div>
  </div>
</div>

<div class="main layui-clear">
  <div class="fly-panel" pad20>
    <h2 class="page-title">发表问题</h2>
    
    <!-- <div class="fly-none">并无权限</div> -->

    <div class="layui-form layui-form-pane">
      <!--  -->
      <form id="release_form" action="${ pageContext.request.contextPath }/article/release" method="post">
        <div class="layui-form-item">

         
        	 <label for="L_title" class="layui-form-label">标题</label>
        
          <div class="layui-input-block">
          <c:if test="${editmap!=null }">
        	<input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input" value="${editmap.title }">
        </c:if>
        <c:if test="${editmap==null }">
            <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
         </c:if>
          </div>
        </div>
        <div class="layui-form-item layui-form-text">
          <!-- <div class="layui-input-block">
            <textarea id="L_content" name="content" required lay-verify="required" placeholder="请输入内容" class="layui-textarea fly-editor" style="height: 260px;"></textarea>
          </div> -->
          <div class="editormd" id="test-editormd">
    
        <c:if test="${editmap!=null }">
        	  <textarea class="editormd-markdown-textarea" name="topic_markdown_content" id = "topic_markdown_content" value="${editmap.markdown_content}">${editmap.markdown_content}</textarea>
        </c:if>
        
            <c:if test="${editmap==null }">
        	  <textarea class="editormd-markdown-textarea" name="topic_markdown_content" id = "topic_markdown_content">${topic.topic_markdown_content}</textarea>
        </c:if>
          </div>
          <label for="L_content" class="layui-form-label" style="top: -2px;">描述</label>
        </div>
        <div class="layui-form-item">
          <div class="layui-inline">
            <label class="layui-form-label">所在类别</label>
            <div class="layui-input-block">
            	<select lay-verify="required" name="typeid">
            		<!-- 加载类型信息 -->
            		 <c:if test="${editmap==null }">
        	 			<c:forEach items="${ typelist }" var="type">
	                	<option value="${ type.id }">${ type.typename }</option>
	                	</c:forEach>
       			 </c:if>
	                  <c:if test="${editmap!=null }">
	                	<option value="${ editmap.typeid }">${ editmap.typename }</option>
	                	
       			 </c:if>
	                
             	</select>
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">悬赏飞吻</label>
            <div class="layui-input-block">
            <c:if test="${editmap==null }">
              <select id="kissnum_sel" name="kiss">
                <option value="5" selected>5</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100</option>
              </select>
               </c:if>
               <c:if test="${editmap!=null }">
                <select id="kissnum_sel" name="kiss">
	                <option value="${editmap.paykiss }">${editmap.paykiss }</option> 
	                 </select> 	
       			 </c:if>
              
              
              <span id="kiss_check_msg"></span>
            </div>
          </div>
        </div>
        <!-- <div class="layui-form-item">
          <label for="L_vercode" class="layui-form-label">人类验证</label>
          <div class="layui-input-inline">
            <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
          </div>
          <div class="layui-form-mid">
            <span style="color: #c00;">1+1=?</span>
          </div>
        </div> -->
        <div class="layui-form-item">
          <button class="layui-btn">立即发布</button>
        </div>
        <input type="hidden" name="artid" value="${editmap.artid }">
      </form>
    </div>
  </div>
</div>


<div class="footer">
  <p><a href="http://fly.layui.com/">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/">layui.com</a></p>
  <p>
    <a href="http://fly.layui.com/auth/get" target="_blank">产品授权</a>
    <a href="http://fly.layui.com/jie/8157.html" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461.html" target="_blank">微信公众号</a>
  </p>
</div>
<script src="${ pageContext.request.contextPath }/res/layui/layui.js"></script>
</body>
</html>