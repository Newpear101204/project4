<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm khach hang</title>
</head>
<body>
<div class="main-content" >


    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">

                <div class="page-header">

                    <c:if test="${not empty customerEdit.id}">
                        <h1 >
                            Cập nhật thông tin khách hàng
                        </h1>
                    </c:if>
                    <c:if test="${empty customerEdit.id}">
                        <h1 >
                            Thông tin khách hàng
                        </h1>
                    </c:if>
                </div><!-- /.page-header -->
                <div class = "row" style ="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">
                    <form:form modelAttribute="customerEdit" id ="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class ="form-horizontal" role ="form" id ="form-edit">
                                <di class ="form-group">
                                    <label class ="col-xs-3">Tên khách hàng  </label>
                                    <div class = "col-xs-9">

                                        <form:input class ="form-control" path="name"/>
                                    </div>
                                </di>
                                <di class ="form-group">
                                    <label class ="col-xs-3">Di động  </label>
                                    <div class = "col-xs-9">

                                        <form:input class ="form-control" path="customerPhone"/>
                                    </div>
                                </di>
                                <di class ="form-group">
                                    <label class ="col-xs-3">Email</label>
                                    <div class = "col-xs-9">

                                        <form:input class ="form-control" path="email"/>
                                    </div>
                                </di>
                                <di class ="form-group">
                                    <label class ="col-xs-3">Tên công ty  </label>
                                    <div class = "col-xs-9">

                                        <form:input class ="form-control" path="companyName"/>
                                    </div>
                                </di>
                                <di class ="form-group">
                                    <label class ="col-xs-3">Nhu cầu  </label>
                                    <div class = "col-xs-9">

                                        <form:input class ="form-control" path="demand"/>
                                    </div>
                                </di>
                                <di class ="form-group">
                                    <label class ="col-xs-3">Trạng thái  </label>
                                   <%-- <div class = "col-xs-9">

                                        <form:input class ="form-control" path="status"/>
                                    </div>--%>
                                    <div class = "col-xs-9">


                                    <form:select class ="form-control" path="status" >
                                        <form:option value="">Chon trạng thái </form:option>
                                        <form:options  items="${statusType}"/>
                                    </form:select>
                                    </div>
                                </di>



                                <di class ="form-group">
                                    <label class ="col-xs-3"></label>
                                    <div class ="col-xs-9">

                                        <c:if test="${not empty customerEdit.id}">
                                            <button type ="button" class =" btn btn-infor" value="${valueBtn}" id ="btnAddOrUpdateBuilding" title="Cập nhật thong tin">
                                                Cập nhật thông tin
                                            </button>
                                            <button  type ="button" class =" btn btn-infor" id ="btnCancel" title ="Hủy thao tác">
                                                Hủy thao tác
                                            </button>
                                        </c:if>
                                        <c:if test="${empty customerEdit.id}">
                                            <button type ="button" class =" btn btn-infor"  id ="btnAddOrUpdateBuilding" title="Thêm khach hang">
                                                Thêm khách hàng
                                            </button>
                                            <button  type ="button" class =" btn btn-infor" id ="btnCancel" title ="Hủy thao tác">
                                                Hủy thao tác
                                            </button>
                                        </c:if>

                                    </div>
                                </di>
                                <form:hidden path="id" id="id"/>


                            </form>

                        </div>

                    </form:form>

                </div>


            </div><!-- /.page-content -->


            <c:forEach var="item" items="${transactionType}">
                <div class ="col-xs-12">
                    <div class ="col-sm-12">
                        <h3 class ="header smaller lighter blue ">${item.value}</h3>
                        <button class ="btn btn-lg btn-primary" onclick="transactionType('${item.key}', ${customerEdit.id})">
                            <i class ="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
                        </button>
                    </div>
                    <c:if test="${item.key == 'CSKH'}">
                        <div class ="col-xs-12">
                            <table id = "simple-table" class ="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Ngày tạo </th>
                                    <th>Người tạo </th>
                                    <th>Ngày sửa </th>
                                    <th>Người sửa </th>
                                    <th>Chi tiết giao dịch </th>
                                    <th>Thao tác </th>
                                </tr>
                                </thead>

                                <tbody>

                                    <c:forEach var ="items" items="${cskh}">
                                    <tr>
                                        <td>${items.createdDate}</td>
                                        <td>${items.createdBy}</td>
                                        <c:if test="${items.createdDate == items.modifiedDate}">
                                            <td></td>
                                            <td></td>
                                        </c:if>
                                        <c:if test="${items.createdDate != items.modifiedDate}">
                                            <td>${items.modifiedDate}</td>
                                            <td>${items.modifiedBy}</td>
                                        </c:if>
                                        <td>${items.note}</td>
                                        <td>
                                            <div class ="hidden-sm hidden-xs btn-group">
                                                <button class ="btn btn-xs btn-danger" data-toggle="tooltip" title="Sua thong tin giao dich"
                                                        onclick="UpdateTransaction(${items.id},'${item.key}', ${customerEdit.id},'${items.note}')">
                                                    <i class = "ace-icon fa fa-trash-o bigger-120"></i>

                                                </button>

                                            </div>
                                        </td>
                                    </tr>

                                    </c:forEach>

                                </tbody>

                            </table>


                        </div>


                    </c:if>
                    <c:if test="${item.key == 'DDX'}">
                        <div class ="col-xs-12">
                            <table id = "simple-table" class ="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Ngày tạo </th>
                                    <th>Người tạo </th>
                                    <th>Ngày sửa </th>
                                    <th>Người sửa </th>
                                    <th>Chi tiết giao dịch </th>
                                    <th>Thao tác </th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var ="items" items="${ddx}">
                                    <tr>
                                        <td>${items.createdDate}</td>
                                        <td>${items.createdBy}</td>
                                        <c:if test="${items.createdDate == items.modifiedDate}">
                                            <td></td>
                                            <td></td>
                                        </c:if>
                                        <c:if test="${items.createdDate != items.modifiedDate}">
                                            <td>${items.modifiedDate}</td>
                                            <td>${items.modifiedBy}</td>
                                        </c:if>
                                        <td>${items.note}</td>
                                        <td>
                                            <div class ="hidden-sm hidden-xs btn-group">
                                                <button class ="btn btn-xs btn-danger" data-toggle="tooltip" title="Sua thong tin giao dich"
                                                        onclick="UpdateTransaction(${items.id},'${item.key}', ${customerEdit.id},'${items.note}')">
                                                    <i class = "ace-icon fa fa-trash-o bigger-120"></i>

                                                </button>

                                            </div>
                                        </td>
                                    </tr>

                                </c:forEach>
                                </tbody>

                            </table>


                        </div>



                    </c:if>

                </div>

            </c:forEach>
        </div>
    </div><!-- /.main-content -->

    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Nhập giao dịch  </h4>
                </div>
                <div class="modal-body">

                    <div class ="form-group has-success">
                        <label for ="transactionDetail" class ="col-xs-12 col-sm-3 control-label no-padding-right"> Chi tiet giao dịch </label>
                        <div class ="col-xs-12 col-sm-9">
                            <span class = "block input-icon input-icon-right">
                                <input type="text" id ="transactionDetail" class ="width-100" >
                            </span>
                        </div>
                    </div>

                    <input type ="hidden" name ="customerId" id ="customerId" value ="">
                    <input type ="hidden" name ="code" id ="code" value ="">
                    <input type ="hidden" name ="ids" id ="ids" value ="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id = "btnAddOrUpdateTransaction">Thêm giao dịch </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>







</div><!-- /.main-container -->



<script>

    function transactionType(code,customerId){
        $('#transactionTypeModal').modal();
        $('#customerId').val(customerId);
        $('#code').val(code);
    }

    function UpdateTransaction (id,code,customerId,note){
        $('#transactionTypeModal').modal();
        $('#ids').val(id);
        $('#customerId').val(customerId);
        $('#code').val(code);
        // Lấy thẻ input bằng id
        var myInput = document.getElementById("transactionDetail");

        // Đặt giá trị mặc định cho ô input
        myInput.value = note ;
    }

    $('#btnAddOrUpdateTransaction').click(function (e) {
        e.preventDefault();
        var data ={};
        data['id'] = $('#ids').val();
        data['customerId'] = $('#customerId').val();
        data['code'] = $('#code').val();
        data['transactionDetail'] = $('#transactionDetail').val();
        addTransaction(data);


    });

    function addTransaction(data){
        $.ajax({
            type :"POST",
            url : 'customer/transaction',
            data : JSON.stringify(data),
            contentType : "application/json",
            success : function(response){
                window.location.href = "<c:url  value ="/admin/customer-list?message=success"/>";
            },
            error : function(response){
                window.location.href = "<c:url  value ="/admin/customer-list?message=error"/>";
            }
        })
    }








    $('#btnAddOrUpdateBuilding').click(function(){
        var data ={};
        var formdata = $('#listForm').serializeArray();
        $.each(formdata, function(i,v){
            if('' !== v.value && null != v.value){
                data["" + v.name +""] = v.value;
            }

        });

        AddOrUpdate(data);


    });


    function AddOrUpdate (data){
        // call api
        $.ajax({
            type: "POST",
            url : "/admin/customer",
            data : JSON.stringify(data),
            contentType : "application/json",
            dataType : "JSON",
            success : function(response){
                window.location.href = "<c:url  value ="/admin/customer-list?message=success"/>";
            },
            error : function(response){
                window.location.href = "<c:url  value ="/admin/customer-list?message=error"/>";
            }
        });
    };

    $('#btnCancel').click(function (){
        wwindow.location.href = "<c:url  value ="/admin/customer-list"/>";
    });



    function deleteBuilding (data){
        var buildingId = [data];
        deleteBuildings(buildingId);
    }
    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    });

    function deleteBuildings(data) {
        $.ajax({
            type: "Delete",
            url : "/admin/building/" + data,
            data : JSON.stringify(data),
            contentType : "application/json",
            //   dataType : "JSON",
            success : function(respond){
                window.location.href = "<c:url  value ="/admin/building-list?message=success"/>";
            },
            error : function(respond){
                window.location.href = "<c:url  value ="/admin/building-list?message=error"/>";
            }
        });
    }

    $('#btnCancel').click(function(){
        window.location.href = "admin/building-list";
    });

</script>


</body>
</html>
