build:
	docker build -t dev .

run:
	docker run -it --rm -v $(pwd)/src/:/opt/kea dev /bin/get-and-compile.sh
