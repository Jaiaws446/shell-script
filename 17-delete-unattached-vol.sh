#!/bin/bash

# Get a list of all EBS volumes
all_volumes=$(aws ec2 describe-volumes --query 'Volumes[*].VolumeId' --output text)

# Get a list of attached EBS volumes
attached_volumes=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].BlockDeviceMappings[*].Ebs.VolumeId' --output text)

# Loop through all volumes and delete unattached ones
for volume in $all_volumes; do
  if [[ ! $attached_volumes =~ $volume ]]; then
    echo "Deleting unattached volume: $volume"
    aws ec2 delete-volume --volume-id $volume
  fi
done
