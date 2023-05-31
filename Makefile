
dep-vocode:
	npm link vocode


IMAGE_NAME=vocode-demo
IMAGE_VERSION=0.0.3

DOCKER_REGISTRY=yantao0527
DOCKER_VOCODE_DEMO=$(DOCKER_REGISTRY)/$(IMAGE_NAME):$(IMAGE_VERSION)

docker-build:
	docker build -t $(DOCKER_VOCODE_DEMO) .

docker-run:
	docker run -d --name vocode-demo \
		-p 3000:3000 \
		--env-file .env \
		$(DOCKER_VOCODE_DEMO)

LOCATION=us-central1
PROJECT_ID=ai-agents-386717
REPOSITORY_NAME=cloud-run-source-deploy
REGISTRY_PREFIX=$(LOCATION)-docker.pkg.dev/$(PROJECT_ID)/$(REPOSITORY_NAME)
GCLOUD_VOCODE_DEMO=$(REGISTRY_PREFIX)/$(IMAGE_NAME):$(IMAGE_VERSION)

gcloud-push:
	docker tag $(DOCKER_VOCODE_DEMO) $(GCLOUD_VOCODE_DEMO)
	docker push $(GCLOUD_VOCODE_DEMO)