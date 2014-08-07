# To re-create Urban Hands Website:

## Install Joomla

- Get account at [codio.com](http://codio.com)
- Create new codio box using this repo as base
- Once in your codio project, open a *terminal* tab under the *Tools* menu
- Paste the following commands into your *terminal tab* and hit `enter`

```
chmod u+x joomla-install.sh
./joomla-install.sh
MYSQL_PWD="password" mysql joomla -u joomlauser
INSERT INTO `gi45c_users` (`name`, `username`, `password`, `params`) VALUES ('Super User', 'admin', '433903e0a9d6a712e00251e44d29bf87:UJ0b9J5fufL3FKfCc0TLsYJBh2PFULvT', '');
INSERT INTO `gi45c_user_usergroup_map` (`user_id`,`group_id`) VALUES (LAST_INSERT_ID(),'8');
quit
```

- Under the *Project Index* menu select check *Box URL*
- To log into your Joomla Backend just add `/administrator` to end of the URL, the default username & password is `admin`

## Restore from Backup

- Install xcloner joomla extension, via *Install from URL*, `http://www.xcloner.com/download/8`
- Paste the following commands into your *terminal tab* and hit `enter`

```
sed -i "s/name='mysql_username' value=''/name='mysql_username' value='joomlauser'/g" XCloner.php
sed -i "s/name='mysql_pass' value=''/name='mysql_pass' value='password'/g" XCloner.php
sed -i "s/name='mysql_db' value=''/name='mysql_db' value='joomla'/g" XCloner.php
wget https://www.dropbox.com/s/qenbzzqd3crt18q/urbanhands.tar?dl=1 -O urbanhands.tar
```

- Go to Xcloner restore page, click on *Box URL* add `/XCloner.php` to end of the URL
- Click the **Import mysql database**, **Incremental sql import** buttons
- Then begin the restore by clicking the **Start Install** button
- Paste the following commands into your *terminal tab* and hit `enter`

```
rm TAR.php
rm XCloner.php
rm urbanhands.tar
```