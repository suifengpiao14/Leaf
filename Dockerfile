FROM maven:3-jdk-8-alpine AS builder
WORKDIR /data
COPY . .
# 保存 maven 构造环境
#VOLUME  ["/root/.m2"]
RUN mvn clean package -B -DskipTests


FROM openjdk:8-jre
ENV TZ=Asia/Shanghai LANG=C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /data
COPY --from=builder /data/leaf-server/target/leaf.jar .
ENV SEGMENT_ENABLE=true JDBC_URL=mysql.service:3306/leaf JDBC_USERNAME=root JDBC_PASSWORD=123456 
CMD ["java","-jar","leaf.jar"]
