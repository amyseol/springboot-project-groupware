<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset='utf-8' />
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

	<!-- 풀캘린더 라이브러리 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<!-- 날짜 및 시간 처리 라이브러리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	
	<!-- 아래 3줄 modal 관련 -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<!-- axios -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  </head>
    <script>
    var titleData;
    var startData;
    var endData;
    var contentData;
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: "ko",
            initialView: 'dayGridMonth',
            customButtons: {
                myCustomButton: {
                    text: "일정 추가하기",
                    click: function() {
                        // 부트스트랩 모달 열기
                        $("#exampleModal").modal("show");
                    }
                },
                mySaveButton: {
                    text: "저장하기",
                    click: async function() {
                        if (confirm("저장하시겠습니까?")) {
                            // 서버로 데이터 전송
                            $.ajax({
                                type: "GET",
                                url: "/save",
                                contentType: "application/json",
                                data:{
                                	'title':titleData,
                                	'start':startData,
                                	'end':endData,
                                	'content':contentData
                                },
                                dataType:'JSON',
                                success: function (response) {
                                    console.log(response); // 서버에서의 응답 확인
                                },
                                error: function (error) {
                                    console.error('Error while saving events:', error);
                                }
                            });
                        }
                    }
                }
            },
            headerToolbar: {
                left: 'prev,next today, myCustomButton',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek'
            }
            ,
            
//             events: function(info, successCallback, failureCallback) {
//                 $.ajax({
//                     type: 'GET',
//                     url: 'schedule/list', // 서버에서 데이터를 제공하는 엔드포인트 URL (실제 URL로 변경해야 함)
//                     dataType: 'json',
//                     success: function(response) {
//                         // 받은 데이터 처리
//                         console.log("ajax실행");
//                         console.log(response);
//                         response.list.forEach(function(event) {
//                             calendar.addEvent({
//                                 title: event.title,
//                                 start: event.start,
//                                 end: event.end,
//                                 content: event.content
//                             });
//                         });
//                         calendar.render(); 
//                     },
//                     error: function(err) {
//                         console.error('에러 발생:', err);
//                     }
//                 });
//             }

            
        });

        // '취소' 버튼 클릭 시 모달 닫기
        $('#exampleModal .btn-secondary').on('click', function() {
            $("#exampleModal").modal("hide");
        });
        
     // 'X' 클릭 시 모달 닫기
        $('#closeModalBtn').on('click', function() {
            $("#exampleModal").modal("hide");
        });

        // '추가' 버튼 클릭 시 처리할 부분 
        $('#addChanges').on('click', function() {
		    var eventData = {
		        title: $("#title").val(),
		        start: $("#start").val(),
		        end: $("#end").val(),
		        content: $("#content").val()
		    };
		    titleData = $("#title").val();
		    startData = $("#start").val();
		    endData = $("#end").val();
		    contentData = $('#content').val();
		
		    // 빈 값 입력 시 오류
		    if (
		        eventData.title == "" ||
		        eventData.start == "" ||
		        eventData.end == "" ||
		        eventData.content == ""
		    ) {
		        alert("입력하지 않은 값이 있습니다.");
		    } else if ($("#start").val() > $("#end").val()) {
		        alert("시간을 잘못 입력 하셨습니다.");
		    } else {
		        // 이벤트 추가
		        calendar.addEvent(eventData);
		
		        // 서버로 데이터 전송
		        $.ajax({
		            type: "GET",
		            url: "save",
		            contentType: "application/json",
		            data: $("addData").serialize(),
		            dataType: 'JSON',
		            success: function(response) {
		                console.log(response); // 서버에서의 응답 확인
		            },
		            error: function(error) {
		                console.error('Error while saving events:', error);
		            }
		        });
		
		        // 모달 닫기
		        $("#exampleModal").modal("hide");
		
		        // 입력 필드 초기화
		        $("#title").val("");
		        $("#start").val("");
		        $("#end").val("");
		        $("#content").val("");
		    }
		});

         calendar.render(); 
         fetchEvents();
         // db 에서 값을 SELECT해오는거 
    function fetchEvents() {
    	/*       var isChecked = $('.myCallender').prop('checked');
    	      var isCheckedrsv = $('.rsvCallender').prop('checked'); */
    	       $.ajax({
    	         url: 'list',
    	         data:{},
    	         dataType: 'json',
    	         success: function(data) {
    	            eventList = data.eventList;
    	          console.log(data.eventList);
    	          //풀캘린더 자체내에서 제공하는 일종의 함수? 이벤트추가할수있는거 
    	           calendar.addEventSource(eventList);
    	         },
    	         error: function(xhr, status, error) {
    	           console.error('에러 발생:', status, error);
    	         }
    	       });
    	     }
    });
    


    </script>

    
  <body style="padding:30px;">
    <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
      <!-- 부트스트랩 modal 부분 -->
    <!-- Modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">일정 추가하기</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
              id="closeModalBtn"
            >X</button>
          </div>
          <form id="addData">
          <div class="modal-body">
            일정이름 : <input type="text" id="title" name="title" /><br />
            일정내용 : <textarea id="content"></textarea><br/>
            시작시간 : <input type="datetime-local" id="start"  name="start"/><br />
            종료시간 : <input type="datetime-local" id="end" name="end" />
          </div>  
          </form>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button type="button" class="btn btn-primary" id="addChanges">
              추가
            </button>
          </div>
        </div>
      </div>
    </div>
    
    
    
    </body>
</html>