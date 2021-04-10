FROM apache/skywalking-oap-server:8.4.0-es6
# 时区修改为东八区,自定义Alarm-setting规则
RUN apk add --no-cache tzdata
ENV TZ=Asia/Shanghai
COPY alarm-settings.yml /skywalking/config
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chmod 755 /skywalking/config/*