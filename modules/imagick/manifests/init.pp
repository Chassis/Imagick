class imagick (
$path = "/vagrant/extensions/imagick"
) {

  package { 'php5-imagick':
    ensure  => latest,
    require => Package['php5-fpm'],
    notify  => Service['php5-fpm']
  }
}
