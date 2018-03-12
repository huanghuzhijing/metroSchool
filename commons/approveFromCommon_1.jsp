<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
			$("#btn_approveContent").click(function(){ 
					var url = "contentSelectAction.do?method=list&flag=1&type=12";
					art.dialog({id:'commonDialog1',title:'意见选择', iframe:url, width:'600', height:'350',top:'0'});
			});
	});	
</script>	
<fieldset>
					<legend>
						审核信息
					</legend>
					<table class="formTable">
						<COLGROUP>
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
							<COL class="tdLeftTwo" />
							<COL class="tdRightTwo" />
						</COLGROUP>
						<tr>
							<td>
								审核意见：
								<span class="redSpan">*</span>
							</td>
							<td colspan="3">
								<textarea rows="6" cols="60" id="approveContent"
									name="approveContent"></textarea>
								<input id="btn_approveContent" type="button" icon="icon_selectInfo"
									value="意见选择">
							</td>
						</tr>
							<tr>
							<td>
								附件名称：<span class="noRedSpan">*</span>
							</td>
							<td >
								<html:text property="fileAppName_" styleClass="inputText" maxlength="100" size="30"/>
							</td>
							<td >
								附件地址：<span class="noRedSpan">*</span>
							</td>
							<td >
								<input id="fileAppAddr_" class="inputText" type="file" onchange="fileSelect(this)" name="fileAppAddr_" size="30"/>
							</td>
						</tr>
						<tr>
							<td>
								审核人：
								<span class="noRedSpan">*</span>
							</td>
							<td>
								${userinfo.username}
							</td>
							<td>
								审核日期：
								<span class="noRedSpan">*</span>
							</td>
							<td>
								${now_date}
							</td>
						</tr>
					</table>
				</fieldset>
