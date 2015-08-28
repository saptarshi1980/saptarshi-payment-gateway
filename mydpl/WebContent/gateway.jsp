<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript">
function validateForm(){
	document.frm1.getElementByName("a[0]").checked = true;

​}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DPL-Redirection to Payment Gateway</title>
</head>
<body>
<!-- <form name="frm1" action="Final.dpl" method="POST"> -->
<form name="frm1" action="Inter.dpl" method="POST" onsubmit="validateForm()">

<input type="hidden" value="${sessionScope.msg}" name="msg"/>
<br>
<br><br>
<div align="center"><h3>Please Do Not Press refresh/Stop Button During The Entire Process</h3><br></div>
<div align="center"><h3>Please select the Bill Month for which you want to make the Payment</h3><br></div>


<table width="356" border="1" align="center" cellpadding="1" cellspacing="2">
<tr><th width="108" bgcolor="#996633">Bill Month</th>
   <th width="143" bgcolor="#996633">Bill Amount</th>
   <th width="143" bgcolor="#996633">Due Date</th>
   </tr>
<c:forEach items="${al}" var="bill_info">
   
   
   <tr>
       <td bgcolor="#FFFFFF"><input type="radio" NAME="a" value=${bill_info.billMonthWord} ><c:out value="${bill_info.billMonthWord}"></c:out></td>
       <td bgcolor="#FFFFFF"><div align="center">Rs. ${bill_info.billAmt}</div></td>
       <td bgcolor="#FFFFFF"><div align="center">${bill_info.dueDate}</div></td>
       <input type="hidden" name="con_no" value="${bill_info.partyCode}"/>
       <input type="hidden" name="bill_amt" value="${bill_info.billAmt}"/>
	   <input type="hidden" name="bill_month" value="${bill_info.billMonth}"/>
    </tr>
</c:forEach>


</table>

<br>&nbsp;
<table width="325" border="1" align="center" cellpadding="2">
  <tr>
    <td colspan="2" bgcolor="#996633"><div align="center">Select The Payment Mode </div></td>
  </tr>
  <tr>
    <td width="145" bgcolor="#FFFFFF"><label>
      <input name="b" type="radio" value="radiobutton" checked>
      Internet Banking</label></td>
    <td width="160">Powered by BillDesk </td>
  </tr>
</table>
<div align="center"></div>
<p>&nbsp;</p>
<p><br>
</p>
<div align="center">
<input type="image" name="button1" src="button.png" alt="Submit" >
</div>
</form>

</body>
</html>