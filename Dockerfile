FROM mattrayner/lamp:latest-1804
MAINTAINER ArunG
RUN whoami
USER root
RUN whoami
COPY . /app
RUN usermod -a -G www-data root
RUN usermod -a -G root www-data
RUN usermod -a -G staff root

RUN mkdir myspace
COPY . /myspace
# install AppDynamics PHP Agent
ENV APP_AGENT_HOME /myspace/appdynamics-4.5.18
RUN /bin/bash -c 'ls -la ${APP_AGENT_HOME}/logs; chmod -R 755 ${APP_AGENT_HOME}; chown -R root:root ${APP_AGENT_HOME}/logs;ls -la ${APP_AGENT_HOME}/logs'
RUN ${APP_AGENT_HOME}/install.sh -s  -a=e2e-customer@562aa64c-d0a1-4d85-b3e6-6047972032a0 --log-dir=/tmp master-saas-controller.e2e.appd-test.com 443 PHP_Regex regex proc1
RUN cp /etc/php/7.3/cli/conf.d/appdynamics_agent.ini /etc/php/7.3/apache2/conf.d/
CMD ["/run.sh"]
