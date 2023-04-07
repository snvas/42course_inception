
SRC = cd srcs/
DOMAIN = 127.0.0.1       snovaes.42.fr
LOOKDOMAIN = $(shell grep "${DOMAIN}" /etc/hosts)

all: hosts build up

build: hosts
	${SRC} && docker-compose build
	sudo mkdir -p /home/snovaes/data/database
	sudo mkdir -p /home/snovaes/data/wordpress

up:
	${SRC} && docker-compose up -d

hosts:
	@if [ "${DOMAIN}" = "${LOOKDOMAIN}" ]; then \
		echo "Host already set"; \
	else \
		cp /etc/hosts ./hosts_bkp; \
		sudo rm /etc/hosts; \
		sudo cp ./srcs/requirements/tools/hosts /etc/hosts; \
	fi

down:
	${SRC} && docker-compose down

re: fclean all

fclean: down
	sudo mv ./hosts_bkp /etc/hosts || echo "hosts_bkp does not exist"
	docker system prune -a --volumes
	sudo rm -fr /home/snovaes/data