#!/bin/bash
set -e
set -o pipefail

if [[ -z "$INPUT_ADMIN_USERNAME" ]]; then
  echo "Admin user name - ADMIN_USERNAME - not set."
  exit 1
fi

if [[ -z "$INPUT_ADMIN_PASSWORD" ]]; then
  echo "Admin password - ADMIN_PASSWORD - not set."
  exit 1
fi


main() {
    echo "Logging into tenant using O365 CLI..."
    o365 login --authType password --userName $INPUT_ADMIN_USERNAME --password $INPUT_ADMIN_PASSWORD
    o365 status  
    echo "Logged in."
}

main "$@"
