#!/usr/bin/env bash
#aws ec2 describe-security-groups --query "SecurityGroups[*].{ID:GroupId,Name:GroupName,Description:Description}" --output text
#aws ec2 describe-instances --query "Reservations[*].Instances[*].SecurityGroups[*].{ID:GroupId,Name:GroupName,Description:Description}" --output text > final2
#sudo chmod 777 final*
# cat final2|awk -F " " '{print $3}' > final3
#while IFS= read -r line; do  sed -i "/$line/d" final1;  done < final3
#Acat final1
#sudo sed -i '1s/^/[default]\n/' /root/.aws/credentials
#sudo sed -i '2s/^/aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}\n/' /root/.aws/credentials
#sudo sed -i '3s/^/aws_access_key_id  = ${AWS_ACCESS_KEY_ID}\n/' /root/.aws/credentials

# all groups
aws ec2 describe-security-groups \
  | jq --raw-output '.SecurityGroups[] | [.GroupName, .GroupId, .Description] | @tsv' \
  | sort > /tmp/sg.all

# groups in use
aws ec2 describe-network-interfaces \
  | jq --raw-output '.NetworkInterfaces[].Groups[] | [.GroupName, .GroupId, .Description] | @tsv' \
  | sort \
  | uniq > /tmp/sg.in.use
# aws ec2 describe-instances \
#  | jq --raw-output '.Reservations[].Instances[].SecurityGroups[] | [.GroupName, .GroupId, .Description] | @tsv' \
#  | sort \
#  | uniq > /tmp/sg.in.use

diff /tmp/sg.all /tmp/sg.in.use |grep "<" |cut -d ' ' -f2,3,4
