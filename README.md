
<img width="1326" alt="hoonymusic_login" src="https://github.com/amyseol/springboot-project-groupware/assets/141234899/ff754296-a002-464c-b7c9-d938be86fed1">

# 🎹 Hoony Music
<p style="color:grey;">진행 기간 : 2023.12~2024.01 (3주)</p>
음원 유통사에서 활용할 수 있는 서비스를 제공하여 기업 구성원 간의 협업과 원활한 업무 진행을 지원하는 클라우드형 그룹웨어 입니다. <br/>

## 프로젝트 개요 
최근 인공지능(AI) 기술이 빠르게 발전하면서 AI를 활용한 음악 창작 스타트업들도 급성장하고 있습니다. <br/> 이에 따라 음원 관리 서비스에 대한 수요가 증가할 것으로 예상되며, 이러한 추세를 고려하여 음원 유통사에서 활용할 수 있는 서비스를 추가하였습니다. 

### Contents
- [Tech Stacks](#tech-stacks)
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
전자결재, 근태관리, 일정관리, 인사관리, 게시판, 공용자료실, 사내 메일, 알림 <br/>
회의실/공연장 예약, 아티스트관리, 음반관리, 음원관리, 저작권관리, 실시간 음원 차트

## 내가 구현한 부분
- **CRUD 기능을 위한 REST API 설계 및 작성** 
    - 세션에 저장된 DTO 정보를 기반으로 부서별 페이지 접근 권한 설정
    - 키워드 검색 조회 기능 구현
    - 키워드 검색시 페이지 수를 고려하여 Pagination 구현
    - 동적 데이터 조회를 위한 SQL 문 작성
- **공용자료실** 
    - 파일 다운로드 API 를 생성하여 팀원들과 endpoint 공유
    - 세션에 저장된 DTO 정보를 기반으로 파일 등록/삭제 권한 설정 
- **음원관리** 
    - 회차별 생산량과 판매량을 그래프로 시각화하기 위한 Chart.js 라이브러리 활용
- **실시간 음원 차트** 
    - Jsoup 라이브러리를 이용한 ‘멜론 음원 차트’ 웹 크롤링 작업
- **알림** 
    - 일정 기간이 지난 알림을 삭제하기 위해 Spring Scheduler 를 이용한 배치 작업

## How To Start
배포되지 않은 서비스이기 때문에 로그인 화면만 보여질 수 있습니다. 
```ini
# Clone the project:
git clone https://github.com/amyseol/springboot-project-groupware.git
cd springboot-project-groupware

# Install the dependencies:
mvn install

# Run the application:
./mvnw spring-boot:run
```
- 로컬 환경에서 MariaDB 를 사용했으며, application.properties 에서 datasource 설정을 변경할 수 있습니다. 
- 아래 SQL 스크립트(DDL, DML 포함)로 데이터를 추가하고 실행할 수 있습니다. 
    - SQL 스크립트 경로 : resources/sql/hoonymusic.sql 
- 아래 계정으로 사이트 로그인이 가능합니다. 
    - ID : hoony1 
    - Password : 1111

