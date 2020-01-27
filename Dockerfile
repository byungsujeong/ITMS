FROM tomcat:8.5.45
#톰캣서버 기본으로 돌아가는 프로그램(이미지)

RUN rm -rf /usr/local/tomcat/webapps/ROOT
#톰캣의 기본 서버 어플을 삭제하고 (톰캣초기화면) 비워주는 것.

COPY ./target/ITMS-1.0.0-BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
#카피 복사 할 파일경로/이름.. 을 /usr/local/tomcat/webapps/ROOT.war 로 복사시킴
COPY ./target/ITMS-1.0.0-BUILD-SNAPSHOT /usr/local/tomcat/webapps/ROOT
#만들어놓은 메이븐 패키지 파일을 루트로 복사하여 기본으로 잡아준다.
EXPOSE 8080
#포트는 8080으로 열어주삼~