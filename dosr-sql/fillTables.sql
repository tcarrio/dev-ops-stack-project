INSERT INTO Links (title, url) VALUES (
    'Welcome',
    '#intro');
    
INSERT INTO Links (title, url) VALUES (
    'The Project',
    '#project');
    
INSERT INTO Links (title, url) VALUES (
    'The Sysadmins',
    '#sysadmins');

INSERT INTO Links (title, url) VALUES (
    'Gitlab',
    'http://gitlab.carrio.me/');

INSERT INTO Links (title, url) VALUES (
    'Mattermost',
    'http://mattermost.carrio.me/');

INSERT INTO Links (title, url) VALUES (
    'Install',
    'http://gitlab.carrio.me/dosr/dosr-stack/blob/master/README.md/');

INSERT INTO SysAdmins (name, description, image, url) VALUES (
    'Tom Carrio',
    'I''m a derp. I''m a derp derp derp. This is some super professional description of my amateurish ways. Yay.',
    'http://i.imgur.com/fh40qZy.jpg',
    'https://tom.carrio.me/');

INSERT INTO SysAdmins (name, description, image, url) VALUES (
    'Chase Ehlert',
    'And if you thought that was derpy. Ohhhhh mannnnnn.',
    'http://i.imgur.com/Ln2xJIQ.jpg',
    'https://www.reddit.com/r/gaming/');

INSERT INTO Features (title, description, icon) VALUES (
    'Version Control Software',
    'GitLab is used for a user-friendly VCS client using git for the backend, offering a plethora of tools such as issues, pull requests, and more.',
    'fa-code');

INSERT INTO Features (title, description, icon) VALUES (
    'LDAP Integration',
    'These services hook into Active Directory for user login and authentication, so anyone can get started quickly with their Windows account.',
    'fa-lock');

INSERT INTO Features (title, description, icon) VALUES (
    'Configurable',
    'With configurations available for projects and teams to enable your progress, your group can hit the ground running.',
    'fa-cog');

INSERT INTO Features (title, description, icon) VALUES (
    'Continuous Integration',
    'With the GitLab Runner configured for our service, you can use build configurations to test your code on every commit.',
    'fa-desktop');

INSERT INTO Features (title, description, icon) VALUES (
    'Mattermost Integration',
    'Issues generated on GitLab will be reflected on Mattermost, so group discussion and collaboration is more effective than ever.',
    'fa-chain');

INSERT INTO Features (title, description, icon) VALUES (
    'Single Sign On',
    'All you''ll need is your login to GitLab and you''re ready to go on all our offered services!',
    'fa-user');

INSERT INTO Specifications VALUES (
    'The Project Spec', 
    'DOSR is a Dev Ops Stack, consisting of the GitLab service, integrated with Mattermost and the GitLab Runner Continuous Integration service, providing developer a way to perform automatic testing on pull requests, commits, and more.',
    'http://gitlab.carrio.me/',
    'Git on GitLab',
    'http://mattermost.carrio.me/',
    'Start Chatting Now',
    'http://gitlab.carrio.me/dosr/dosr-stack/blob/master/README.md',
    'Installation Guide');
    
INSERT INTO Welcome VALUES (
    'DOSR',
    'The Dev Ops Stack Reborn.',
    '#project');
