FROM gradle as build-jar-stage
RUN mkdir /home/gradle/work
WORKDIR /home/gradle/work
ADD --chown=gradle . .
RUN gradle build

FROM oracle/graalvm-ce:1.0.0-rc14 as build-native-stage
WORKDIR /work
COPY --from=build-jar-stage /home/gradle/work/build/libs/native-javalin-1.0.0.jar ./native-javalin.jar
COPY --from=build-jar-stage /home/gradle/work/reflection.json .
RUN native-image -jar ./native-javalin.jar -H:ReflectionConfigurationFiles=reflection.json --static

FROM alpine
WORKDIR /app
COPY --from=build-native-stage /work/native-javalin .
CMD ./native-javalin

