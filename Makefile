.PHONY: server

server:
	python3 -m http.server

.DEFAULT_GOAL := server
