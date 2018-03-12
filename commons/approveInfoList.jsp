<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<fieldset>
		<legend>
			审核记录
		</legend>
		<ec:table items="approveInfos" var="approveInfo"
			action="bidInvitebiddingPrjInfoAction.do?method=approveInfoView&id=${bidInvitebiddingPrjInfo.id}"
			title="" sortable="false" rowsDisplayed="10"
			imagePath="${ctx}/styles/extremecomponents/images/*.gif"
			locale="zh_CN"  showPagination="false" tableId="approveInfoTable"	>
			<ec:row highlightRow="true">
				<ec:column property="rowcount" cell="rowCount" sortable="false"
					width="6%" title="序号" />
				<ec:column property="taskName" calcTitle="taskName" title="任务名称"
					width="12%" />
				<ec:column property="approveIds" calcTitle="approveIds" title="上报/审核人"
					width="10%">
					<ex:empName id="${approveInfo.approveId}" />
				</ec:column>
				<ec:column property="null" calcTitle="null" title="上报/审核部门">
					<ex:organNameByOper id="${approveInfo.approveId}"/>
				</ec:column>
				<ec:column property="approveDate" width="12%" cell="date"
					calcTitle="approveDate" title="上报/审核时间" />
					<ec:column property="approveState" calcTitle="approveState"
					title="审核结果" />
				<ec:column property="approveContent" calcTitle="approveContent"
					title="审核意见" />
					<ec:column property="nextStep" calcTitle="nextStep"
					title="下一步骤" />
			</ec:row>
		</ec:table>
	</fieldset>
