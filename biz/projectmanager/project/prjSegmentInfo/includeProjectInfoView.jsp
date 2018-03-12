 <%@ page contentType="text/html;charset=UTF-8" %>
 <fieldset >
					<legend>项目信息</legend>
					<table class="formTable" >
							<COLGROUP>
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
								<COL class="tdLeftTwo" />
								<COL class="tdRightTwo" />
							</COLGROUP>
							<tr>
								<td>
									项目编号：<span class="noRedSpan">*</span>
								</td>
								<td>
									${projectInfo.prjCode}&nbsp;
								</td>
								<td>
									项目名称：<span class="noRedSpan">*</span>
								</td>
								<td>
									${projectInfo.prjName}&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									项目类型：<span class="noRedSpan">*</span>
								</td>
								<td >
									<ex:dicDisplay dictIdentify="PrjType" dictValue="${projectInfo.prjType}"/>
								</td>
								<td>
									项目状态：<span class="noRedSpan">*</span>
								</td>
								<td >
									<ex:dicDisplay dictIdentify="PrjStatus" dictValue="${projectInfo.prjStatus}"/>
								</td>
							</tr>
					</table>
				</fieldset>