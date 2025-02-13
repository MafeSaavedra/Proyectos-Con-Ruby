# Clase para modificar archivos
class ModificadorArchivos
  # Inicializar el archivo
  def initialize(archivo)
    @archivo = archivo
  end

  # Leer el archivo
  def leer
    if File.exist?(@archivo)
      contenido = File.read(@archivo)
      contenido
    else
      raise "Error: El archivo #{@archivo} no existe"
    end
  end

  # Convertir Celsius a Fahrenheit
  def convertir_a_fahrenheit(celsius)
    (celsius.to_f * 9 / 5) + 32
  end

  # Escribir en el archivo sin borrar el contenido
  def escribir(contenido)
    File.open(@archivo, 'a') do |file|  # 'a' para agregar al archivo sin borrar
      file.write("\n" + contenido)  # Se agrega un salto de línea antes de escribir
    end
    puts "Se han guardado las nuevas temperaturas en #{@archivo}"
  end

  # Leer temperaturas, convertir y escribir en el mismo archivo
  def convertir_temperaturas
    contenido = leer  # Leer el contenido del archivo

    # Crear un array con el contenido del archivo
    temperaturas_celsius = contenido.split("\n")

    # Recorrer cada dato del array y convertirlo
    temperaturas_fahrenheit = temperaturas_celsius.map { |temp| convertir_a_fahrenheit(temp).round(2) }

    # Agregar título y escribir en el archivo
    escribir("\nTemperaturas en Fahrenheit:\n" + temperaturas_fahrenheit.join("\n"))

    # Mostrar el contenido actualizado del archivo
    puts "Contenido actualizado del archivo:"
    puts leer

     # Mostrar la ruta del archivo para descarga manual
     ruta = File.expand_path(@archivo)
     puts "\n📂 Puedes descargar el archivo en: #{ruta}"
  end
end

# Crear una instancia y ejecutar
mi_archivo = ModificadorArchivos.new("ejemplo.txt")
mi_archivo.convertir_temperaturas
