# UFO-Sightings-Tracker

## How to Use

This project is ever evolving. Please see Project Blog for details

### To run Backend

`cd app-ufo-sightings`

`docker-compose up -d server php mysql`

### To run shell

`docker exec -i -t app-ufo-sightings_server_1 sh`

`docker exec -i -t app-ufo-sightings_php_1 sh`

`docker exec -i -t app-ufo-sightings_mysql_1 sh`

### To run PHPUnit for Local Development

This is for running tests locally.PHPUnit will be called to run on demand. Instead of continuously with upon running of the container so it doesn't run in a loop and can be run when changes are detected upon committing to repository.

#### Installing PHPUnit

1. Run the docker Composer container with the command for executing the installation.
   1. `docker-compose run --rm composer require --dev phpunit/phpunit ^10`
2. Make sure the Backend is running with
   1. `docker-compose up -d server php mysql`
3. Check to see if PHPUnit is installed
   1. `./vendor/bin/phpunit --version`

NOTE: After executing the intallation of the PHPUnit files the container will exit so that it isn't left running.

### Installing PHPUnit

Inside PHP Container as shell
Run PHPUnit already installed on container

   1. Run php Docker Container shell
      1. `docker exec -i -t app-ufo-sightings_php_1 sh`
   2. Run PHPUnit
      1. `./vendor/bin/phpunit`
Or 
Outside PHP Container
1. `docker-compose run php ./vendor/bin/phpunit`

### Generate PHPUnit Configuration
1. `docker-compose run php ./vendor/bin/phpunit --generate-configuration`
Next: ### To run PHPUnit for Production

## Project Blog

[Update Oct 2, 2023](blog/20231002)

[Initial Attempt at a Code Challenge](blog/init.md)
