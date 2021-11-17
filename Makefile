IMAGE_NAME=haskell-heroku-seed-project:latest

dbuild:
	docker build -t $(IMAGE_NAME) -f Dockerfile . -m 4g --progress=plain

drun:
	docker run -p 3000:3000 $(IMAGE_NAME)

hbuild:
	heroku container:push web

hdeploy: hbuild
	heroku container:release web
