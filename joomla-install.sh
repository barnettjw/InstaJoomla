#!/bin/bash

wget http://joomlacode.org/gf/download/frsrelease/19524/159414/Joomla_3.3.1-Stable-Full_Package.tar.gz
tar zxvf Joomla_3.3.1-Stable-Full_Package.tar.gz
rm Joomla_3.3.1-Stable-Full_Package.tar.gz

parts install php5 php5-apache2 php5-pdo-mysql php5-zlib php5-zip mysql
parts start apache2 mysql

touch startup.sh
echo "#!/bin/bash" >> startup.sh
echo "parts stop apache2 mysql" >> startup.sh
echo "parts start apache2 mysql" >> startup.sh
chmod u+x startup.sh
chmod u+w configuration.php

echo "CREATE DATABASE joomla;" >> joomla-db.sql
echo "CREATE USER joomlauser@localhost;" >> joomla-db.sql
echo 'SET PASSWORD FOR joomlauser@localhost= PASSWORD("password");' >> joomla-db.sql
echo "GRANT ALL PRIVILEGES ON joomla.* TO joomlauser@localhost IDENTIFIED BY 'password';" >> joomla-db.sql
echo "FLUSH PRIVILEGES;" >> joomla-db.sql

MYSQL_PWD="" mysql -u root<joomla-db.sql
sed -i 's/#__/gi45c_/g' installation/sql/mysql/joomla.sql
MYSQL_PWD="password" mysql joomla -u joomlauser<installation/sql/mysql/joomla.sql

rm -rf installation
rm joomla-db.sql
rm joomla-install.sh