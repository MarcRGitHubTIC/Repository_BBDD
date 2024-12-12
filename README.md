# Repository_BBDD

Repositorio datos de la base de datos Grupo 1 - Aula 02

Este repositorio contiene información sobre la base de datos y como funciona, la idea es mantener un control de Alumnos, Profesores y Administradores sobre un colegio con un sistema de regitro de registro a traves de tarjetas RFID

El modelo relacional que sigue la base de datos es el siguiente (nota: los atributos en fichaje.userid y fichaje.aulaid son incorrectos en la foto, realmnte son fichaje.cardid y fichaje.deviceid)

![BBDD_Imagen](Imagenes/BBDD.drawio.png)

Primero, empezando por la izquierda fichaje-usuario-aula tiene una relación ternaria entre ellos, la cual mantiene un registro de los fichajes de las tarjetas según la tarjeta del alumno o profesor pertinente con el lector de la clase que haya pasado la tarjeta.

A la derecha de esa relación ternaria, existe otra entre usuario-asignatura-horario, con esto sabemos que clases son a que hora y el profesor que las imparte o el alumno que el atiende.

Por último, para saber que clases son donde, tenemos la relacion de aula-horario para saber a que horas se han realizado según el aula.

