#!/bin/bash
set -x

deploy () {
    aws cloudformation deploy --template-file template/${service}.yaml --stack-name ${Name}-${service} \
      --parameter-overrides Name=${Name} \
      --region ${AWS_DEFAULT_REGION} --force-upload --no-fail-on-empty-changeset
}

destroy () {
    aws cloudformation delete-stack --stack-name ${Name}-${service} --region ${AWS_DEFAULT_REGION}
    aws cloudformation wait stack-delete-complete --stack-name ${Name}-${service} --region ${AWS_DEFAULT_REGION}
}

$@