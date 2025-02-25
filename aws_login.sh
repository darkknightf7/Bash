#!/bin/bash
#SIGNING IN WITH MFA


export AWS_SECRET_ACCESS_KEY="";
export AWS_ACCESS_KEY_ID="";
export AWS_SESSION_TOKEN='';
export AWS_PROFILE='Profile_Name';
echo "MFA Token: "
read TOKEN
if ! [[ $TOKEN =~ ^-?[0-9]+$ ]] ; then
    echo "MFA not an integer"
    return 1
fi
OUTPUT=`aws sts get-session-token --serial-number arn:aws:iam::1312323213122:mfa/test@123.com --token $TOKEN`
SECRET=`echo $OUTPUT | jq --raw-output .Credentials.SecretAccessKey`
KEY=`echo $OUTPUT | jq --raw-output .Credentials.AccessKeyId`
SESSION=`echo $OUTPUT | jq --raw-output .Credentials.SessionToken`
echo $OUTPUT
export AWS_SECRET_ACCESS_KEY=$SECRET;
export AWS_ACCESS_KEY_ID=$KEY;
export AWS_SESSION_TOKEN=$SESSION;
export AWS_PROFILE='Profile_Name';
##Assuming Role
OUTPUT=`aws sts assume-role --role-arn arn:aws:iam::1231321323312:role/AllAccessSSMADevelopmentRole --role-session-name dev`
SECRET=`echo $OUTPUT | jq --raw-output .Credentials.SecretAccessKey`
KEY=`echo $OUTPUT | jq --raw-output .Credentials.AccessKeyId`
SESSION=`echo $OUTPUT | jq --raw-output .Credentials.SessionToken`
echo $OUTPUT
export AWS_SECRET_ACCESS_KEY=$SECRET;
export AWS_ACCESS_KEY_ID=$KEY;
export AWS_SESSION_TOKEN=$SESSION;
export AWS_PROFILE='Profile_Name';
