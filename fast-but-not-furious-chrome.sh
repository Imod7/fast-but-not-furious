#!/bin/bash

BLUE="\x1b[38;2;40;177;249m"
GREEN="\x1b[38;2;80;200;120m"
YELLOW="\x1b[38;2;253;253;150m"
RESET="\e[0m"

# To implement flags like : 
# 1. flag -o  : Search in other blockchains eg. ethereum 
# 2. flag -rc : relaychain -  only Polkadot related searches
# 3. flag -p  : parachains - executes also parachain related searches
# Add Search for 
# Polkadot Watercooler element room
# Parachain Technical
# Substrate Technical (Public)


printf $YELLOW
cat ascii.txt 
printf $RESET

i=0
for var in "$@"
do
  KEYWORDS[$i]=$var
  i=$(($i+1))
done

# Define the organizations
ORGS=('paritytech' 'polkadot-js' 'substrate-developer-hub')
# Repos in the Parity tech org
PARITY_TECH=('substrate' 'polkadot' 'txwrapper-core' 'substrate-api-sidecar')
# Repos to search in the Substrate Developer Hub org
DEVHUB=('substrate-docs' 'awesome-substrate')
# When searching on the web, include also this keyword to specify the search
WEB=('substrate' 'polkadot+wiki' 'polkadot-js' 'substrate+dev+hub')


printf "\n$BLUE Searching in Github Repos $RESET \n"

for org in "${ORGS[@]}";
do
  printf "$GREEN  Org : $org $RESET \n"
  # Searching in Parity Tech Repos
  if [[ "$org" == "paritytech" ]]; then
    for repo in "${PARITY_TECH[@]}";
    do
      for keyword in "${KEYWORDS[@]}";
      do
        argsRepos="https://github.com/$org/$repo/search?q=$keyword"
        sleep 0.5
        open -a "Google Chrome" $argsRepos
        printf "   $argsRepos \n"
      done
    done
  fi
  # Searching in Polkadot JS Repos
  if [[ "$org" == "polkadot-js" ]]; then
    for keyword in "${KEYWORDS[@]}";
    do
      argsRepos="https://github.com/$org/api/search?q=$keyword"
      sleep 0.5
      open -a "Google Chrome" $argsRepos
      printf "   $argsRepos \n"
    done
  fi
  # Searching in Substrate Developer Hub Repos
  if [[ "$org" == "substrate-developer-hub" ]]; then
    for repo in "${DEVHUB[@]}";
    do
      for keyword in "${KEYWORDS[@]}";
      do
        argsRepos="https://github.com/$org/$repo/search?q=$keyword"
        sleep 0.5
        open -a "Google Chrome" $argsRepos
        printf "   $argsRepos \n"
      done
    done
  fi
done

# Searching in the web
printf "\n$BLUE Searching in the WEB $RESET \n"
for search in "${WEB[@]}";
do
  for keyword in "${KEYWORDS[@]}";
  do
    argsSearchs="https://duckduckgo.com/?q=$search+$keyword"
    sleep 0.5
    open -a "Google Chrome" $argsSearchs
    printf "  $argsSearchs \n"
  done
done

# Searching in Substrate Stack Exchange
printf "\n$BLUE Searching in Substrate Stack Exchange $RESET \n"
for keyword in "${KEYWORDS[@]}";
do
  argsSearchs="https://substrate.stackexchange.com/search?q=$keyword"
  sleep 0.5
  open -a "Google Chrome" $argsSearchs
  printf "  $argsSearchs \n"
done

# Searching in Parity's Forum
printf "\n$BLUE Searching in Parity's Forum $RESET \n"
for keyword in "${KEYWORDS[@]}";
do
  argsSearchs="https://forum.parity.io/search?q=$keyword"
  sleep 0.5
  open -a "Google Chrome" $argsSearchs
  printf "  $argsSearchs \n"
done


