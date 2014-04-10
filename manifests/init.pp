file { some_file:
	name => "/home/vagrant/some_file.txt",
	ensure => "present",
	content => "hello andre",
}

file { hello_script:
	name => "/home/vagrant/hello.rb",
	ensure => "present",
	source => "/vagrant/hello.rb",
}

exec { hello:
	command => "ruby /home/vagrant/hello.rb",
	path => "/usr/bin",
	require => [File['some_file'], File['hello_script']],
}

package { postgresql:
	ensure => "installed",
}

service { postgresql:
	ensure => "running",
	require => Package['postgresql'],
}
