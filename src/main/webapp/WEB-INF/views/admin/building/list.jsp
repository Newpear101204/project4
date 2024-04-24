<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="secutity" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
     <div class="main-content" >

        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chu</a>
                    </li>
                    <li class="active">Quản lí tòa nhà</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">

                <div class = "row">
                    <div class="col-xs-12">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm </h5>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style ="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">
                                <div class="widget-main" >
                                        <form:form id ="formList" action ="/admin/building-list" method ="GET" modelAttribute="modelSearch">
                                            <div class = "row">

                                            <div class="form-group">

                                                <div class="col-xs-12">
                                                    <div class ="col-xs-6">
                                                        <label class ="name" >Tên tòa nhà </label>
                                                        <form:input class ="form-control" path="name"/>
                                                    </div>
                                                    <div class ="col-xs-6">
                                                        <label class ="name" >Diện tích sàn </label>
                                                        <form:input class ="form-control" path="floorArea"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class ="col-xs-2">
                                                        <label class ="name">Quận</label>
                                                        <form:select  class ="form-control" path ="district">
                                                            <form:option value ="">--- Chọn quận ---</form:option>
                                                            <form:options  items ="${districts}"/>
                                                        </form:select>

                                                    </div>
                                                    <div class ="col-xs-5">
                                                        <label class ="name">Phường  </label>
                                                        <form:input class ="form-control" path="ward"/>
                                                    </div>
                                                    <div class ="col-xs-5">
                                                        <label class ="name">Đường </label>
                                                        <form:input class ="form-control" path="street"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class ="col-xs-4">
                                                        <label class ="name">Số tầng hầm </label>
                                                        <form:input class ="form-control" path="numberOfBasement"/>
                                                    </div>
                                                    <div class ="col-xs-4">
                                                        <label class ="name">Hướng  </label>
                                                        <form:input class ="form-control" path="direction"/>
                                                    </div>
                                                    <div class ="col-xs-4">
                                                        <label class ="name">Hạng </label>
                                                        <form:input class ="form-control" path="level"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class ="col-xs-3">
                                                        <label class ="name">Diện tích từ </label>
                                                        <form:input class ="form-control" path="areaFrom"/>
                                                    </div>
                                                    <div class ="col-xs-3">
                                                        <label class ="name">Diện tích đến </label>
                                                        <form:input class ="form-control" path="areaTo"/>
                                                    </div>
                                                    <div class ="col-xs-3">
                                                        <label class ="name">Giá thuê từ  </label>
                                                        <form:input class ="form-control" path="rentPriceFrom"/>
                                                    </div>
                                                    <div class ="col-xs-3">
                                                        <label class ="name">Giá thuê đến </label>
                                                        <form:input class ="form-control" path="rentPriceTo"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class ="col-xs-5">
                                                        <label class ="name">Tên quản lí  </label>
                                                        <form:input class ="form-control" path="managerName"/>
                                                    </div>
                                                    <div class ="col-xs-5">
                                                        <label class ="name">SDT quản lí </label>
                                                        <form:input class ="form-control" path="managerPhone"/>
                                                    </div>
                                                    <div class ="col-xs-2">
                                                        <secutity:authorize access="hasRole('MANAGER')" >
                                                        <label class ="name">Nhân viên </label>
                                                        
                                                        <form:select class ="form-control" path="staffId" >
                                                            <form:option value="">--- Chọn nhân viên</form:option>
                                                            <form:options  items="${ListStaffs}"/>
                                                        </form:select>
                                                        </secutity:authorize>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class ="col-xs-6">
                                                        <form:checkboxes path="typeCode" items="${listType}" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class ="col-xs-6">
                                                        <button class="btn btn-danger" id ="btnSearchBuilding">Tìm kiếm </button>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>

                                        </form:form>




                                </div>
                            </div>

                            <div class ="pull-right">
                                <a href ="/admin/building-edit">
                                <button class =" btn btn-infor" title="Thêm tòa nhà">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                                </a>
                                <button class =" btn btn-danger" title ="Xóa tòa nhà" id ="btnDeleteBuilding">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>

                                </button>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Bảng danh sách -->

                <div class="row">
                    <div class="col-xs-12">
                        <%--<table id="tableList" style ="margin: 3em 0 1.5em;" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name ="checkList" value ="">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm </th>
                                <th>Tên quản lí</th>
                                <th>SDT quản lí </th>
                                <th>D.Tích sàn </th>
                                <th>D.Tích trống</th>
                                <th>D.Tích thuê</th>
                                <th>Phí môi giới</th>
                                <th>Thao tác</th>


                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var ="item" items="${buildingList}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" name = "checkList" value ="${item.id}">
                                            <span class="lbl"></span>
                                        </label>
                                    </td>

                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.numberOfBasement}</td>
                                    <td>${item.managerName}</td>
                                    <td>${item.managerPhone}</td>
                                    <td>${item.floorArea}</td>
                                    <td>${item.emptyArea}</td>
                                    <td>${item.rentArea}</td>
                                    <td >${item.brokerageFee}</td>

                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-success" title ="Giao tòa nhà " onclick ="assignmentBuilding(${item.id})">
                                                <i class="ace-icon fa fa-check bigger-120"></i>
                                            </button>

                                            <a href ="/admin/building-edit-${item.id}">
                                                <button class="btn btn-xs btn-info" title ="Sửa tòa nhà">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>

                                            </a>

                                            <button class="btn btn-xs btn-danger" title ="Xoa  tòa nhà" onclick = deleteBuilding(${item.id})>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                    <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                                </svg>
                                            </button>



                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>--%>
                            <display:table  name ="buildingList.listResult"
                                            cellspacing="0" cellpadding="0"
                                            requestURI="building-list" partialList="true" sort="external"
                                            size="${buildingList.totalItems}" defaultsort="2" defaultorder="ascending"
                                            id="tableList" pagesize="${buildingList.maxPageItems}"
                                            export="false"
                                            style ="margin: 3em 0 1.5em;" class="table table-striped table-bordered table-hover">
                                <display:column class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name = "checkList" value ="${tableList.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </display:column>
                                <display:column  property="name" title="Tên tòa nhà"/>
                                <display:column  property="address" title="Địa chỉ"/>
                                <display:column  property="numberOfBasement" title="Số tầng hầm "/>
                                <display:column  property="managerName" title="Tên quản lí"/>
                                <display:column  property="managerPhone" title="SDT quản lí"/>
                                <display:column  property="floorArea" title="D.Tích sàn"/>
                                <display:column  property="emptyArea" title="D.Tích trống"/>
                                <display:column  property="rentArea" title="D.Tích thuê"/>
                                <display:column  property="brokerageFee" title="Phí môi giới"/>
                                <display:column title="Thao tac">
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-success" title ="Giao tòa nhà " onclick ="assignmentBuilding(${tableList.id})">
                                                <i class="ace-icon fa fa-check bigger-120"></i>
                                            </button>
                                        </security:authorize>


                                        <a href ="/admin/building-edit-${tableList.id}">
                                            <button class="btn btn-xs btn-info" title ="Sửa tòa nhà">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>

                                        </a>

                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-danger" title ="Xoa  tòa nhà" onclick = deleteBuilding(${tableList.id})>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                    <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5m-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5M4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06m6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528M8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5"/>
                                                </svg>
                                            </button>
                                        </security:authorize>





                                    </div>

                                </display:column>


                            </display:table>
                    </div><!-- /.span -->
                </div>

            </div><!-- /.page-content -->
        </div>
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

     <div class="modal fade" id="assignmentBuildingModal" role="dialog">
         <div class="modal-dialog">

             <!-- Modal content-->
             <div class="modal-content">
                 <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4 class="modal-title">Danh sách nhân viên </h4>
                 </div>
                 <div class="modal-body">
                     <table style ="margin: 3em 0 1.5em;" class="table table-striped table-bordered table-hover" id ="staffList">
                         <thead>
                         <tr>
                             <th class="center">
                                 Chọn
                             </th>
                             <th>Tên nhân viên</th>
                         </tr>
                         </thead>

                         <tbody>


                         </tbody>
                     </table>
                     <input type ="hidden" id = "buildingId" name =buildingId" value ="">
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-default" id = "btnassignmentBuilding">Giao tòa nhà</button>
                     <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                 </div>
             </div>

         </div>
     </div>

     <script>
    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaff(buildingId){
        $.ajax({
            type: "GET",
            url : "/admin/building/" + buildingId +"/staffs",
            dataType : "JSON",
            success : function(response){
                var row = '';
                $.each(response.data, function(index, item ){
                    row += '<tr>';
                    row += '<td class="center"><input type="checkbox"  value= "' + item.staffId + ' " id= "checkbox_' + item.staffId + '" class = "check-box-element"'+ item.checked + '/></td>';
                    row += '<td class="center">' + item.fullName +'</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
            },
            error : function(response){
                window.location.href = "<c:url  value ="/admin/building-list?message=error"/>";
            }
        });

    }

    $('#btnassignmentBuilding').click(function(e){
        e.preventDefault();
        var data ={};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if(data['staffs'] != ''){
            assignment(data);

        }
    });

    function assignment (data){
        $.ajax({
            url : "/admin/building/assignment" ,
            type: "POST",
            data : JSON.stringify(data),
            contentType : "application/json",
            dataType : "JSON",
            success : function(response){
                window.location.href = "<c:url  value ="/admin/building-list?message=success"/>";
            },
            error : function(response){
                window.location.href = "<c:url  value ="/admin/building-list?message=error"/>";
            }
        });

    }






    $('#btnSearchBuilding').click(function(e){
        e.preventDefault();
        $('#formList').submit();
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
