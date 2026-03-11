import time
import sys


def presentacion(mesage):
    for char in mesage:
        sys.stdout.write(char)
        sys.stdout.flush()
        time.sleep(0.05)
    print()


presentacion("Bienvenidos al programa de presentacion de Python 'EBAC'")
