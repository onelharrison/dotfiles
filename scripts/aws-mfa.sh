#!/bin/bash

set -e

AWS_CREDENTIALS_PATH="$HOME/.aws/credentials"

AWS_MFA_CONFIG_PATH="$HOME/.aws/mfa-config.json"

# Sample contents of ~/.aws/mfa-config.json
#
# [
#     {
#         "profile": "mfa",
#         "source_profile": "default",
#         "output": "json",
#         "region": "us-east-2",
#         "duration_seconds": "",
#         "mfa_serial": "arn:aws:iam::123456789012:mfa/user",
#
#     }
# ]

usage() {
cat <<-USAGE
Usage: $(basename "$0") [-p PROFILE] [-t TOKEN] [-o OUTPUT_LOCATION]

Options:
      -h                          Displays this message
      -p [PROFILE]                The MFA profile to configure
      -t [TOKEN]                  The token code for the MFA profile
      -o [OUTPUT_LOCATION]        Output location for the MFA profile credentials after they're configured in ~/.aws/credentials
                                  Valid values include [none | stdout | <filename>]. Defaults to "none" which doesn't output
                                  the MFA credentials anywhere (except in ~/.aws/credentials to configure the profile)
USAGE
}

exit_abnormal() {
    usage
    exit 1
}

optstring=":hp:t:o:"

OUTPUT_LOCATION="none"

while getopts ${optstring} opt; do
    case "${opt}" in
	h)
	    usage
	    exit 0
	    ;;
        p)
	    PROFILE=${OPTARG}
	    ;;
        t)
	    TOKEN=${OPTARG}
	    ;;
	o)
            OUTPUT_LOCATION=${OPTARG}
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

mfa_serial=$(echo $PROFILE_CONFIG | jq -r '.mfa_serial')
if [ "$mfa_serial" == "null" ]; then
    echo "$AWS_MFA_CONFIG_PATH: Missing field 'mfa_serial'"
    exit 1
fi

source_profile=$(echo $PROFILE_CONFIG | jq -r '.source_profile')
if [ "$source_profile" == "null" ]; then
    source_profile="default"
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

jq_extract_lower_aws_creds=$(cat <<jq
{ "aws_access_key_id": .AccessKeyId, "aws_secret_access_key": .SecretAccessKey, "aws_session_token": .SessionToken }
jq
)

jq_extract_upper_aws_creds=$(cat <<jq
{ "AWS_ACCESS_KEY_ID": .AccessKeyId, "AWS_SECRET_ACCESS_KEY": .SecretAccessKey, "AWS_SESSION_TOKEN": .SessionToken }
jq
)

jq_convert_aws_creds_to_configs=$(cat <<jq
$jq_extract_lower_aws_creds
| [ to_entries[] | "aws configure set profile.$PROFILE.\(.key) \(.value);" ]
| join("\n")
jq
)

jq_convert_aws_creds_to_env_vars=$(cat <<jq
$jq_extract_upper_aws_creds
| [ to_entries[] | "\(.key)=\(.value)" ]
| join("\n")
jq
)

aws_creds=$(aws sts get-session-token \
	--serial-number "$mfa_serial" \
	--token-code "$TOKEN" \
	--profile "$source_profile" \
	--duration-seconds "$duration_seconds" \
	--query "Credentials")

# configure profile
eval $(echo "$aws_creds"| jq -r "$jq_convert_aws_creds_to_configs")

aws configure set "profile.$PROFILE.region" "$region"
aws configure set "profile.$PROFILE.output" "$output"

# output mfa profile credentials
if [ "$OUTPUT_LOCATION" == "none" ]; then
    : # no op
elif [ "$OUTPUT_LOCATION" == "stdout" ]; then
    echo  "$aws_creds" | jq -r "$jq_convert_aws_creds_to_env_vars"
else
    echo  "$aws_creds" | jq -r "$jq_convert_aws_creds_to_env_vars" > "$OUTPUT_LOCATION"
fi

exit 0
