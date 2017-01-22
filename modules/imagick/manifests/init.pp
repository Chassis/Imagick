class imagick (
	$path = "/vagrant/extensions/imagick",
	$php = $imagick_config[php]
) {

	if versioncmp( "${$php}", '5.4') <= 0 {
		$php_package = 'php5'
	}
	else {
		$php_package = "$php"
	}

	package { "${$php_package}-imagick":
		ensure  => latest,
		require => Package["php${$php_package}-fpm"],
		notify  => Service["php${$php_package}-fpm"]
	}
}
