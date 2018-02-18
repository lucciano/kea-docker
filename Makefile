build:
	docker build -t kea-dev .

run:
	docker run -it --rm -v $(CURDIR)/src/:/opt/kea kea-dev /bin/get-and-compile.sh
