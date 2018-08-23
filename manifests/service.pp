# This is a private class to manage service

class gestao_previa_faturamento::service {

  service { $module_name:
    ensure => 'running',
    enable => true,
  }

}
