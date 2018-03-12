/*flex公共函数文件*/
//FLEX传参转换函数
function getOrginVars(encyptVars){
    //获取原始参数
	encyptVars=encyptVars.replace(/A_S_FLAG/g,"&").replace(/A_E_FLAG/g,"=");
	return encyptVars;
}
function getEnbyptVars(orginVars){
    //获取转换后的参数字符串
	orginVars=orginVars.replace(/&/g,"A_S_FLAG").replace(/=/g,"A_E_FLAG");
	return "FLEX_VAR="+orginVars;
}

 


