# To re-create Urban Hands Website:

## Install Joomla

- Get account at [codio.io](http://codio.io)
- Create new codio box using this repo as base
- Once in your codio project, open a *terminal* tab under the *Tools* menu
- In the *terminal* tab run this command `chmod u+x joomla-install.sh && ./joomla-install.sh`
- Paste the following commands into your *terminal tab* and hit `enter`

```
MYSQL_PWD="password" mysql joomla -u joomlauser
INSERT INTO `gi45c_users` (`name`, `username`, `password`, `params`) VALUES ('Super User', 'admin', '433903e0a9d6a712e00251e44d29bf87:UJ0b9J5fufL3FKfCc0TLsYJBh2PFULvT', '');
INSERT INTO `gi45c_user_usergroup_map` (`user_id`,`group_id`) VALUES (LAST_INSERT_ID(),'8');
quit
```

- Under the *Project Index* menu select check *Box URL*
- To log into your Joomla Backend just add `/administrator` to end of the URL, the default username & password is `admin`

## Restore from Backup

- In the *terminal* tab run this command `chmod u+x xcloner-download.sh && ./xcloner-download.sh`
- Install xcloner joomla extension, via *Install from Directory*, from `/home/codio/workspace/tmp/xcloner/` where we just downloaded the files to
- Paste the following commands into your *terminal tab* and hit `enter`

```bash
cp ~/workspace/administrator/components/com_xcloner-backupandrestore/restore/* ~/workspace
cp ~/workspace/administrator/backups/backup_2014-08-02_15-27_gizzen-antony.codio.io:3000-sql-nodrop.tar
```

- Click on *Box URL* add `/XCloner.php` to end of the URL to go to Xcloner restore page