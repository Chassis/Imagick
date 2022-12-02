# A Chassis extension to install and configure ImageMagick on your server
class imagick (
	$config,
	$path = '/vagrant/extensions/imagick',
	$php  = $config[php]
) {

	if ( !empty($::config[disabled_extensions]) and 'chassis/imagick' in $config[disabled_extensions] ) {
		$package = absent
	} else {
		$package = latest
	}

	if versioncmp($php, '5.4') <= 0 {
		$php_package = 'php5'
	}
	else {
		$php_package = "php${php}"
	}

	package { "$php_package-imagick":
		ensure  => $package,
		require => [
			Apt::Ppa['ppa:ondrej/php'],
			Apt::Ppa['ppa:ondrej/php-qa'],
			Class['apt::update'],
		],
		notify  => Service["${php_package}-fpm"]
	}

	package { 'imagemagick':
		ensure  => $package,
		require => [
			Apt::Ppa['ppa:ondrej/php'],
			Apt::Ppa['ppa:ondrej/php-qa'],
			Class['apt::update'],
		],
		notify  => Service["${php_package}-fpm"]
	}
}
