export Name=catalog-containers
export AWS_DEFAULT_REGION=us-east-1

deploy:
	@export service=${service} && ./scripts/test.sh deploy

destroy:
	@./scripts/test.sh destroy ${service}