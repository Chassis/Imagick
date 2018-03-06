# A Chassis extension to install and configure ImageMagick on your server
class imagick (
  $config,
  $path = '/vagrant/extensions/imagick',
  $php = $config[php]
) {

  if versioncmp( $php, '5.4') <= 0 {
    $php_package = 'php5'
  }
  else {
    $php_package = "php${php}"
  }

  package { "${$php_package}-imagick":
    ensure  => latest,
    require => Package["${$php_package}-fpm"],
    notify  => Service["${$php_package}-fpm"]
  }

  package { 'imagemagick':
    ensure  => latest,
    require => Package["${$php_package}-fpm"],
    notify  => Service["${$php_package}-fpm"]
  }
}
