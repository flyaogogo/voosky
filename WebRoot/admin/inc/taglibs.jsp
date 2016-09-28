<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctx_img" value="${pageContext.request.scheme}${'://'}${pageContext.request.serverName}${':'}${pageContext.request.serverPort}${'/static_img'}"/>

<script>
 var ctx = '${ctx}';
 var ctx_img = '${ctx_img}' ;

</script>