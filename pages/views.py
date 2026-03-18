import os

from django import get_version
from django.conf import settings
from django.shortcuts import render


def Presentacion(mensaje="Hola, soy un estudiante de EBAC"):
    texto = ""
    for char in mensaje:
        texto += char
    return texto


class Curso:
    def __init__(self, nombre, trabajo):
        self.nombre = nombre
        self.trabajo = trabajo


class Estudiante:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad


def home(request):
    persona1 = Curso("Raify", "Backend Python")
    estudiante1 = Estudiante("Raify", "26 años")

    context = {
        "debug": settings.DEBUG,
        "django_ver": get_version() + "PROBANDO CAMBIOS",
        "python_ver": os.environ["PYTHON_VERSION"] + "MAS CAMBIOS",
        "presentacion": Presentacion(),
        "nombre": persona1.nombre,
        "trabajo": persona1.trabajo,
        "edad": estudiante1.edad,

    }

    return render(request, "pages/home.html", context)
