<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm tòa nhà</title>
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
                    <h1 >
                        Sửa hoặc thêm mới tòa nhà
                    </h1>
                </div><!-- /.page-header -->
                <div class = "row" style ="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;">
                    <form:form modelAttribute="buildingEdit" id ="listForm" method="GET">
                        <div class="col-xs-12">
                            <form class ="form-horizontal" role ="form" id ="form-edit">
                                <di class ="form-group">
                                    <label class ="col-xs-3">Tên tòa nhà</label>
                                    <div class = "col-xs-9">

                                        <form:input class ="form-control" path="name"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label  class ="col-xs-3">Quận</label>
                                    <div class ="col-xs-2">
                                        <form:select  class ="form-control" path ="district">
                                            <form:option value ="">--- Chọn quận ---</form:option>
                                            <form:options  items ="${districts}"/>
                                        </form:select>

                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Phường</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="ward"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Đường</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="street"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Kết cấu </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="structure"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Số tầng hầm</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="numberOfBasement"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Diện tích sàn</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="floorArea"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Hướng </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="direction"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Hạng</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="level"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Diện tích thuê</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="rentArea"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Giá thuê</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="rentprice"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Mô tả giá </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="rentpricedescription"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Phí dịch vụ</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="serviceFee"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Phí ô tô</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="carFee"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Phí mô tô</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="motoFee"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Phí ngoài giờ</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="overtimeFee"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Tiền điện </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="electricityFee"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Đặt cọc </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="deposit"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Thanh toán</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="payment"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Thời gian thuê </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="rentTime"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Thời gian trang trí </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="decorationTime"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Tên quản lí</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="managerName"/>
                                    </div>
                                </di>


                                <di class ="form-group">
                                    <label class ="col-xs-3">SDT quản lí </label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="managerPhone"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Phí môi giới</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="brokerageFee"/>
                                    </div>
                                </di>

                                <di class ="form-group">
                                    <label class ="col-xs-3">Loại tòa nhà</label>
                                    <div class = "col-xs-9">
                                        <form:checkboxes path="typeCode" items="${listType}" />
                                    </div>
                                </di>


                                <div class="form-group">
                                    <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                    <input class="col-sm-3 no-padding-right"  type="file" id="uploadImage"/>
                                    <div class="col-sm-9">
                                        <c:if test="${not empty buildingEdit.image}">
                                            <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.image}">
                                            <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                    </div>
                                </div>




                                <di class ="form-group">
                                    <label class ="col-xs-3">Ghi chú</label>
                                    <div class = "col-xs-9">
                                        <form:input class ="form-control" path="note"/>
                                    </div>
                                </di>
                                <di class ="form-group">
                                    <label class ="col-xs-3"></label>
                                    <div class ="col-xs-9">

                                        <c:if test="${not empty buildingEdit.id}">
                                            <button type ="button" class =" btn btn-infor" value="${valueBtn}" id ="btnAddOrUpdateBuilding" title="Cập nhật tòa nhà">
                                                Cập nhật tòa nhà
                                            </button>
                                            <button  type ="button" class =" btn btn-infor" id ="btnCancel" title ="Hủy thao tác">
                                                Hủy thao tác
                                            </button>
                                            <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button type ="button" class =" btn btn-infor"  id ="btnAddOrUpdateBuilding" title="Thêm tòa nhà">
                                                Thêm tòa nhà
                                            </button>
                                            <button  type ="button" class =" btn btn-infor" id ="btnCancel" title ="Hủy thao tác">
                                                Hủy thao tác
                                            </button>
                                            <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                                        </c:if>

                                    </div>
                                </di>
                                <form:hidden path="id" id="buildingId"/>


                            </form>

                        </div>

                    </form:form>

                </div>


            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->







</div><!-- /.main-container -->


<script>
    var imageBase64 = '';
    var imageName = '';
    $('#btnAddOrUpdateBuilding').click(function(){
        var data ={};
        var typeCode =[];
        var formdata = $('#listForm').serializeArray();
        $.each(formdata, function(i,v){
            if('' !== v.value && null != v.value){
                if (v.name != 'typeCode'){
                    data["" + v.name +""] = v.value;
                }
                else {
                    typeCode.push(v.value);
                }
            }
            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }


        });
        data['typeCode'] =typeCode;

        if(typeCode != ""){
            $('#loading_image').show();
           AddOrUpdate(data);

        }
        else {
            window.location.href = "/admin/building-edit?typeCode=require";

        }


    });


    function AddOrUpdate (data){
        // call api
        $.ajax({
            type: "POST",
            url : "/admin/building",
            data : JSON.stringify(data),
            contentType : "application/json",
            dataType : "JSON",
            success : function(response){
                $('#loading_image').hide();
                window.location.href = "<c:url  value ="/admin/building-list?message=success"/>";
            },
            error : function(response){
                $('#loading_image').hide();
                window.location.href = "<c:url  value ="/admin/building-list?message=error"/>";
            }
        });
    };

    $('#btnCancel').click(function (){
        window.location.href ="admin/building-list";
    });



    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }




</script>

</body>
</html>
