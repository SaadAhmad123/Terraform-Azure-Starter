#!/bin/bash

# Default tfvars file
tfvars_file="./terraform.tfvars"

# Parse command line options
while getopts ":f:" opt; do
  case ${opt} in
    f)
      tfvars_file="$OPTARG"
      ;;
    \?)
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    :)
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))

# Check if tfvars file exists
if [ ! -f "$tfvars_file" ]
then
    echo "$tfvars_file file not found. Exiting."
    exit 1
fi


# Extract the required variables from tfvars file
ARM_SUBSCRIPTION_ID=$(grep "^subscription_id" $tfvars_file | awk -F "=" '{print $2}' | tr -d ' "')
ARM_TENANT_ID=$(grep "^tenant_id" $tfvars_file | awk -F "=" '{print $2}' | tr -d ' "')
ARM_CLIENT_ID=$(grep "^client_id" $tfvars_file | awk -F "=" '{print $2}' | tr -d ' "')
ARM_CLIENT_SECRET=$(grep "^client_secret" $tfvars_file | awk -F "=" '{print $2}' | tr -d ' "')

# Check if variables were extracted successfully
if [ -z "$ARM_SUBSCRIPTION_ID" ] || [ -z "$ARM_TENANT_ID" ] || [ -z "$ARM_CLIENT_ID" ] || [ -z "$ARM_CLIENT_SECRET" ]
then
    echo "Could not extract all required variables from $tfvars_file. Exiting."
    exit 1
fi


export ARM_CLIENT_ID=$ARM_CLIENT_ID
export ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET
export ARM_TENANT_ID=$ARM_TENANT_ID
export ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
bash ./shell_run.sh -c "terraform destroy" -v "shell_tf_env.sh,shell_tf_init.sh"