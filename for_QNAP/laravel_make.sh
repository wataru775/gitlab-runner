##
#  これはQNAPのcontainer stationで端末実行内で実行する作業です
#  検証済コンテナ : ubuntu:latest (20.04.1 LTS)
##

apt-get -y -qq install php php-fpm unzip mcrypt php-fpm php-common php-mbstring php-xmlrpc php-gd php-xml php-mysql php-cli php-zip php-curl php-imagick php-phpdbg git curl rsync

useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# for apache2
sed -e 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=gitlab-runner/g' /etc/apache2/envvars
# sed -e 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=gitlab-runner/g' /etc/apache2/envvars

chown gitlab-runner:www-data /etc/apache2/sites-available/000-default.conf
cat <<EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        # DocumentRoot /var/www/html
        DocumentRoot /opt/runner/public
        ErrorLog  /opt/runner/logs/apache2/error.log
        CustomLog  /opt/runner/logs/apache2/access.log combined
        <Directory /opt/runner/public>
                AllowOverride All
                Options Includes FollowSymLinks
                Require all granted
        </Directory>
</VirtualHost>
EOF

chown -R gitlab-runner:www-data /var/log/apache2

# working / www
mkdir /opt/runner/
chown gitlab-runner:www-data /opt/runner/
chmod 2777 /opt/runner/

# for php
php -v


# for composer
curl https://getcomposer.org/composer-stable.phar -o /usr/local/bin/composer
chmod +x /usr/local/bin/composer
composer -V

apache2ctl configtest
service apache2 restart

curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

chmod +x /usr/local/bin/gitlab-runner
gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
gitlab-runner start
