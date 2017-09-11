#!/bin/bash

params=""
export AWS_ACCESS_KEY_ID="AKIAIFOIAZSTVZUT5F5Q"
export AWS_SECRET_ACCESS_KEY="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"

for arg; do
        params="$params $arg"
done

aws $params
if date -v-180d > /dev/null 2>&1; then

      DATE=date --date="-180 days" +%Y-%m-%d
fi
      volume=$(aws ec2 describe-volumes --query 'Volumes[*].[VolumeId, Attachments[0].InstanceId,CreateTime]' --filters Name=status,Values=available --output table --output text)

     echo "script for ebsvolume attached within 180 DAYS: $volume"


       elasticips=$(aws ec2 describe-addresses --query 'Addresses[?InstanceId==null]' --output text)

      echo "unsttached elastic ips are :$elasticips"


       StopedInstance=$(aws ec2 describe-instances --query 'Reservations[].Instances[].[BlockDeviceMappings[*].Ebs.VolumeId]' --filter "Name=instance-state-name,Values=stopped")

      echo "Stopped instance volumes :$topedInstance"


       security=$(comm -23 <(aws ec2 describe-security-groups --query 'SecurityGroups[].GroupId' --output text | tr '\t' '\n'| sort) <(aws ec2 describe-instances --query 'Reservations[].Instances[].SecurityGroups[].GroupId' --output text | tr '\t' '\n' | sort | uniq) --output table)

      echo "unattached security groups are :$security"


      unuse_volumes=$(aws ec2 describe-volumes --filters Name=status,Values=available --output table)

      echo "availabel volumes are :$unuse_volumes"



      ami=$(aws ec2 describe-images --owners=658101434938  --query "Status.available.Images[].State[]" --output table)

      echo "available ami's are : $ami"
