run:
	-@docker compose -f ./docker-compose.yml --env-file .env up -d

rm:
	-@docker compose -f ./docker-compose.yml --env-file .env stop
	-@docker compose -f ./docker-compose.yml --env-file .env rm -f

re-run:
	-@docker compose -f ./docker-compose.yml --env-file .env stop
	-@docker compose -f ./docker-compose.yml --env-file .env rm -f
	-@docker compose -f ./docker-compose.yml --env-file .env up -d

logs:
	-@docker logs fluent-bit --tail 20
