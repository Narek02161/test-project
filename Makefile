# пересобирает контейнеры подготавливает базу для дев разработки
init: rebuild composer-install fresh-migrate db-seed

# собирает контейнеры
up:
	docker-compose -f docker-compose.yml up -d
# Останавливает контейнеры и удаляет контейнеры, сети, тома и образы, созданные через up
down:
	docker-compose -f docker-compose.yml down --remove-orphans
# пересобрать или перезапустить контейнеры
rebuild:
	docker-compose -f docker-compose.yml up -d --build

# команды для инициализации dev среды
composer-install:
	docker exec -t  server-php composer install
fresh-migrate:
	docker exec -t  server-php php artisan migrate:fresh
db-seed:
	docker exec -t  server-php  php artisan db:seed

