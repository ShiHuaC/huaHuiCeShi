<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>花卉信息列表</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js" type="text/javascript" ></script>

    <style type="text/css">
      *{
        padding: 0px;
        margin: 0px;
      }
      a{
        text-decoration: none;
      }
      .main{
        width: 500px;
        margin: 0px auto;
      }
      #tb_hua{
        width: 500px;
      }
      #tb_hua .title{
        font-size: 24px;
        text-align: center;
        line-height: 50px;
      }
      tr{
        line-height: 30px;
      }
      #msg{
        line-height: 50px;
        color: red;
        font-size: 16px;
        font-weight: bolder;
        text-align: center;
      }

    </style>
  </head>
  <body>

  <div class="main">

    <table border="1" id="tb_hua">
      <tr>
        <td colspan="7" class="title">花卉信息列表</td>
      </tr>
      <tr>
        <td colspan="7" style="text-align: right"><a href="toAdd">添加花卉</a></td>
      </tr>
      <tr>
        <th>编号</th>
        <th>名称</th>
        <th>别名</th>
        <th>科属</th>
        <th>价格</th>
        <th>原产地</th>
        <th>图片</th>
      </tr>
      <c:if test="${not empty requestScope.flist}">
        <c:forEach var="f" items="${requestScope.flist}">
          <tr>
            <td>${f.id}</td>
            <td>${f.name}</td>
            <td>${f.anothername}</td>
            <td>${f.property}</td>
            <td>${f.price}</td>
            <td>${f.production}</td>
            <td><img src="${f.path}" width="100" height="100"/></td>
          </tr>
        </c:forEach>
      </c:if>
      <c:if test="${empty requestScope.flist}">
        <tr><td>空空如也</td></tr>
      </c:if>
    </table>
    <div id="msg">${sessionScope.errormsg}</div>
    <script type="text/javascript">
        $("#tb_hua tr:even").css("background-color","lightblue");
    </script>
  </div>
  </body>
</html>
