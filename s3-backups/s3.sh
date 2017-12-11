#!/bin/bash

source .pgpass
bucket="dosr-backup.carrio.me"
host="chase.ou.carrio.me"
export AWS_ACCESS_KEY_ID="redacted"
export AWS_SECRET_ACCESS_KEY="redacted"
export AWS_DEFAULT_REGION="us-east-1"

# backup services
aws s3 cp /etc/gitlab/             s3://$bucket/gitlab/etc/ --recursive
aws s3 cp /opt/mattermost/config/  s3://$bucket/mattermost/opt/mattermost/config/ --recursive
aws s3 cp /opt/dosr-web/           s3://$bucket/dosr-web/opt/ --recursive --exclude 'venv/*'

# backup databases
sqld="sqldump"
mkdir -p $sqld
for db in ${DBS[@]}; do
	pg_dump --clean --create --quote-all-identifiers -h $host -d $db -U postgres -w > "$sqld/$db.sql"
done
aws s3 cp $sqld/ s3://$bucket/postgres/ --recursive
rm $sqld/*.sql
rmdir $sqld
