
### PostgreSQL Dumps

These are the database dumps of our services. I have included the following, which are found at their respective names in `.sql` files:

1. GitLab -> gitlabhq_production.sql
2. Mattermost -> mattermost.sql
3. DOSR webpage -> dosrdb.sql

These can be imported directly into PostgreSQL either in a terminal using the command:

```
\i $filename.sql
``` 

or with the `psql` command using 

```bash
psql -f $filename.sql
```

