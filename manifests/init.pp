# Autor: Euclides Fernandes Júnior - CAC

class gestao_previa_faturamento (

  String $catalina_home                 = '/app/tomcat8',
  String $user                          = 'tomcat',
  String $group                         = 'tomcat',
  String $ssldir                        = '/opt/pki',
  String $ambiente                      = 'hom',
  #String $name_cert                    = 'previafaturamento.algartelecom.com.br.jks',
  # COnfiguração Connector Server.xml
  String $user_java_home                = '/usr/java/default',
  String $password_user_so              = 'c7bc@Jb0ss',
  String $usuario                       = 'tomcat',
  String $home_usuario                  = '/home/tomcat',
  String $grupo_usuario                 = 'tomcat',

  String $port                          = '8080',
  String $connectionTimeout             = '20000',
  String $maxThreads                    = '150',
  String $redirectPort                  = '443',
  String $acceptCount                   = '100',
  String $maxQueueSize                  = '1',
  String $keepAliveTimeout              = '10000',
  #Configuração connector HTTPS
  String $port_ssl                      = '8443',
  String $maxThreads_ssl                = '150',
  Boolean $sslEnabled                   = true,
  String $proxyPort                     ='443',
  #String $port_idp                     = '8080',
  String $protocolo_idp                 = 'http',
  String $user_idp                      = 'admin',
  String $password_idp                  = 'admin',

  String $proxyName                     = 'previafaturamentohom.algartelecom.com.br',
  String $keystoreFile                  = '/opt/pki/asterisco.algartelecom.com.br.jks',
  String $keystorePass                  = 'Algar2018@',
  String $keyAlias                      = 'asterisco.algartelecom.com.br',
  String $sslEnabledProtocols           = 'TLSv1,TLSv1.1,TLSv1.2',
  String $ciphers                       = '"TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256, 
                                            TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,
                                            TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384, 
                                            TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,
                                            TLS_ECDHE_RSA_WITH_RC4_128_SHA, 
                                            TLS_RSA_WITH_AES_128_CBC_SHA256,
                                            TLS_RSA_WITH_AES_128_CBC_SHA,
                                            TLS_RSA_WITH_AES_256_CBC_SHA256, 
                                            TLS_RSA_WITH_AES_256_CBC_SHA,
                                            SSL_RSA_WITH_RC4_128_SHA"',
  String $port_ajp                      = '8009',
  String $redirectport                  = '8443',
  String $defaulthost                   = 'previafaturamentohom.algartelecom.com.br',
  String $name_virtualhost              = 'previafaturamentohom.algartelecom.com.br',
  String $prefix                        = 'previafaturamentohom.algartelecom.com.br_access_log.',
  String $path                          = undef,
  String $url_idp                       = 'vipidphom',
  String $jdbc                          = 'jdbc/previa_faturamento',
  String $initialSize                   = '10',
  String $maxIdle                       = '20',
  String $maxWaitMillis                 = '300',
  String $maxTotal                      = '250',
  String $url_banco                     = 'jdbc:oracle:thin:@usrv67:1521/FXHML',
  String $username                      = 'previa_app',
  String $password                      = 'TELECOM#2018',
  Boolean $removeAbandonedOnBorrow      = true,
  Boolean $removeAbandonedOnMaintenance = true,
  String $removeAbandonedTimeout        = '10',
  String $timeBetweenEvictionRunsMillis = '60',
  Boolean $logAbandoned                 = true,
  Boolean $testOnBorrow                 = true,
  Boolean $testOnReturn                 = true,
  String $queryTimeout                  = '20',
){

contain gestao_previa_faturamento::config
#contain gestao_previa_faturamento::service

  #Class['gestao_previa_faturamento::config']
    #~> Class['gestao_previa_faturamento::service']

}
