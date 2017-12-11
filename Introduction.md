# DOSR Stack

```bash
# Fun fact, this README.md was generated with the following command:
cat Introduction.md \
	{dosr-sql,dosr-web,gitlab,mattermost,postgres,nginx,s3-backups,screenshots,dosr-installation}/README.md | \
	sed "s/DOSR](/DOSR](screenshots\//g" > README.md
# All components also have their own README.md describing their function, design, etc.
```

By Thomas Carrio and Chase Ehlert

### Introduction to the Project and README.md

The contents of this submission include all relevant services pertaining to the DOSR stack. Each directory comprises of that component of our service, such that `gitlab` contains the configuration file for GitLab, `postgres` contains database dumps of our working databases, and so on. 

The project scope was to create a software-as-a-service with Gitlab and Mattermost, providing further functionality with tools such as CI, SSO, LDAP integration, Webhooks, and more. The finished product included GitLab CE, Mattermost, Webhook and SSO intergration between them, an AWS cluster of GitLab Runners for building pipelines with GitLab CI, Slash commands from Mattermost to control and query GitLab, cloud-based backups of our configuration files and databases, and LDAP integration with our existing `cit349.ou` domain. The following table of contents outlines the purpose of each directory found in this submission:

1. [dosr-sql](#dosr-sql)
2. [dosr-web](#dosr-web)
3. [GitLab Configuration](#gitlab-configuration)
4. [Mattermost Configuration](#mattermost-configuration)
5. [PostgreSQL Dumps](#postgresql-dumps)
6. [Nginx Configuration](#nginx-configuration)
7. [S3 Backups](#s3-backups)
8. [Service Screenshots](#service-screenshots)
9. [Installation Guide](#installing-a-stack-like-dosr)


