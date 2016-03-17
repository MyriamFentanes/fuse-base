#This is a comment
FROM mfentanes/jboss-base 
MAINTAINER Myriam Fentanes <mfentane@redhat.com>

ENV JBOSS_HOME /software
ENV SOFT_HOME /opt/jboss/
ENV ADMIN_PASSWORD jboss!123

ADD jboss-fuse-full-6.2.0.redhat-133.zip $SOFT_HOME
WORKDIR $SOFT_HOME

RUN  unzip $SOFT_HOME/jboss-fuse-full-6.2.0.redhat-133.zip \
    && mkdir $JBOSS_HOME \
    && mv jboss-fuse-6.2.0.redhat-133 $JBOSS_HOME \
    && rm -rf * \
    && chown -R jboss:jboss $JBOSS_HOME \
    && echo admin:$ADMIN_PASSWORD,admin,manager,viewer,Monitor, Operator, Maintainer, Deployer, Auditor, Administrator, SuperUser > $JBOSS_HOME/jboss-fuse-6.2.0.redhat-133/etc/users.properties
USER jboss
WORKDIR $JBOSS_HOME/jboss-fuse-6.2.0.redhat-133/bin
EXPOSE 8181
CMD ["./fuse"]
