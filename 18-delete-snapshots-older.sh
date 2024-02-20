#!/bin/bash

# # Set your AWS profile
# export AWS_PROFILE="~/.aws/config"

# Set the tag key and value
TAG_KEY="Name"
TAG_VALUE="kat*"

# Set the AWS region
AWS_REGION="us-east-1"

# Calculate the date 30 days ago
DATE_THRESHOLD=$(date -d "30 days ago" --utc +%Y-%m-%dT%H:%M:%S)

# List snapshots with the specified tag and older than 30 days
SNAPSHOT_IDS=$(aws ec2 describe-snapshots --owner-ids 468428427679 \
    --region $AWS_REGION \
    --filters "Name=tag:$TAG_KEY,Values=$TAG_VALUE" "Name=start-time,Values=$DATE_THRESHOLD" \
    --query "Snapshots[*].SnapshotId" --output text)

# Delete each snapshot
for SNAPSHOT_ID in $SNAPSHOT_IDS; 
do
    aws ec2 delete-snapshot --region $AWS_REGION --snapshot-id $SNAPSHOT_ID
    echo "Deleted snapshot: $SNAPSHOT_ID"
done
