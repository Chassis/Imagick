# A Chassis extension to install and configure ImageMagick on your server
class imagick (
  $config,
  $path = '/vagrant/extensions/imagick',
  $php = $config[php]
) {

  if ( ! empty( $::config[disabled_extensions] ) and 'chassis/imagick' in $config[disabled_extensions] ) {
    $package = absent
  } else {
    $package = latest
  }

  if versioncmp( $php, '5.4') <= 0 {
    $php_package = 'php5'
  }
  else {
    $php_package = "php${php}"
  }

  package { 'php-imagick':
    ensure  => $package,
    require => Package["${$php_package}-fpm"],
    notify  => Service["${$php_package}-fpm"]
  }

  package { 'imagemagick':
    ensure  => $package,
    require => Package["${$php_package}-fpm"],
    notify  => Service["${$php_package}-fpm"]
  }
}
