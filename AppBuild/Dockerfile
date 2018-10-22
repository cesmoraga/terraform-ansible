# This Dockerfile is to test importing from a Dockerfile
FROM maven:3.5-jdk-8

ADD https://raw.githubusercontent.com/cesmoraga/terraform-ansible/master/AppBuild/key /tmp/key

WORKDIR /root

RUN eval "$(ssh-agent -s)" && ssh-add /tmp/key && ssh -o StrictHostKeyChecking=no -T git@gitlab.com && git clone git@gitlab.com:gausscontrol/legacy/hello-world.git

WORKDIR /root/hello-world
RUN mvn clean install

EXPOSE 3000

CMD ["java", "-Xms500m", "-Xmx2500m", "-jar", "target/dm-0.0.1-SNAPSHOT.jar"]

