APP_NAME=golang-dev
APP_DIR=.

.PHONY: dev build-dev air prod build-prod run-prod

dev: build-dev air

build-dev:
	docker build -t golang-dev -f Dockerfile.dev .

air:
	docker run --rm -v $(PWD):/app -w /app -p 8080:8080 golang-dev

prod: build-prod run-prod

build-prod:
	docker build -t go-backend-prod -f $(APP_DIR)/Dockerfile $(APP_DIR)

run-prod:
	docker run -p 8080:8080 go-backend-prod
