
<img width="1326" alt="hoonymusic_login" src="https://github.com/amyseol/springboot-project-groupware/assets/141234899/ff754296-a002-464c-b7c9-d938be86fed1">

# 🎹 Hoony Music
### Description
음원/음반 유통 업체를 타겟으로 한 그룹웨어로, 기업 구성원 간의 협업과 원활한 업무 진행을 위한 웹 서비스 입니다. <br/>
그룹웨어가 제공하는 기본적인 서비스에 회의실/공연장 예약, 아티스트 관리, 음반/음원 관리, 저작권 관리, 실시간 음원 차트 서비스를 추가했습니다. 


### Contents
- [Tech Stacks](#tech-stacks)
- [주요 서비스](#주요-서비스)
- [내가 구현한 부분](#내가-구현한-부분)
- [How To Start](#how-to-start)

## Tech Stacks
Back-end : ![Java](https://img.shields.io/badge/java-v11-%23ED8B00?logo=openjdk&logoColor=%23ED8B00) 
![SpringBoot](https://img.shields.io/badge/SpringBoot-v2.7-%236DB33F?logo=springboot&logoColor=%236DB33F)
![MariaDB](https://img.shields.io/badge/MariaDB-v11.2-003545?logo=mariadb&logoColor=003545)
![JSP](https://img.shields.io/badge/JSP-%23323330?logo=JSP&logoColor=white) 
<br/>
Front-end : ![JavaScript](https://img.shields.io/badge/JavaScript-%23323330?logo=javascript&logoColor=%23F7DF1E)
![HTML5](https://img.shields.io/badge/HTML5-%23323330?logo=html5&logoColor=#E34F26)
![CSS3](https://img.shields.io/badge/CSS3-%23323330?logo=css3&logoColor=1572B6) 
<br/>
WAS : ![ApacheTomcat](https://img.shields.io/badge/Apache%20Tomcat-v9.0-F8DC75?logo=apachetomcat&logoColor=#F8DC75)

## 주요 서비스 
전자결재, 근태관리, 일정관리, 인사관리, 게시판, 공용자료실, 사내 메일, 알림 <br/>
회의실/공연장 예약, 아티스트 관리, 음반/음원 관리, 저작권 관리, 실시간 음원 차트

## 내가 구현한 부분
[공용 자료실](https://github.com/amyseol/springboot-project-groupware/tree/12c14a1340ac4384154c5ac454eb19f23c35ffdb/src/main/java/kr/co/gudi/archive) / [알림](https://github.com/amyseol/springboot-project-groupware/tree/12c14a1340ac4384154c5ac454eb19f23c35ffdb/src/main/java/kr/co/gudi/notification) / [음원 차트](https://github.com/amyseol/springboot-project-groupware/tree/12c14a1340ac4384154c5ac454eb19f23c35ffdb/src/main/java/kr/co/gudi/marketing) / [음반]()
- CRUD 기능 개발을 위한 REST API 설계 및 작성
- 세션에 저장된 DTO 정보를 기반으로 부서별 페이지 접근 통제 및 파일 등록/삭제 권한 설정
- 키워드 검색 조회 기능 구현
- 키워드 검색시 페이지 수를 고려하여 Pagination 처리
- 동적 데이터 조회를 위한 SQL문 작성
- 파일 다운로드 API를 생성하여 팀원들과 endpoint 공유
- Jsoup 라이브러리를 이용한 ‘멜론 음원 차트’ 웹 크롤링 작업
- 일정 기간이 지난 알림을 삭제하기 위해 Scheduler 를 이용한 배치 작업 설정
- 회차별 생산량과 판매량을 그래프로 시각화하기 위해 Chart.js 라이브러리 활용


##  How To Start
배포되지 않은 서비스이기 때문에 로그인 화면만 보여질 수 있습니다. 
```
# Clone the project:
git clone https://github.com/amyseol/springboot-project-groupware.git
cd springboot-project-groupware

# Install the dependencies:
mvn install

# Running the application:
./mvnw spring-boot:run

# localhost:8080 로 접속 
```
► MariaDB 서버에 SQL 스크립트로 데이터를 추가하고 실행할 수 있습니다. <br/>
SQL 스크립트 경로 : resources/sql/hoonymusic.sql <br/>

► 아래 계정으로 사이트 로그인이 가능합니다. <br/>
ID : hoony1 (hoony2, 3, 4,...) <br/>
Password : 1111

