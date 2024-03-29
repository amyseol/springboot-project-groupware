
<img width="1326" alt="hoonymusic_login" src="https://github.com/amyseol/springboot-project-groupware/assets/141234899/ff754296-a002-464c-b7c9-d938be86fed1">

# 🎹 Hoony Music
<span style="color: gray">진행 기간 : 2023.12 ~ 2024.01 (3주)</span><br/>
음원 유통사에서 활용할 수 있는 서비스를 제공하여 기업 구성원 간의 협업과 원활한 업무 진행을 지원하는 클라우드형 그룹웨어 입니다. <br/>

## 프로젝트 개요 
최근 인공지능(AI) 기술이 빠르게 발전하면서 AI를 활용한 음악 창작 스타트업들도 급성장하고 있습니다. <br/> 이에 따라 음원 관리 서비스에 대한 수요가 증가할 것으로 예상되며, 이러한 추세를 고려하여 음원 유통사에서 활용할 수 있는 서비스를 추가하였습니다. 

### Contents
- [개발 환경](#개발-환경)
- [주요 기능](#주요-기능)
- [내가 구현한 부분](#내가-구현한-부분)
- [How To Start](#how-to-start)

## 개발 환경 
Back-end : ![Java](https://img.shields.io/badge/JAVA-JDK%2011-%23ED8B00?logo=openjdk&logoColor=%23ED8B00) 
![SpringBoot](https://img.shields.io/badge/SpringBoot-v2.7-%236DB33F?logo=springboot&logoColor=%236DB33F)
![MariaDB](https://img.shields.io/badge/MariaDB-v11.2-003545?logo=mariadb&logoColor=003545) 
![MyBatis](https://img.shields.io/badge/MyBatis-%23323330)
![JSP](https://img.shields.io/badge/JSP-%23323330)
<br/>
Front-end : ![JavaScript](https://img.shields.io/badge/JavaScript-%23323330?logo=javascript&logoColor=%23F7DF1E)
![HTML5](https://img.shields.io/badge/HTML5-%23323330?logo=html5&logoColor=#E34F26)
![CSS3](https://img.shields.io/badge/CSS3-%23323330?logo=css3&logoColor=1572B6) 
<br/>
IDE : STS(Spring Tool Suite)<br/>

## 주요 기능  
### 그룹웨어 서비스 
- 메인페이지
    - 새 알림 갯수 확인, 프로필 이미지, 로그아웃 기능이 있는 상단 탑 메뉴
    - 그룹웨어 서비스에 접근 가능한 사이드바 
    - 출퇴근 관리, 일정, 공지사항, 실시간 음원차트 확인 
- 전자결재 
    - 새결재 진행으로 기안서, 휴가신청서 작성
    - 기안함에서 기안한 문서 리스트, 결재상태 확인
    - 결재함에서 결재 문서 리스트, 결재상태 확인
    - 결재함에서 제목 클릭하면 문서 상세보기 이동, 결재 승인/반려 처리
    - 참조함에서 내가 참조된 리스트, 결재상태 확인
    - 각 리스트를 기안자, 제목으로 검색하는 기능
- 근태관리 
    - 출결 관리 (출퇴근 시간 입력 기능)
    - 주별, 월별 누적 업무 시간 확인 
- 연차관리 
    - 총 연차, 사용 연차, 잔여 연차수 확인
    - 연도별 연차 사용 내역 확인
- 일정관리
    - 임원, 경영지원부만 '전사 일정' 등록
    - 부서별 '부서 일정' 등록
- 인사관리
    <br/><경영지원부, 임원만 접근 가능>
    - 신규 입사자 계정 생성, 수정
    - 신규 부서/팀 등록
    - 기존 부서/팀 수정, 삭제
- 게시판
    - 전사 게시판, 부서 게시판 리스트, 작성, 상세보기, 수정, 삭제 
    - 로그인한 계정에 해당하는 각 부서 게시판 조회 기능
- 공용자료실
    - 경영지원부서만 전사 파일 등록, 다운로드, 삭제 
    - 부서별 파일 등록, 다운로드, 삭제  (타부서는 접근 불가)
    - 사용자 본인이 작성한 파일만 삭제 
- 사내 메일
    - 파일 첨부를 포함한 메일 작성 (사내에서만 사용 가능)
    - 주소록에서 등록된 직원 정보를 가져와 '받는 사람'에 추가 
    - 받은 메일함, 보낸 메일함 리스트(읽음/안읽음 필터링), 상세보기, 파일 다운로드
    - 메일을 선택하여 삭제
    - 전체 메일과 안읽은 메일의 수 확인
- 알림 
    - 새로운 메일은 노란색으로 블링크 효과 
    - 부서 일정 등록시 해당 부서원들한테 알림 표시
    - 전사 일정 등록시 전직원에게 알림 표시
    - 회의실/공연장 예약시 경영지원부 담당자에게 알림 표시 
    - 알림을 선택하여 삭제 
    - 발생 후 7일이 지난 알림은 매일 새벽 3시에 자동 삭제 
### 추가 서비스 
- 회의실 / 공연장 예약
    - 예약 신청하면 승인 대기 리스트에 추가 
    - 경영지원부에서 승인하면 예약 완료 리스트에 추가 
    - 경영지원부는 등록 대기 리스트에서 승인, 취소
- 아티스트관리
    - 아티스트 이름과 소속사 등록
    - 아티스트 이름 클릭시 음반 목록 확인
- 음반관리
   <br/> <마케팅부의 광고팀, 운영부의 계약 관리팀, 임원만 접근 가능>
    - 음반 계약 현황 리스트, 음반명으로 검색하는 기능
    - 제목 클릭시 상세보기 이동 
    - 상세보기 - 생산 회차별 판매량/재고량 차트 확인, 계약서 다운로드 가능 
    - 상세보기 - 계약 취소, 추가 생산 클릭시 기안서 페이지로 이동
- 실시간 음원 차트  
    - 멜론 실시간 음원 차트 확인
    - 소속 아티스트의 음원 차트만 필터링하는 기능
- 저작권관리 (진행중)
    - 아티스트의 음원에 대한 저작권 관리
- 실적 관리 
    - 음반 실적 리스트, 음반명/아티스트명 검색
    - 저작권 실적 관리 (진행중)
## 내가 구현한 부분
- <span style="line-height:33px"> **CRUD 기능을 위한 REST API 설계 및 작성** </span>
    - 세션에 저장된 DTO 정보를 기반으로 부서별 페이지 접근 권한 설정
    - 키워드 검색 조회 기능 구현
    - 키워드 검색시 페이지 수를 고려하여 Pagination 구현
    - 동적 데이터 조회를 위한 SQL 문 작성
- <span style="line-height:33px"> **공용자료실** </span>
    - 기능 : 리스트, 부서 파일 업로드, 전사 파일 업로드, 삭제 - [코드보기](https://github.com/amyseol/springboot-project-groupware/blob/main/src/main/java/kr/co/gudi/archive/service/ArchiveService.java)
    - 파일 다운로드 API 를 생성하여 팀원들과 endpoint 공유 
    - 세션에 저장된 DTO 정보를 기반으로 파일 등록/삭제 권한 설정
- <span style="line-height:33px"> **음원관리** </span>
    - 기능 : 리스트, 상세보기, 회차별 그래프 - [코드보기](https://github.com/amyseol/springboot-project-groupware/blob/main/src/main/java/kr/co/gudi/resource/service/AlbumService.java)
    - 회차별 생산량과 판매량을 그래프로 시각화하기 위한 Chart.js 라이브러리 활용 
- <span style="line-height:33px"> **실시간 음원 차트** </span>
    - Jsoup 라이브러리를 이용한 ‘멜론 음원 차트’ 웹 크롤링 작업 - [코드보기](https://github.com/amyseol/springboot-project-groupware/blob/main/src/main/java/kr/co/gudi/marketing/service/MusicChartService.java)
- <span style="line-height:33px"> **알림** </span>
    - 기능 : 리스트, 알림 확인 여부, 새로운 알림수, 삭제 - [코드보기](https://github.com/amyseol/springboot-project-groupware/blob/main/src/main/java/kr/co/gudi/notification/service/NotiService.java)
    - 일정 기간이 지난 알림을 삭제하기 위해 Spring Scheduler 를 이용한 배치 작업
- <span style="line-height:33px"> **보안 설정** [Refactoring] </span>
    - 페이지별 접근 권한 설정을 위해 Security Config 설정 추가 - [코드보기](https://github.com/amyseol/springboot-project-groupware/blob/main/src/main/java/kr/co/gudi/member/config/Security.java)
    - 인사 관리 페이지는 경영지원부, 임원만 접근 가능하게 설정
    - 음반 관리 페이지는 마케팅부의 광고팀, 운영부의 계약 관리팀, 임원만 접근 가능하게 설정 
## How To Start
배포되지 않은 서비스이기 때문에 로그인 화면만 보여질 수 있습니다. <br/>
```ini
# Clone the project:
git clone https://github.com/amyseol/springboot-project-groupware.git
cd springboot-project-groupware

# Install the dependencies:
mvn install

# Run the application:
./mvnw spring-boot:run
```
- 구동 후, 브라우저에서 http://localhost:8080/ 로 확인이 가능합니다. 
- 로컬 환경에서 MariaDB 를 사용했으며 /src/main/resources/application.properties 파일의 datasource 항목에서 DB 설정을 변경할 수 있습니다. 
- SQL 스크립트(DDL, DML 포함)인 resources/sql/hoonymusic.sql 파일로 데이터를 추가하고 실행할 수 있습니다. 
- 아래 계정으로 사이트 로그인이 가능합니다. 
    - ID : hoony1(임원), hoony2(경영지원부), hoony3(마케팅부), hoony4(운영부)
    - Password : 1111
