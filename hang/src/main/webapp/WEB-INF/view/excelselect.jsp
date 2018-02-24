<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>推表</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/push" method="post">

    <br>选择版本：<br>
       <label> <input name="version" type="radio" value="develop"/> develop </label>
        <label> <input name="version" type="radio" value="dev_1.6.0"/> dev_1.6.0 </label>
         <label> <input name="version" type="radio" value="dev_1.7.0"/> dev_1.7.0 </label>
         <label> <input name="version" type="radio" value="dev_1.7.2"/> dev_1.7.2 </label>
             <label> <input name="version" type="radio" value="rc"/> rc </label>
      <!--   <label> <input name="version" type="radio" value="oversea_1.5.4_publish"/> os_1.5.4 </label> -->
         <label> <input name="version" type="radio" value="oversea_simplified"/> oversea_simplified </label>
       <!--    <label> <input name="version" type="radio" value="oversea_traditional"/>oversea_traditional </label> -->
           <label> <input name="version" type="radio" value="oversea_traditional_dev"/>oversea_traditional_dev </label>
       <br>
    <input type="submit" value="推表"><br>
    </form>	 
</body>
</html>