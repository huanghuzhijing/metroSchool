<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
	<head>
		<title>菜单栏相关设置</title>
	</head>

	<body>
	<center> 
	 
		菜单栏显示风格： 
		<table>
			<tr>
				<td>
					背景颜色：
					<input style="" name="backcolor">
				</td>
			</tr>
			<tr>
				<td>
					按钮颜色：
					<input style="" name="menucolor">
				</td>
			</tr>
			<tr>
				<td>
					按钮边框色：
					<input style="" name="framecolor">
				</td>
			</tr>
			<tr>
				<td>
					显示风格：
					<select name="showstyle">
						<option value="0">平坦风格</option>
						<option value="1">水平填充1</option>
						<option value="2">水平填充2</option>
						<option value="3">垂直填充1</option>
						<option value="4">垂直填充2</option>
						<option value="5">中间填充</option>
						
					</select>
				</td>
				<td>
					按钮风格：
					<select name="buttonstyle">
						<option value="0">系统亮度显示</option>
						<option value="1">凸起显示</option>
						<option value="2">凹陷显示</option>
						<option value="3">平坦风格</option>
						<option value="4">水平填充1</option>
						<option value="5">水平填充2</option>
						<option value="6">垂直填充1</option>
						<option value="7">垂直填充2</option>
						<option value="8">中间填充</option>
						
					</select>
				</td>
			</tr>
		</table>
		-------------------------------------------------------------------------
		<br>
		  设置需要显示的菜单
		  <table>
		    <tr>
		      <td><input type="checkbox" name="tool">工具菜单&nbsp&nbsp&nbsp</td>
		      <td>&nbsp&nbsp&nbsp<input type="checkbox" name="helpe">帮助菜单</td>
		    </tr>
		    <tr>
		      <td><input type="checkbox" name="insert">插入菜单&nbsp&nbsp&nbsp</td>
		      <td>&nbsp&nbsp&nbsp<input type="checkbox" name="edit">编辑菜单</td>
		    </tr>
		  </table>
		  -------------------------------------------------------------------------
		<br>
		 设置允许用户使用的文件菜单项
		  <table>
		    <tr>
		      <td><input type="checkbox" name="new">新建&nbsp&nbsp&nbsp</td>
		      <td>&nbsp&nbsp&nbsp<input type="checkbox" name="open">打开</td>
		    </tr>
		    <tr>
		      <td><input type="checkbox" name="close">关闭&nbsp&nbsp&nbsp</td>
		      <td>&nbsp&nbsp&nbsp<input type="checkbox" name="save">保存</td>
		    </tr>
		    <tr>
		      <td><input type="checkbox" name="saveas">另存为&nbsp&nbsp&nbsp</td>
		      <td>&nbsp&nbsp&nbsp<input type="checkbox" name="print">打印</td>
		    </tr>
		    <tr>
		      <td><input type="checkbox" name="preview">预览&nbsp&nbsp&nbsp</td>
		      <td>&nbsp&nbsp&nbsp<input type="checkbox" name="setup">打印设置</td>
		    </tr>
		    <tr>
		      <td><input type="checkbox" name="FileProperties">设置属性&nbsp&nbsp&nbsp</td>
		    </tr>
		  </table>
		  <input type="button" value="保存" onclick="savesa()">
		</center>
		<script type="text/javascript">
		  function saveas(){
		      var menu=new Array(18);
		      // 菜单栏显示风格相关属性值
		      menu[0]=document.all.backcolor.value;
		      menu[1]=document.all.menucolor.value;
		      numu[2]=document.all.framecolor.value;
		      numu[3]=document.all.showstyle.value;
		      numu[4]=document.all.buttonstyle.value;
		      // 允许显示的菜单项
		      if(document.all.tool.checked)
		        menu[5]=true;
		      else
		        menu[5]=false;
		      if(document.all.helpe.checked)
		        menu[6]=true;
		      else
		        menu[6]=false;
		      if(document.all.insert.checked)
		        menu[7]=true;
		      else
		        menu[7]=false;
		      if(document.all.edit.checked)
		        menu[8]=true;
		      else
		        menu[8]=false;
		     // 设置允许用户使用的文件菜单项
		     if(document.all.new.checked){
		        menu[9]=true;
		     }
		     else
		     {
		        menu[9]=false;
		     }
		     if(document.all.open.checked){
		        menu[10]=true;
		     }
		     else
		     {
		        menu[10]=false;
		     }
		     if(document.all.close.checked){
		        menu[11]=true;
		     }
		     else
		     {
		        menu[11]=false;
		     }
		     if(document.all.save.checked){
		        menu[12]=true;
		     }
		     else
		     {
		        menu[12]=false;
		     }
		     if(document.all.saveas.checked){
		        menu[13]=true;
		     }
		     else
		     {
		        menu[13]=false;
		     }
		     if(document.all.print.checked){
		        menu[14]=true;
		     }
		     else
		     {
		        menu[14]=false;
		     }
		     if(document.all.preview.checked){
		        menu[15]=true;
		     }
		     else
		     {
		        menu[15]=false;
		     }  
		     if(document.all.setup.checked){
		        menu[16]=true;
		     }
		     else
		     {
		        menu[16]=false;
		     }
		     if(document.all.FileProperties.checked){
		        menu[17]=true;
		     }
		     else
		     {
		        menu[17]=false;
		     }
		     window.returnValue=menu;
		     window.close();
		  }
		</script>
	</body>
</html>
