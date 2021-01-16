<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加花卉</title>
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
            position: relative;
        }
        .title{
            font-size: 24px;
            text-align: center;
            line-height: 50px;
        }
        tr{
            line-height: 30px;
        }
        td>input{
            line-height: 25px;
            width: 210px;
        }
        table{
            width: 400px;
        }
        .btn{
            line-height: 30px;
            width: 50px;
        }
        #msg{
            line-height: 50px;
            color: red;
            font-size: 16px;
            font-weight: bolder;
            text-align: center;
            position: absolute;
            right: 0px;
            top:50px;
        }
    </style>
</head>
<body>
<div class="main">
    <form action="addFlower" method="post" enctype="multipart/form-data">
        <table border="1">
            <tr>
                <th colspan="2" class="title">花卉信息</th>
            </tr>
            <tr>
                <td><h4>花卉名称:</h4></td>
                <td><input type="text" name="name" onblur="chkName(this)"></td>
            </tr>
            <tr>
                <td><h4>花卉图片:</h4></td>
                <td><input type="file" name="flowerImg"></td>
            </tr>
            <tr>
                <td><h4>别名:</h4></td>
                <td><input type="text" name="anothername"></td>
            </tr>
            <tr>
                <td><h4>科属:</h4></td>
                <td><input type="text" name="property"></td>
            </tr>
            <tr>
                <td><h4>价格(元/支):</h4></td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td><h4>原产地:</h4></td>
                <td><input type="text" name="production"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="btn" type="submit" value="添加">&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="btn" type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
    <div id="msg"></div>
</div>
</body>
<script type="text/javascript">
    function chkName(input) {
        $.ajax({
            "url":"FlowerServlet?opr=chk",
            "type":"post",
            "data":"name="+$(input).val(),
            "dataType":"text",
            "success":function (data) {
                if(data==1||data=="1"){

                    $("#msg").html("重名不可用");
                }else{
                    $("#msg").html("名称无重名");
                }
            }
        });
    }
</script>
</html>
