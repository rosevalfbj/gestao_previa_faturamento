# Autor: Euclides Fernandes Júnior - CAC

class gestao_previa_faturamento (

  String $catalina_home                 = '/app/tomcat8',
  String $user                          = 'tomcat',
  String $group                         = 'tomcat',
  String $ssldir                        = '/opt/pki',
  String $ambiente                      = 'hom',
  String $name_cert                     = 'previafaturamento.algartelecom.com.br.jks',


){

contain gestao_previa_faturamento::config
contain gestao_previa_faturamento::service

  Class['gestao_previa_faturamento::config']
    ~> Class['gestao_previa_faturamento::service']

}
