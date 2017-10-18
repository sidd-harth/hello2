FROM java
MAINTAINER Siddharth Barahalikar - barahalikar.siddharth@gmail.com
ADD /zzz-hello-0.1.jar //
ENTRYPOINT ["java", "-jar", "/zzz-hello-0.1.jar"]
