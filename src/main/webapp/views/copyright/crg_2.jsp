<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>






 
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

	<style>
    </style>
<body>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    <%@ include file="/views/nav.jsp" %>
    <%@ include file="/views/approval/draftDocForm.jsp" %>
    <!-- -------------------------------------------nav end------------------------------------------ -->
    <!-- -------------------------------------------util start------------------------------------------ -->
    
    <!-- -------------------------------------------util end------------------------------------------ -->
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">저작권등록</h2>
        <h3 class="sub_title">저작권확인</h3>

        <div class="list_form">
        
         <input type="text" id="searchbar"/>
        <button id="search">검색</button> 
        
        <ul id="list">


    	</ul>
       <ul id="list2">


    	</ul>
		
	<form action="copyrightregister" method="POST" enctype="multipart/form-data">
        <table style="margin-left:auto;margin-right:auto;">
        <tr style="border: solid 1px black; border-collapse: collapse;">
        	<td style="border: solid 1px black; border-collapse: collapse; ">
        	저작권 번호 : <input type="text" id="searchbar" placeholder="저작권번호" name="no"/>
        	</td>
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	음원명 : <input type="text" placeholder="음원명" id="namae" name="namae"/>
        	</td>
        </tr>
        <tr style="border: solid 1px black; border-collapse: collapse;">
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	요금 : <input type="text" placeholder="요금" id="price" name="price"/>
        	</td>
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	계약일 : <input type="date" id="cont" class="datePicker" value="2018-07-22" min="2018-01-01" max="2018-12-31" name="cont"/>
        	</td>
        </tr>
        <tr style="border: solid 1px black; border-collapse: collapse;">
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	만료일 : <input type="date" id="exp" class="datePicker" name="exp"/>
        	</td>
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	아티스트 명 : <input type="text" placeholder="아티스트명" id="name" name="name"/>
        	</td>
        </tr>
        <tr style="border: solid 1px black; border-collapse: collapse;">
        	<td style="border: solid 1px black; border-collapse: collapse;">
        	담당자 : <input type="text" placeholder="담당자" id="member" name="member"/>
        	</td>
			<td style="border: solid 1px black; border-collapse: collapse;">
			<input type="file" id="file" name="file" multiple="multiple" />
			</td>
        </tr>        
        
        </table>
		<h3>${data}</h3>
     
        
        <input type="submit" value="등록" />
    </form>
        </div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">
        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
<script>

// -------------------------------- toggle start ------------------------------------------
document.addEventListener('DOMContentLoaded', function () {
    var dep1Items = document.querySelectorAll('.gnb .dep1[data-index]');
    var dep2Items = document.querySelectorAll('.gnb .dep2[data-index]');

    dep1Items.forEach(function (item) {
      item.addEventListener('click', function () {
        var dataIndex = item.getAttribute('data-index');
        var targetUl = document.querySelector('.gnb ul[data-index="' + dataIndex + '"]');
        var isActive = targetUl.classList.contains('active');

        if (!isActive) {
            $(targetUl).stop().slideDown(300);
            $(targetUl).addClass('active');
            $(targetUl).siblings('ul').removeClass('active').slideUp(300);
            $(this).addClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(90deg)');
            if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
                $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
                $(this).parents('a').siblings().find('li.active').removeClass('active');
            }
        } else {
            $(targetUl).stop().slideUp(300);
            $(targetUl).removeClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(0deg)');
            $(this).removeClass('active');
        }
      });
    });

    dep2Items.forEach(function (item) {
      item.addEventListener('click', function (e) {
        var dataIndex = item.getAttribute('data-index');
        var targetUl = document.querySelector('.gnb ul ul[data-index="' + dataIndex + '"]');
        var isActive = targetUl.classList.contains('active');

        if (!isActive) {
            $(targetUl).stop().slideDown(300);
            $(targetUl).addClass('active');
            $(targetUl).siblings('ul').removeClass('active').slideUp(300);
            $(this).addClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(90deg)');
            if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
                $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
                $(this).parents('a').siblings().find('li.active').removeClass('active');
            }
        } else {
            $(targetUl).stop().slideUp(300);
            $(targetUl).removeClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(0deg)');
            $(this).removeClass('active');
        }
      });
    });
  });
//-------------------------------- toggle end ------------------------------------------

    var page = 1;
    var perPage = 10;
    var search = "";
    var detaildata ;
    
    $("#search").on("click", function(){
    	
    	console.log($("#searchbar").val());
    	search = $("#searchbar").val();
    	console.log(search);
    	api();
    	
    });

    function api(){
    $.ajax({
        type : 'GET',
        url : '/copyrightsearch',
        data:{
            'page':page,
            'perPage':perPage,
            'search':search 
            
        },
        dataType:'JSON',
        success:function(data){
            //console.log(data);
            var content ='';

            data.data.forEach(function(item){
                content += '<li>';
                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
                content += '<div class="REG_ID">'+item.REG_ID+'</div>';
                content += '<div class="CONT_TITLE">'+"<h3 "+'onClick = "copyrightsearchdetail('+"'"+item.REG_ID+"','"+page+"','"+perPage+"'"+')">'+item.CONT_TITLE+"</h3>"+'</div>';
                content += '<div class="REG_DATE">'+item.REG_DATE+'</div>';
                //content += '</a>';
                content += '</li>';
            });
            $('#list').empty();
            $('#list').append(content);


        },error:function(e){
            console.log(e);
        }



    });
    
    }
    
    //---------------------등록------------------------
    /*
    $("#register").on("click", function(){
    	
    	var no = $("#searchbar").val();
    	var namae = $("#namae").val();
    	var name = $("#name").val();
    	var cont = $("#cont").val();
    	var exp = $("#exp").val();
    	var member = $("#member").val();
    	var price = $("#price").val();
    	
    	console.log(no,"/",namae,"/",name,"/",cont,"/",exp);
    	
    	location.href="copyrightregister?no="+no+"&namae="+namae+"&name="+name+"&cont="+cont+"&exp="+exp+"&member="+member+"&price="+price;
    	

    	
    });
    */
   	function copyrightsearchdetail(id,page,perpage){
   		
   	   $.ajax({
           type : 'GET',
           url : '/copyrightsearchdetail',
           data:{
               'page':page,
               'perPage':perPage,
               'search':id 
               
           },
           dataType:'JSON',
           success:function(data){
               console.log(data);
               var content ='';
               var i = 0;
               
               
				
               data.data.forEach(function(item){

                   detaildata = item.CONT_TITLE;
               });
                   console.log(detaildata);
                   const element = document.getElementById('namae');
                   element.value = detaildata;
                   
               

           },error:function(e){
               console.log(e);
           }



       });
       
   		
   	}

</script>
