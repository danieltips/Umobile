UMOBILE - PROYECTO PROFESIONAL PARA OPTAR POR EL TITULO DE INGENIERO DE SOFTWARE 
Lima, Perú - UPC 2011
-------------------------------------------------------------------------------

Resumen
-------------------------------------------------------------------------------
El proyecto Umobile nace a partir de la necesidad de ofrecer servicios académicos de nuevas formas en un entorno tecnológico común a las personas.
Esta problemática hace que nazca la iniciativa de este proyecto, el cual es implementar una solución para poder aprovechar las tecnologías móviles en la educación superior, a través del framework Umobile. El framework se presenta como una alternativa para poder brindar los servicios académicos que las diferentes universidades puedan ofrecer a los estudiantes por medio de los distintos tipos de Smartphones existentes en el mercado.
Se utilizará la tecnología Rhodes (basado en ruby) para realizar el framework, el cual permitirá tener un código base el cual puede desplegar una aplicación en los principales sistemas operativos que dominan el mercado actual (Android, iOS, Windows, Symbian, BlackberryOS). El framework contará con una gama de funcionalidades las cuales serán ofrecidas dependiendo del contexto y necesidades de cada universidad, así como también el despliegue en las plataformas solicitadas.

Instrucciones
-------------------------------------------------------------------------------
Instalar rhodes:

 	gem install rhodes

Instalar rhosync: http://wiki.rhomobile.com/index.php/RhoSync

Editar el archivo rhoconfig.txt en la carpeta Umobile. Configurar "syncserver" a la IP correcta para correr el servicio. En nuestro caso el servidor corre localmente en 192.168.1.220 en el puerto 9292.

syncserver = 'http://192.168.1.220:9292/application/'

La aplicación trae data de un webservice propio para la prueba de datos. TODA LA DATA ES SIMULADA 

Para realizar el login de usuario se debe de autentificar con lo siguiente:

	usuario: u712344
	password: 123456

Gracias


