

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <c:import url="../templates/adminHead.jsp"></c:import>
        <c:import url="../templates/datatablecss3.jsp"></c:import>
        </head>
        <body class="app sidebar-mini rtl">
        <c:import url="../templates/adminPage.jsp"></c:import>

        <main class="app-content">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-edit"></i>List Mailbox</h1>

                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index.jsp">Home</a></li>
            </ul>
        </div>

        <form method="post" action="SearchMailboxServlet">

            <ul class="app-nav">
                <li class="app-search">
                    <input class="app-search__input" type="search" placeholder="Search Name" id="inputsearch" name="name">
                    <button class="app-search__button" type="submit" value="Search" name="Search"><i class="fa fa-search"></i></button>
                </li>
            </ul> 
        </form>
        <div id="wrap" class="table-responsive" >
            <table id="example" class="table table-striped table-bordered display">
                <thead>
                    <tr>
                        <th>EMailID</th>
                        <th>Subject</th>
                        <th>Message</th>
                        <th>ReceivedDate</th>  
                        <th>Action</th>

                    </tr>
                </thead>
                <tbody> 
                    <c:forEach items="${list}" var="p">
                        <tr>
                            <td>${p.mailID}</td>
                            <td>${p.subject}</td>
                            <td>${p.message}</td>
                            <td>${p.receivedDate}</td>

                            <td class="text-center"><a class='btn btn-info btn-xs' href="${pageContext.request.contextPath}/MailboxServlet?action=ResetPassword&email=${p.message}"><span class="glyphicon glyphicon-edit"></span>Reset</a> 
                            <td class="text-center"><a href="${pageContext.request.contextPath}/MailboxServlet?action=Delete&code=${p.mailID}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span>Delete</a></td>     
                        </tr>
                    </c:forEach>    
                </tbody>
            </table>

        </div>

    </main>

    <c:import url="../templates/cripPrint2.jsp"></c:import>
<!--    <script type="text/javascript">
        $(document).ready(function() {
            $('#example').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    {extend: 'excel',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }},
                    {extend: 'pdf',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                        }},
                    {extend: 'print',
                        exportOptions: {
                            columns: [0, 1, 2, 3]
                       }},
                ]

            });
        });</script>-->
</body>
</html>
