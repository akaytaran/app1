
# create databases
CREATE DATABASE IF NOT EXISTS `admin`;

# create root user and grant right
GRANT ALL PRIVILEGES ON admin.* TO 'homestead'@'%';