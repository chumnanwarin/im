<%-- 
    Document   : TicketReportListing
    Created on : Apr 1, 2016, 10:13:29 AM
    Author     : Neng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/css/jquery.dataTables.css">
		<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.1/jquery.dataTables.min.js"></script>

        <script src="../lib/js/jquery.js" type="text/javascript"></script>
        <link href="../lib/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <script src="../lib/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <link href="../lib/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../lib/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../lib/js/bootstrap.min.js" type="text/javascript"></script>
        <style media="all" type="text/css">
            .alignRight { text-align: right; }

            th {text-align: center;} 

            .detail {
                padding-right: 0px; 
                padding-left: 0px; 
                margin-right: 0px; 
                margin-left: 0px; 
            }

            #footer {
                position: fixed;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    
    
    <body style="background-color:#FFF">
        <div >
            <jsp:include page="/Header.jsp?title=INCIDENT MANAGEMENT SYSTEM :: T i c k e t L i s t i n g"/>
        </div>
        
        <form id="form1">

            <div class="container collapse  navbar-collapse" style="background-color:#FFF" style="border:#F00" style="width:100%;height:100%"> 
                <div class="row">
                    <ul id="myTab" class="nav nav-tabs">                 
                    </ul><br>
                </div>
                
                <div class="row">  
                    <div class="container">
                        <div class="col-md-12">
                            <div style="border:1px solid black; padding:1px">
                                <table id="dataTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th style="text-align:center; width:120px;">Ticket #</th>
                                            <th style="text-align:center; width:120px;">Title</th>
                                            <th style="text-align:center; width:80px;">Project</th>
                                            <th style="text-align:center; width:90px;">Category</th>
                                            <th style="text-align:center; width:120px;">Priority</th>
                                            <th style="text-align:center; width:120px;">Severity</th>
                                            <th style="text-align:center; width:120px;">Request Date</th>
                                            <th style="text-align:center; width:120px;">Status</th>
                                            <th style="text-align:center; width:120px;">Division Owner</th>
                                            <th style="text-align:center; width:120px;">Owner</th>   
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            
            <!------------------------------------------------------------------------------------------------>
            <!--<script src="http://code.jquery.com/jquery-latest.js"></script> -->
            <script>
            //$(document).ready(function () {
                //$("#dataTable").dataTable();
                //loadIncidentsReport();
                //initTestTable();
            //});
            
            $(document).ready(function() {                        
                $('#submit').click(function(event) {  
                var dataJson = "";
                $.ajax({
                    type: 'POST',
                    url: 'IncidentsListingServlet',
                    data: {
                        functionName: 'GetReport'
                    },
                    success: function (responseText) {
                        $('#ajaxGetUserServletResponse').text(responseText);
                        dataJson = responseText;
                        $('#dataTable').dataTable({
                            data: dataJson,
                            'paging': true,
                            'sort': true,
                            'searching': true,
                            'scrolly': 200,
                            //                            'sScrollX': '100%',
                            columns: [
                                {'data': 'ticket_num'},
                                {'data': 'title'},
                                {'data': 'request_date'},
                                {'data': 'project_name'},
                                {'data': 'category_name'},
                                {'data': 'severity_name'},
                                {'data': 'priority_name'},
                                {'data': 'status_name'},
                                {'data': 'div_owner'},
                                {'data': 'owner_name'}
                            ],
                            "aoColumnDefs": [
                                {"sClass": "alignRight", "aTargets": [3]}
                            ]
                        });
                    }
                });

                });


            });

            
            
        </script>
        
            
            <input type="button" id="submit" value="Ajax Submit"/>
        </form>
 
    </body>
</html>
