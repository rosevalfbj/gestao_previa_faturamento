# This is a private class to manage service

class gestao_previa_faturamento::service {

  service { 'tomcat':
    ensure => 'running',
    enable => true,
  }

}
