#!/bin/sh

PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PLAYBOOK_PATH=${PARENT_PATH}/..

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--password)
      PASSWORD="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

if [[ -z "$PASSWORD" ]];
then
    echo "SSH Password is required, use [-p | --password] flag" 

fi


ansible-playbook ${PLAYBOOK_PATH}/site.yml \
    -i ${PLAYBOOK_PATH}/inventory/cluster/hosts.ini \
    --extra-vars "ansible_ssh_pass=${PASSWORD}"