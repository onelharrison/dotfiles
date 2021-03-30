#!/bin/bash

set -e

AWS_MFA_CONFIG_PATH="$HOME/github.com/onelharrison/dotfiles/conf/aws/.aws-mfa-config.json"

# Sample contents of .aws-mfa-config.json
#
# [
#     {
#         "profile": "mfa",
#         "jump_profile": "default",
#         "output": "json",
#         "region": "us-east-2",
#         "duration_seconds": "",
#         "serial_number": "arn:aws:iam::123456789012:mfa/user",
#
#     }
# ]

AWS_CREDENTIALS_PATH="$HOME/.aws/credentials"

usage() {
    echo "Usage: $0 [-p PROFILE] [-t TOKEN]" 1>&2
}

exit_abnormal() {
    usage
    exit 1
}

optstring=":p:t:"

while getopts ${optstring} opt; do
    case "${opt}" in
        p)
	    PROFILE=${OPTARG}
	    ;;
        t)
	    TOKEN=${OPTARG}
	    ;;
	:)
	    echo "$0: Must supply an argument to -$OPTARG." >&2
	    exit_abnormal
	    ;;
        *)
	    exit_abnormal
	    ;;
    esac
done

PROFILE_CONFIG=$(jq ".profiles[] | select(.profile==\"$PROFILE\")" $AWS_MFA_CONFIG_PATH)

serial_number=$(echo $PROFILE_CONFIG | jq -r '.serial_number')
if [ "$serial_number" == "null" ]; then
    echo "$AWS_MFA_CONFIG_PATH: Missing field 'serial_number'"
    exit 1
fi

jump_profile=$(echo $PROFILE_CONFIG | jq -r '.jump_profile')
if [ "$jump_profile" == "null" ]; then
    jump_profile="default"
fi

duration_seconds=$(echo $PROFILE_CONFIG | jq -r '.duration_seconds')
if [ "$duration_seconds" == "null" ]; then
    duration_seconds=43200 # 12 hours
fi

region=$(echo $PROFILE_CONFIG | jq -r '.region')
if [ "$region" == "null" ]; then
    echo "$AWS_MFA_CONFIG_PATH: Missing field 'region' for profile '$PROFILE'"
    exit 1
fi

output=$(echo $PROFILE_CONFIG | jq -r '.output')
if [ "$output" == "null" ]; then
    output="json"
fi

jq_aws_creds_to_configs=$(cat <<jq
{ "aws_access_key_id": .AccessKeyId, "aws_secret_access_key": .SecretAccessKey, "aws_session_token": .SessionToken }
| [ to_entries[] | "aws configure set profile.$PROFILE.\(.key) \(.value);" ]
| join("\n")
jq
)

eval $(aws sts get-session-token \
	--serial-number "$serial_number" \
	--token-code "$TOKEN" \
	--profile "$jump_profile" \
	--duration-seconds "$duration_seconds" \
	--query "Credentials" \
	| jq -r "$jq_aws_creds_to_configs")

aws configure set "profile.$PROFILE.region" "$region"
aws configure set "profile.$PROFILE.output" "$output"

exit 0
