import sys
import os

arguments = sys.argv

# Abrimos el archivo pasado como argumento
with open(arguments[1], "r") as log_file:

    # Obtenemos la lista de los niveles de LOGS
    log_levels = ["WARNING", "ERROR", "FATAL", "PANIC", "TODOS"]

    # Limpiamos la pantalla
    os.system("clear")

    # Imprimimos el menú
    print("** PostgreSQL LOG Filter **")
    print("Qué tipo de LOG deseas filtrar?")
    for i, log_level in enumerate(log_levels):
        print(f"{i + 1}) {log_level}")

    print("6) SALIR")
    print("");
    # Obtenemos la respuesta del usuario
    choice = int(input("Ingresa tu respuesta: "))

    # Filtramos el archivo de LOGS
    if choice == 1:
        filtered_logs = [line for line in log_file if "WARNING" in line]
    elif choice == 2:
        filtered_logs = [line for line in log_file if "ERROR" in line]
    elif choice == 3:
        filtered_logs = [line for line in log_file if "FATAL" in line]
    elif choice == 4:
        filtered_logs = [line for line in log_file if "PANIC" in line]
    elif choice == 5:
        filtered_logs = [line for line in log_file if any(log_level in line for log_level in log_levels)]
    else:
        print('Programa Terminado!')
        sys.exit()

    # Imprimimos los LOGS filtrados
    for line in filtered_logs:
        print(line)

    # Esperamos a que se ingrese una tecla
    input("Presiona enter para terminar el programa...")
