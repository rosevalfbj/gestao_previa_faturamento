#Autor : Euclides Fernandes Júnior - CAC
class gestao_previa_faturamento::config {

  #File {
  #  owner => $gestao_previa_faturamento::user,
  #  group => $gestao_previa_faturamento::group,
  #  mode  => '0644',
  #}

  file { "${gestao_previa_faturamento::ssldir}":
    ensure => directory,
  }

  ->file { "${gestao_previa_faturamento::ssldir}/asterisco.algartelecom.com.br.jks":
    ensure => file,
    source => 'puppet:///modules/gestao_previa_faturamento/opt/pki/asterisco.algartelecom.com.br.jks',
  }

  ->file { "${gestao_previa_faturamento::catalina_home}/previafaturamento":
    ensure => directory,
    mode   => '0640',
    owner  => $gestao_previa_faturamento::user,
    group  => $gestao_previa_faturamento::group,
  }

  ->file { "${gestao_previa_faturamento::catalina_home}/previafaturamento/application.properties.xml":
    ensure  => file,
    content => template('gestao_previa_faturamento/application.properties.erb'),
  }

  ->file { '/etc/init.d/tomcat':
    ensure  => file,
    content => template('gestao_previa_faturamento/tomcat.erb'),
    mode    => '0640',
    owner   => $gestao_previa_faturamento::user,
    group   => $gestao_previa_faturamento::group,
  }

  ->file { "${gestao_previa_faturamento::catalina_home}/conf/server.xml":
    ensure  => file,
    content => template('gestao_previa_faturamento/server.xml.erb'),
  }

  ->file { "${gestao_previa_faturamento::catalina_home}/bin/catalina.sh":
    ensure => file,
    mode   => '0755',
    source => 'puppet:///modules/gestao_previa_faturamento/tomcat/apache/bin/catalina.sh',
  }

  ->file { "${gestao_previa_faturamento::catalina_home}/conf/context.xml":
    ensure => file,
    source => 'puppet:///modules/gestao_previa_faturamento/tomcat/apache/conf/context.xml',
  }

  ->archive { "${gestao_previa_faturamento::catalina_home}/lib/ojdbc7.jar":
    ensure => present,
    #mode   => '0640',
    #owner  => $gestao_previa_faturamento::user,
    #group  => $gestao_previa_faturamento::group,
    source => 'http://puppet-repo.network.ctbc/puppet/jdbc/ojdbc7.jar',
  }

  ->file { "${gestao_previa_faturamento::catalina_home}/lib/ojdbc7.jar":
    mode  => '0640',
    owner => $gestao_previa_faturamento::user,
    group => $gestao_previa_faturamento::group,
  }

  ->file { '/etc/systemd/system/tomcat.service':
    ensure  => file,
    content => epp('gestao_previa_faturamento/gestao_previa_faturamento.service.epp'),
  }

  ->exec { 'daemon-reload':
    path    => '/bin',
    command => 'systemctl daemon-reload',
    unless  => 'systemctl list-unit-files | grep tomcat.service'
  }
}
