<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>상품 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>상품코드</th>
    <th>상품명</th>
    <th>단가</th>
    <th>상세정보</th>
    <th>제조사</th>
    <th>분류</th>
    <th>재고수</th>
    <th>상태</th>
    <th>구분</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select*from product0822";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String productId = rs.getString("productId");
    		 String name= rs.getString("name");
    		 String unitprice = rs.getString("unitprice");
    		 String description = rs.getString("description");
    		 String manufacturer = rs.getString("manufacturer");
    		 String category = rs.getString("category");
    		 if(category.equals("10")){
    			 category="it 제품";
    		 }else if(category.equals("20")){
    			 category="주방제품";
    		 }
    		 else if(category.equals("30")){
    			 category="전자제품";
    		 }
    		 else if(category.equals("40")){
    			 category="일반 잡화";
    		 }
    		 
    		 String unitsInstock = rs.getString("unitsInstock");
    		 String condition = rs.getString("condition");
    		
    		
%>
<tr>
   
    <td><a href = "productUpdate.jsp?productId=<%=productId %>"><%=productId %></a> </td>
    <td><%=name %> </td>
    <td><%=unitprice %> </td>
    <td><%=description %> </td>
    <td><%=manufacturer %> </td>
    <td><%=category %> </td>
    <td><%=unitsInstock %> </td>
    <td><%=condition %> </td>
    <td>
      
      <a href="productDelete.jsp?productId=<%=productId %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 9  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="addProduct.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>