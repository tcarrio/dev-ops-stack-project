

### Service Screenshots

![DOSR](01-dosr-home.png)

The DOSR webapp homepage

![DOSR](02-dosr-specs.png)

The Project Spec section our web page.

![DOSR](03-dosr-admins.png)

Our beautiful section on the system administrators involved in the project!

![DOSR](04-gitlab-ldap.png)

The welcome page of our GitLab! Customized to handle LDAP authentication and with instructions for how to log in.

![DOSR](05-gitlab-2fa.png)

2 Factor Authentication is also available for GitLab accounts. 

![DOSR](06-gitlab-project.png)

Here's a view of a full git repository on our GitLab service.

![DOSR](07-gitlab-pipeline.png)

That project has a `.gitlab-ci.yml` file! Here's our AWS Runner cluster hard at work testing these Linux builds of Minetest.

![DOSR](08-gitlab-team.png)

You can create Groups in GitLab, which made coordination of our codebase and overall project much simpler for our team.

![DOSR](09-gitlab-issue.png)

And you can create Issues on existing projects! This one is an example that shows an Assignee, commit references, and later, automatic webhooks demonstrated on Mattermost.

![DOSR](10-mattermost-sso.png)

Welcome to Mattermost! The only way you can access this service is with your GitLab account. If you're registered and logged in already, it'll automatically plug you right in!

![DOSR](11-mattermost-webhook-messages.png)

Here's one of our chat channels concerning our `dosr-sql` project. This displays our automatic updates on issues created on our GitLab project. 

![DOSR](12-mattermost-webhooks-issues.png)

Some more messages hooked from GitLab showing push updates and closed issues concerning our `dosr-web` project. 

![DOSR](13-gitlab-admin.png)

Our Admin Page, showing statistics on projects, features, components, and more. Sadface, only the professor tested our service `:(`. 

![DOSR](14-gitlab-admin-jobs.png)

Heading to the Jobs tab on the Admin Page shows info on the current jobs that are queued, finished, or running on our service! I spun up builds of several projects to demonstrate.

![DOSR](15-gitlab-admin-runners.png)

And taking a look at the Runners actually installed! Once the AWS cluster was configured and confirmed to work, the local Runners were disabled for security and performance reasons. Isolated environments for building and more resources dedicated to our SaaS servers!

![DOSR](16-gitlab-push-test.png)

And a test from home, showing GitLab pushing working from my desktop. Don't mind the number of resolutions mentions in that neofetch `¯\_(ツ)_/¯` .

