list = [["Davi Seiffert" 	,"61985969286","11/01/2024"], ["Diogo"	,"11984503570","20/01/2024"], ["Carla"	,"17742043005","26/01/2024"], ["Narayane MC Namara" 	,"62992469725","26/01/2024"], ["Matheus Raduan",	"19981907331","27/01/2024"], ["Narayane MC Namara" 	,"62992469725","27/01/2024"]]

require 'cgi'
require 'date'
require 'ostruct'

TURNE_MONTHS = ['07', '09']

hora = DateTime.now.hour
final = Array.new
months = [
  OpenStruct.new(name: 'Janeiro', number:'01', dates: [11, 12, 13, 18, 19, 20, 26, 27]),
  OpenStruct.new(name: 'Setembro', number:'09', dates: [4, 11, 19, 20]),
  OpenStruct.new(name: 'Outubro', number:'10', dates: [9, 10, 11, 16, 17, 18, 23, 24, 27, 28, 30]), 
  OpenStruct.new(name: 'Novembro', number:'11', dates: [7, 8, 9, 13, 14, 15, 20, 21, 22, 25, 27, 28]),
  OpenStruct.new(name: 'Dezembro', number:'12', dates: [15, 16, 18, 19, 20, 21, 22, 23])
]

if hora > 6 && hora < 12
  moment = 'Bom dia'
elsif hora >= 12 && hora < 19
  moment = 'Boa tarde'
elsif hora >= 19 || hora < 6
  moment = 'Boa noite'
end

def blocked_date_message(month, date)
  if month.dates.empty?
    result = "#{month.name}, não temos mais datas disponíveis." 
  else
    result = "#{month.name}, temos: #{month.dates.join(', ')}/#{month.number}" 
  end
  turne = ' Algumas datas do mês estão bloqueadas por conta das gravações da banda.' if TURNE_MONTHS.include? month.number

  "Infelizmente não temos disponibilidade no dia #{date}.\nNo mês de #{result}.#{turne}\nVocês possuem interesse em alguma outra data?"
end

def free_date_message(month, date)
  "Boas notícias! O dia #{date} está livre para agendas.\nVou te enviar as demais informações para prosseguirmos com o fechamento, tudo bem?\nImportante dizer que o dia #{date} está bem concorrido, então é importante avançar rapidamente, tudo bem?"
end

def message(free_date, month, date)
  if free_date
    result = free_date_message(month, date) 
  else
    result = blocked_date_message(month, date) 
  end
  result
end

list.each do |arr|
  name = arr[0].split(" ").first.capitalize
  date = arr[2]
  phone = arr[1]

  date_splitted = date.split('/')
  month_number = date_splitted[1]
  day_number = date_splitted.first
  next if date_splitted.last == '2025'
  month = months.select { |m| m.number == month_number}.first
  free_date = month.dates.include? day_number.to_i

  text = "#{moment}, #{name}. Tudo bem?\n#{message(free_date, month, date)}"
  text = CGI.escape text
  url = "https://web.whatsapp.com/send?phone=55#{phone}&text=#{text}\n\n"
  final << url
end

puts "Hello"
IO.popen('pbcopy', 'w') { |pipe| pipe.puts final }