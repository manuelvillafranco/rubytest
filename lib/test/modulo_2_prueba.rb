# frozen_string_literal: true

# Variables, tipos de datos, y operadores
nombre = "Juan"
edad = 30
es_mayor_de_edad = edad >= 18

puts "Nombre: #{nombre}"
puts "Edad: #{edad}"
puts "¿Es mayor de edad? #{es_mayor_de_edad}"

# Condicionales
if es_mayor_de_edad
  puts "Puede votar."
else
  puts "No puede votar."
end

# Clase y Objeto
class Persona
  def initialize(nombre, edad)
    @nombre = nombre
    @edad = edad
  end

  def saludar
    "Hola, mi nombre es #{@nombre} y tengo #{@edad} años."
  end
end

persona = Persona.new("Luis", 25)
puts persona.saludar

# Array
numeros = [1, 2, 3, 4, 5]
numeros.each do |numero|
  puts numero
end

# Hash
persona = {nombre: "Ana", edad: 28}
puts "Nombre: #{persona[:nombre]}, Edad: #{persona[:edad]}"

#herencia
class Animal
  def respirar
    "Estoy respirando"
  end
end

class Perro < Animal
  def ladrar
    "Guau guau"
  end
end

perro = Perro.new
puts perro.respirar  # "Estoy respirando"
puts perro.ladrar    # "Guau guau"

module Habilidades
  def correr
    "Estoy corriendo"
  end
end

class Gato
  include Habilidades
end

gato = Gato.new
puts gato.correr  # "Estoy corriendo"

def saludar
  yield if block_given?
end

saludar { puts "Hola desde un bloque" }

saludar = Proc.new { puts "Hola desde un Proc" }
saludar.call

saludar = -> { puts "Hola desde una Lambda" }
saludar.call

cadena = "Hola Mundo"
puts cadena.upcase      # "HOLA MUNDO"
puts cadena.downcase    # "hola mundo"
puts cadena.reverse     # "odnuM aloH"
puts cadena.length      # 10

array = [1, 2, 3, 4, 5]
puts array.push(6)      # [1, 2, 3, 4, 5, 6]
puts array.pop          # 6
puts array.shift        # 1
puts array.unshift(0)   # [0, 2, 3, 4, 5]

hash = {nombre: "Luis", edad: 30}
puts hash[:nombre]      # "Luis"
puts hash.keys          # [:nombre, :edad]
puts hash.values        # ["Luis", 30]
hash[:ciudad] = "Madrid"
puts hash               # {:nombre=>"Luis", :edad=>30, :ciudad=>"Madrid"}