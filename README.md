# bin

A collection of common scripts for the dev team. Can be dangerous.

#### Scripts

##### mupdate.sh
    * Automatic Drupal module update script.
    * Requires Drush

##### drupal_sql_table_sizes.sh
    * Displays database table sizes.
    * Requires Drush

##### vhost.sh
    * Update /etc/hosts and httpd-vhosts.conf with bash script.
    * NOTE: must be run as sudo.
    * make sure to change docRoot variable to path of your document root.
    
#### prepperm.sh
    * DANGER - DO NOT USE UNLESS YOU KNOW WHAT YOU ARE DOING!
    * Modifies Drupal 7 file system permissions for a secure deployment.
    * Work in progress. 
