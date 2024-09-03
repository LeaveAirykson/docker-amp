<VirtualHost *:80>
  DocumentRoot "%DAMP_DOCROOT%"
  ServerName %DAMP_SERVERNAME%
  Options FollowSymLinks

  <Directory %DAMP_DOCROOT%>
    Options -Indexes -MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>

  <FilesMatch \.php$>
    SetHandler "proxy:unix:/run/php/%DAMP_PHP%-fpm.sock|fcgi://localhost"
  </FilesMatch>

  ErrorLog ${APACHE_LOG_DIR}/%DAMP_PROJECTNAME%_error.log
  CustomLog ${APACHE_LOG_DIR}/%DAMP_PROJECTNAME%_access.log combined
</VirtualHost>