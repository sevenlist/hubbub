package { 'tomcat7':
  ensure => present,
}

file { '/var/lib/tomcat7/webapps/hubbub-0.1.war':
  source  => '/vagrant/target/hubbub-0.1.war',
  require => Package['tomcat7'],
}

service { 'tomcat7':
  ensure     => running,
  enable     => true,
  hasstatus  => true,
  hasrestart => true,
  subscribe  => File['/var/lib/tomcat7/webapps/hubbub-0.1.war'],
}