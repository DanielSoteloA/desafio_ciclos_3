=begin
  Desafío - Flujo, ciclos y Métodos (III)
  Autor: Daniel Sotelo
  archivo: desafio_ciclos3.rb
  Para [Version][S.O.]:
    ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x64-mingw-ucrt]
    ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
=end

#Menu
def menu
  #limpia Pantalla si es windows cls sino clear
 if Gem.win_platform?
   #para SO Windows
   system 'cls'
 else
   #para Otros
   system 'clear'
 end
 
 print "**************************************************\n"
 print "*    Desafío - Flujo, ciclos y métodos (III)     *\n"
 print "*                                                *\n"
 print "*  calcula nuevo salario en funcion al %....[1]  *\n"
 print "*  Adivina el número .......................[2]  *\n"
 print "*  cálculo de IMC ..........................[3]  *\n"
 print "*                                                *\n"
 print "**************************************************\n"
 print "ingresa opción => "

 #opcion ingresada por el usuario
 op = gets.chomp.to_i
 
 if (op==1)
   nuevo_salario
 elsif (op==2)
   numero_aleatorio
 elsif (op==3)
   imc
 else
   puts "¡¡¡Hasta Luego!!!"
 end
end

def repetir
  numero_aleatorio
end

#Metodo Calculo Salario
def nuevo_salario
 #solicita el ingreso del salario actual
 print "ingresa salario actual --> "
 salario = gets.chomp.to_i
 
 #solicita el porcentaje de aumento del salario
 print "ingresa porcentaje de aumento del salario --> "
 incremento = gets.chomp.to_f
 
 #calcula el nuevo salario a partir del salario actual y el porcentaje de aumento
 nuevo_salario = salario.to_f + (salario.to_f * (incremento/100))
 puts "Nuevo Salario: %.0f" % [nuevo_salario]

 #Si el resultado es 0 o igual al salario original da una notificación
 if (nuevo_salario.to_i == 0)
   puts "los datos deben ser numéricos"
 elsif (nuevo_salario.to_i == salario)
   puts "el porcentaje de aumento debe ser mayor a 1"
 else
 end
end

#metodo numero aleatorio
def numero_aleatorio
 #se establece rango en que se buscara número al azar 
 n = 1
 m = 5
 
 #solicita el ingreso de un numero
 print "ADIVINA EL NUMERO\n"
 print "ingresa un número del #{n} al #{m} --> "
 num_usuario = gets.chomp.to_i

 #se obtiene numero al azar
 num_sistema = Random.rand(n..m)

 if(num_usuario<n || num_usuario>m)
    print "No ingresaste un número valido \n Deseas intentar de nuevo [Si] [No] --> "
    resp = gets.chomp.to_s
    if (resp.upcase=='SI')
      repetir
    else
      puts "¡¡¡Hasta Luego!!!"
    end
  elsif (num_usuario == num_sistema)
    print "Ganaste el número era #{num_sistema}\n"
  else
    print "Perdiste el número era #{num_sistema}\n Deseas jugar de nuevo [Si] [No] --> "
    resp = gets.chomp.to_s
    if (resp.upcase=='SI')
      repetir
    else
      puts "¡¡¡Hasta Luego!!!"
    end
  end
end

#metodo calculo IMC
def formula_imc(valor1, valor2)
  imc = valor1 / valor2**2
end

def calcular_imc(imc)
  puts("Tu índice de masa corporal es => #{imc}")
  if imc < 18.5
    puts "El índice calculado es Bajo de peso"
  elsif imc <= 18.5 || imc <= 24.9
    puts "El índice calculado es Normal"
  elsif imc <= 25.0 || imc <= 29.9
    puts "El índice calculado es Sobrepeso"
  elsif imc <= 30.0 || imc <= 34.9
    puts "Obesidad grado I (Moderado)"
  elsif imc <= 35.0 || imc <= 39.9
    puts "Obesidad grado II (Severo)"
  else
    puts "Obesidad grado III (Muy Severo)"
 end
end

def imc
  puts("***¡Bienvenido/a al sistema de cálculo IMC!***")
  print "Ingresa tu peso en Kilogramos: --> "
  peso = gets.chomp.to_f

  print "Ingresa tu altura expresada en metros: --> "
  altura = gets.chomp.to_f

  resultado = calcular_imc(formula_imc(peso, altura))
  puts(resultado)
end

menu