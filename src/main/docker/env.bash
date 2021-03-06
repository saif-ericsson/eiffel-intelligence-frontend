#!/usr/bin/env bash

if [[ "${DOCKER_HOST}" ]]; then
  export HOST=$(echo ${DOCKER_HOST} | sed -e 's|^tcp\://||;s|:.*$||');
else
  export HOST=$(hostname -I | tr " " "\n"| head -1);
  echo "Docker Host IP: $HOST"
fi

export MONGODB_IMAGE="mongo:latest"
export RABBITMQ_IMAGE="bitnami/rabbitmq:3.7.8-debian-9"
export EIFFEL_ER_IMAGE="eiffelericsson/eiffel-er:0.0.67"
export MAILSERVER_IMAGE="mailhog/mailhog"
export REMREM_GENERATE_IMAGE="eiffelericsson/eiffel-remrem-generate:1.0.0"
export REMREM_PUBLISH_IMAGE="eiffelericsson/eiffel-remrem-publish:1.0.0"
export JENKINS_IMAGE="bitnami/jenkins:2.138.3"
export EI_BACKEND_IMAGE="eiffelericsson/eiffel-intelligence-backend:1.0.1"
export EI_FRONTEND_IMAGE="eiffelericsson/eiffel-intelligence-frontend:1.0.1"

export MONGODB_PORT=27017
export RABBITMQ_AMQP_PORT=5672
export RABBITMQ_WEB_PORT=15672
export EIFFEL_ER_PORT=8084
export JENKINS_PORT=8082
export MAIL_SMTP_PORT=1025
export MAIL_WEB_PORT=8025
export REMREM_GENERATE_PORT=8095
export REMREM_PUBLISH_PORT=8096
export EI_BACKEND_ARTIFACT_PORT=8070
export EI_BACKEND_SOURCECHANGE_PORT=8072
export EI_BACKEND_TESTEXECUTION_PORT=8074
export EI_FRONTEND_PORT=8081


export EI_INSTANCES_LIST="[\
{ \"contextPath\": \"\", \"port\": \"8080\", \"name\": \"ei-backend-artifact\", \"host\": \"ei-backend-artifact\", \"https\": false, \"defaultBackend\": true},\
{ \"contextPath\": \"\", \"port\": \"8080\", \"name\": \"ei-backend-sourcechange\", \"host\": \"ei-backend-sourcechange\", \"https\": false, \"defaultBackend\": false},\
{ \"contextPath\": \"\", \"port\": \"8080\", \"name\": \"ei-backend-testexecution\", \"host\": \"ei-backend-testexecution\", \"https\": false, \"defaultBackend\": false}\
]"

export REMREM_PUBLISH_RABBITMQ_INSTANCES_LIST="[\
{ \"mp\": \"eiffelsemantics\", \"host\": \"rabbitmq\", \"port\": \"5672\", \"username\": \"myuser\", \"password\": \"myuser\", \"tls\": \"\", \"exchangeName\": \"ei-exchange\", \"domainId\": \"ei-domain\" }\
]"