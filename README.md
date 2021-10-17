# Versa Task
A simple web application based on the Craft CMS.

## Installation
1. Clone this repo:
```
git clone git@github.com:saidiadegoke/verse-task.git
```
```
cd verse-task
```

2. Install dependencies
```
composer install
```

3. Setup the database
* Download the database file [here](https://github.com/saidiadegoke/verse-task/blob/880cfca1559947a130eabf6ae1dc8af2be879e53/assets.zip?raw=true)
* Create a database in your MySQL service using CLI `create database versa-task` or using phpmyadmin or other possible methods.
* Import the downloaded sql file into the newly created database.

4. Create `.env` file from the provided `.env.example` file
* Enter the database name
* Enter mysql username
* Enter mysql password
* Edit the variable `PRIMARY_SITE_URL=http://localhost/verse-task/web` to your local setting.

5. Generate security keys
```
php craft setup/security-key
```

6. From [here](https://raw.githubusercontent.com/saidiadegoke/verse-task/880cfca1559947a130eabf6ae1dc8af2be879e53/verse-task.sql), download, unzip and copy the content `assets.zip` file/folder to your `assets` folder located at `path/to/verse-task/web/assets`

7. Type in the value of the constant `PRIMARY_SITE_URL` into your browser. For example: `http://localhost/verse-task/web`
