### Nginx configuration

The nginx service was configured as a reverse proxy for all of our services offered. I had a DNS entry created for every service such that nginx could identify requests to the server by the URL and pass requests to the corresponding service. 

None of the services require odd ports, and are all available under the same machine at port 80 using basic HTTP. The last rule in the configuration file is setup to ward off traffic snoopers and unwarranted traffic. Requests using the specific fully-qualified domain names are passed. Other requests are blocked and a 404 returned. 
