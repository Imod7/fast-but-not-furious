#!/bin/bash

BLUE="\x1b[38;2;40;177;249m"
GREEN="\x1b[38;2;80;200;120m"
YELLOW="\x1b[38;2;253;253;150m"
RESET="\e[0m"

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


/Applications/Firefox.app/Contents/MacOS/firefox --new-window

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
        /Applications/Firefox.app/Contents/MacOS/firefox --new-tab $argsRepos
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
      /Applications/Firefox.app/Contents/MacOS/firefox --new-tab $argsRepos
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
        /Applications/Firefox.app/Contents/MacOS/firefox --new-tab $argsRepos
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
    /Applications/Firefox.app/Contents/MacOS/firefox --new-tab $argsSearchs
    printf "  $argsSearchs \n"
  done
done
