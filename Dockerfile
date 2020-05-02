FROM maven:3-jdk-8-alpine AS builder
WORKDIR /data
RUN git clone --depth 1 https://github.com/Meituan-Dianping/Leaf.git /data
RUN git rev-parse HEAD
ADD leaf.properties /source/leaf-server/src/main/resources/leaf.properties
RUN mvn clean install -DskipTests


FROM openjdk:8-jre
ENV TZ=Asia/Shanghai LANG=C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
WORKDIR /data
COPY --from=builder /data/leaf-server/target/leaf.jar .
CMD ["java","-jar","leaf.jar"]
