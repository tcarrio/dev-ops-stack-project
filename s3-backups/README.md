
### S3 Backups

The S3 backups makes use of the `aws-cli` utility. Using the access token and ID provided when creating an S3 bucket, this utility can recursively copy entire directories to AWS. 

The Glacier service is a low-IO backup service whose purpose is for storing files which will likely not be needed again. For a long-term backup solution of outdated data for the span of 2-3 years past backup date, this service is great for a low-cost and integrated cloud backup solution. 

The S3 bucket is versioned in order to allow record of changes to our backup files, and outdated versions are migrated to the Glacier service since their storage on the S3 service is unnecessary spending.  This is configured through the AWS Console online. 

The `pg_dump` utility is used for generated SQL files of the databases for our services. The `s3.sh` script uses the `aws-cli` utility to backup GitLab, Mattermost, DOSR webapp, and their databases SQL files which were dumped. These are all pushed to indepdendent folders under the S3 bucket for easy location and recovery to the correct folders. Restoring a configuration of mattermost, the `s3://$bucket/mattermost/` directory reflects the same folder structure as the root of the Ubuntu server the Mattermost server runs on, such that `opt/mattermost/config/config.json` is the same under that directory in S3 as `/` on Ubuntu. 
