#!/bin/bash
#================================================
# Variables and Functions
#================================================
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'


# arr[0]="How deep is your love?"
# arr[1]="You are doing a great job!"
# arr[2]="Marcelo is fired."
# arr[3]="Marcelo is hired."
# arr[4]="Super python mode engaged!!!!!"
# rand=$[$RANDOM % ${#arr[@]}]

# heading () {
# tput reset
# echo -e "${LIGHTPURPLE}##########################################################################################${NC}"
# echo -e "${LIGHTPURPLE}##########################################################################################${NC}"
# echo -e "${WHITE}  _____         __   
#  / ___/__ _____/ /__ / /____  ___    
# / /__/ _ '/ __/ / -_) __/ _ \/ _ \  Future Funder
# \___/\_,_/_/ /_/\__/\__/\___/_//_/  
# ${WHITE}"
# echo -e "${LIGHTPURPLE}##########################################################################################${NC}"
# echo -e "## ${WHITE} ${arr[$rand]}"
# echo -e "${LIGHTPURPLE}##########################################################################################${NC}"
# tput sgr0
# }

# description () {
#   echo -e ""
#   echo -e "${LIGHTCYAN}## $1${NC}\n "
#   tput sgr0
# }

message () {
  echo -e "${GREEN} ↳ $1${NC}\n"
  tput sgr0
}


# error () {
#   echo -e ""
#   echo -e "${RED}## $1${NC}"
#   echo -e ""
#   tput sgr0
# }

# heading

# # Get WordPress
# description "Cloning WordPress setup from: https://github.com/cuweb/docker-bedrock"

# if [ ! -d "wordpress" ]
# then
#     git clone git@github.com:cuweb/docker-bedrock.git wordpress
# else
#     message "WordPress Already Exists, Attempting to update"
#     (cd wordpress; git pull);
# fi

# # Get Laravel
# description "Cloning CU-API (Laravel) from : https://github.com/cuweb/cu-api"

# if [ ! -d "laravel" ]
# then
#     git clone git@github.com:cuweb/cu-api.git laravel --branch feature/docker
# else
#     message "Laravel Already Exists, Attempting to update"
#     (cd laravel; git pull);
# fi

# description "Building Docker Containers (docker-compose build) - This may take a while"
# docker-compose build

# description "All Done! See the Readme or CU Docs for commands";
# echo -e ""


if [ ! -d "wordpress" ]
then
    git clone git@github.com:cuweb/docker-wordpress.git wp
else
    message "WordPress Already Exists, Attempting to update"
    (cd wp; git pull);
fi

# Get Laravel
description "Cloning CU-API (Laravel) from : https://github.com/cuweb/cu-api"

if [ ! -d "laravel" ]
then
    git clone git@github.com:cuweb/cu-api.git laravel --branch feature/docker
else
    message "Laravel Already Exists, Attempting to update"
    (cd laravel; git pull);
fi


# git clone git@github.com:cuweb/docker-bedrock.git wordpress
# git clone git@github.com:cuweb/cu-api.git laravel --branch feature/docker


docker-compose build --no-cache
(cd wp; composer install)