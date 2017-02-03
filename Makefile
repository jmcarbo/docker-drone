NAME:=drone

#RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

hosts:
	cat ./etc/hosts | sudo tee -a /etc/hosts

clean: stop
	docker-compose -p ${NAME} rm -fv

pull:
	docker-compose -p ${NAME} pull

start: stop
	docker-compose -p ${NAME} up --remove-orphans

stop:
	docker-compose -p ${NAME} stop
