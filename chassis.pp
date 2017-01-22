$imagick_config = sz_load_config()
class { 'imagick':
	path => '/vagrant/extensions/imagick',
	php => $imagick_config[php]
}
