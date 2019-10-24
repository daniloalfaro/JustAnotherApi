Esta es una pequeña api como test de prueba, para poblar la base de datos:

rake db:seed

Creara 101 usuarios todos con la contraseña '123456789' el usuario principal
para hacer pruebas es:

usuario:    'usuariodeprueba@dominio.com'
contraseña: '123456789'

Los otros usuarios son creados con Faker para poder probar las funcionalidades
del api. Agrego un set de peticiones de postman en el directorio resources:

resources/jusanotherapi.postman_collection.json

Despues de uniciar session con el usuario de prueba el api regresa un token que
se utilizara como autenricacion para las demas acciones.
