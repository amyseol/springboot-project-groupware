<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>계정 생성</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7f33f996b442a5d86588bc9173489c3&libraries=services" type="text/javascript"></script>
<style>
    table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    .phoneBox{
    	width:50px;
    }
</style>
</head>
<body>
<form action="join" method="post" enctype="multipart/form-data">
     <table>
     	<tr>
             <th>
        		 <img id="idImage" src="#" alt="ID Image Preview" style="max-width: 70px; max-height: 100px;"/>
   			 </th>   
   			 <th>
       			 <input type="file" name="uploadFile" accept="image/*" onchange="previewImage(this, 'idImage')"/>
   			 </th>  	
     	</tr>
         <tr>
             <th>PW</th>
             <th>
                 <input type="password" name="pw"/>
             </th>
         </tr>
         <tr>
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" name="name"/>
             </th>
         </tr>
         <tr>
             <th>성별</th>
             <th>
                 <input type="radio" name="gender" value="남" 
                     checked/>남
                 <input type="radio" name="gender" value="여"/>여
             </th>
         </tr>
         <tr>
             <th>생년월일</th>
             <th>
                 <select id="birthYearSelect" name="birthY">
                 </select>년
                 <select id="birthMonthSelect" name="birthM">
                 </select>월
                 <select id="birthDaySelect" name="birthD">
                 </select>일
             </th>
         </tr>
         <tr>
             <th>연락처</th>
             <th>
                 <input type="text" class="phoneBox" name="phone1" readonly value="010"/>-
                 <input type="text" class="phoneBox" name="phone2"/>-
                 <input type="text" class="phoneBox" name="phone3" />                        
             </th>
         </tr>
         <tr>
             <th>이메일</th>
             <th>
                 <input type="text" class="emailBox" name="email1"/>@
                 <select name="email2">
                 	<option>gmail.com</option>
                 	<option>naver.com</option>
                 	<option>hanmail.com</option>
                 </select>
             </th>
         </tr>
         <tr>
			<th>주소</th>
			<th>
					<input type="text" class="radio-value-detail" id="addr_kakao" name="address" readonly>
					<button id="addr" onclick="showMap(event)">주소찾기</button>	
			</th>		
		</tr>
			<tr>
				<th>상세 주소</th>
				<th><input type="text" class="radio-value-detail" name="address_detail" placeholder="상세주소를 입력해 주세요."></th>
			</tr>
         <tr>
             <th>입사일</th>
             <th>
                 <select id="yearSelect" name="hiredY">
                 </select>년
                 <select id="monthSelect" name="hiredM">
                 </select>월
                 <select id="daySelect" name="hiredD">
                 </select>일
             </th>
         </tr>
         <tr>
          <th>직급</th>
             <th>
                 <select name="member_position">
                 	<option>사원</option>
                 	<option>대리</option>
                 	<option>과장</option>
                 	<option>팀장</option>
                 	<option>부장</option>
                 	<option>이사</option>
                 	<option>대표</option>
                 </select>
             </th>
         </tr>
         <tr>
          <th>부서</th>
             <th>
                 <select id="selectedDptno" name="depart_name">
            		<c:forEach items="${depart}" var="department">
            		<c:if test="${department.depart_p_no eq 0}">
                	<option value="${department.depart_no}">${department.depart_name}</option>
            		</c:if>
            		</c:forEach>
        		</select>
             </th>
         </tr>
         <tr>
          <th>팀</th>
             <th>
                 <select id="teamSelect" name="team_name">      
                 </select>
             </th>
         </tr>
         <tr>
             <th colspan="2">
             	 <button type="button" onclick="cancelForm()">취소</button>
                 <input type="submit" value="생성"/>
             </th>
         </tr>
     </table>
 </form>
</body>
<script>
var depart_no=1;

$('#selectedDptno').change(function(){
	console.log($(this).val());
	depart_no = $(this).val();
	
	 $.ajax({
	        type: "POST",
	        url: "teamList",
	        data: { 'depart_no': depart_no },
	        success: function(data) {
	        	console.log(data);
	        	 // 받아온 데이터를 이용하여 옵션을 동적으로 생성 및 추가
	            var select = $('#teamSelect');  // teamSelect는 셀렉트 태그의 ID
	            select.empty();  // 기존 옵션 제거

	            // data를 반복하면서 옵션을 생성 및 추가
	            for (var i = 0; i < data.length; i++) {
	                var option = $('<option>').text(data[i].depart_name);
	                select.append(option);
	        }
	    });
});
//주소API id="addr_kakao"
function showMap(event){
	event.preventDefault();
    //카카오 지도 발생
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
            document.getElementById("addr_kakao").value = data.address; // 주소 넣기              
            console.log('도로명주소 : ' + data.roadAddress);
            document.querySelector("input[name=addr_detail]").focus(); //상세입력 포커싱                
        }
    }).open();
}

// 취소 -> 페이지 이동
function cancelForm() {
    window.location.href = '/';
}

//현재 년도, 월, 일 가져오기
var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = currentDate.getMonth() + 1; // JavaScript에서 월은 0부터 시작하므로 +1 해줍니다.
var currentDay = currentDate.getDate();

//생년월일 -> 년

var birthYearSelect = document.getElementById("birthYearSelect");

for (var i = currentYear; i >= currentYear - 50; i--) {
    var yearOption = document.createElement("option");
    yearOption.value = i;
    yearOption.text = i;
    birthYearSelect.add(yearOption);
}

// 옵션을 추가할 셀렉트 엘리먼트에 접근
var yearSelect = document.getElementById("yearSelect");
var monthSelect = document.getElementById("monthSelect");
var daySelect = document.getElementById("daySelect");
var birthMonthSelect = document.getElementById("birthMonthSelect");
var birthDaySelect = document.getElementById("birthDaySelect");

// 현재 년도만 옵션으로 추가
var yearOption = document.createElement("option");
yearOption.value = currentYear;
yearOption.text = currentYear;
yearSelect.add(yearOption);

// 1월부터 12월까지 월 옵션 추가
for (var i = 1; i <= 12; i++) {
    var monthOption = document.createElement("option");
    monthOption.value = i < 10 ? "0" + i : "" + i; // 한 자리 수일 경우 앞에 0 추가
    monthOption.text = i < 10 ? "0" + i : "" + i;
    monthSelect.add(monthOption);
 
    var birthMonthOption = document.createElement("option");
    birthMonthOption.value = i < 10 ? "0" + i : "" + i;
    birthMonthOption.text = i < 10 ? "0" + i : "" + i;
    birthMonthSelect.add(birthMonthOption);
}

// 1일부터 31일까지 일 옵션 추가
for (var i = 1; i <= 31; i++) {
    var dayOption = document.createElement("option");
    dayOption.value = i < 10 ? "0" + i : "" + i; // 한 자리 수일 경우 앞에 0 추가
    dayOption.text = i < 10 ? "0" + i : "" + i;
    daySelect.add(dayOption);
    
    var birthDayOption = document.createElement("option");
    birthDayOption.value = i < 10 ? "0" + i : "" + i;
    birthDayOption.text = i < 10 ? "0" + i : "" + i;
    birthDaySelect.add(birthDayOption);
}

// 현재 년, 월, 일을 선택한 상태로 설정
yearSelect.value = currentYear;
monthSelect.value = currentMonth < 10 ? "0" + currentMonth : "" + currentMonth;
birthMonthSelect.value = currentMonth < 10 ? "0" + currentMonth : "" + currentMonth;
daySelect.value = currentDay < 10 ? "0" + currentDay : "" + currentDay;
birthDaySelect.value = currentDay < 10 ? "0" + currentDay : "" + currentDay;

// 사진 업로드&미리보기
function previewImage(input, imageId) {
    var fileInput = input;
    var imageElement = document.getElementById(imageId);

    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            imageElement.src = e.target.result;
        };

        reader.readAsDataURL(fileInput.files[0]);
    }
}
</script>
</html>