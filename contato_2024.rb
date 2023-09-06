require 'cgi'
require 'date'
require 'ostruct'

TURNE_MONTHS = ['04', '07', '12']

list = [["Lucas Ceron","11984975469","20/07/2024"], ["Alice Aires ","64984016071","12/02/2024"], ["Ana Maria Maia Dias","35992266208","30/04/2024"], ["Krisley Angel Barbosa Velasquez","68999052277","11/10/2024"], ["Bernardo Emiliano ","34991486669","30/03/2024"], ["Jonatham Ferreira Sales ","79999699579","03/08/2024"], ["Júnio Menezes ","22997777779","25/05/2024"], ["Déborah Eller","31972512927","04/08/2024"], ["Pedro Augusto ","11945771511","25/05/2024"], ["Felipe Augusto de Almeida Aguiar","15996694399","13/07/2024"], ["Jéssica Couto Miranda de Melo","95991436001","16/08/2024"], ["Juan Victor","87988579371","19/10/2024"], ["Romero Florentino de Carvalho","28999928923","22/06/2024"], ["Leonardo Brito Lima ","11959609010","31/08/2024"], ["Gabriel Bosaipo","66992926465","07/06/2024"], ["Rubens Souza ","19991374402","06/10/2024"], ["Matheus Pinheiro","61985626373","31/08/2024"], ["Mateus","31988382283","02/11/2024"], ["Thiago Henrique diniz cristo ","31985812505","19/10/2024"], ["José Davi Oliveira Silva ","11960519573","24/02/2024"], ["Raquel Gomes ","85999934189","27/07/2024"], ["André Matheus ","16988180344","03/08/2024"], ["Wanderson Felício de Lima","11969488151","17/03/2024"], ["Lucas Madson Soares de Oliveira Silva","81992208349","23/11/2024"], ["Nathalia Paulino","42999516235","17/08/2024"], ["Diego Rocha Meira ","11974779799","15/06/2024"], ["Diego Ruy Pereira","11982428245","15/09/2024"], ["Abraão Lima","81987393583","30/03/2024"], ["Daniel Proença Calil","15996875124","12/07/2024"], ["Ana Paula da Silva Almeida ","65984655384","12/02/2024"]]


hora = DateTime.now.hour
final = Array.new
months = [
  OpenStruct.new(name: 'Janeiro', number:'01', dates: [11, 12, 13, 18, 19, 20, 26, 27]),
  OpenStruct.new(name: 'Fevereiro', number:'02', dates: [8, 9, 10, 12, 13, 14, 14, 15, 16, 17, 21, 22, 23, 24, 29]),
  OpenStruct.new(name: 'Março', number:'03', dates: [1, 2, 7, 8, 9, 14, 15]),
  OpenStruct.new(name: 'Abril', number:'04', dates: []),
  OpenStruct.new(name: 'Maio', number:'05', dates: []),
  OpenStruct.new(name: 'Junho', number:'06', dates: [6, 7, 8, 13, 21, 27, 28, 29]), 
  OpenStruct.new(name: 'Julho', number:'07', dates: []),
  OpenStruct.new(name: 'Agosto', number:'08', dates: [8, 9, 10, 15, 16, 17, 22, 23, 29, 30, 31]),
  OpenStruct.new(name: 'Setembro', number:'09', dates: [19, 26, 27]),
  OpenStruct.new(name: 'Outubro', number:'10', dates: [10, 11, 12, 17, 18, 19, 24, 25, 26, 31]),
  OpenStruct.new(name: 'Novembro', number:'11', dates: [1, 2, 7, 8, 9, 14, 15, 16, 21, 22, 23]),
  OpenStruct.new(name: 'Dezembro', number:'12', dates: [])

if hora > 6 && hora < 12
  moment = 'Bom dia'
elsif hora >= 12 && hora < 19
  moment = 'Boa tarde'
elsif hora >= 19 || hora < 6
  moment = 'Boa noite'
end

def blocked_date_message(month, date)
  if month.dates.empty?
    result = "#{month.name}, não temos mais datas disponíveis" 
  else
    result = "#{month.name}, temos: #{month.dates.join(', ')}/#{month.number}" 
  end
  turne = ' Nesse mês, não temos disponibilidade de datas.' if TURNE_MONTHS.include? month.number

  "Infelizmente não temos disponibilidade no dia #{date}.\nNo mês de #{result}.#{turne}\nVocês possuem interesse em alguma outra data?"
end

def free_date_message(month, date)
  "Boas notícias! O dia #{date} está livre para agendas.\nVou te enviar as demais informações para prosseguirmos com o fechamento, tudo bem?\nImportante dizer que o dia #{date} está bem concorrido, então é importante avançar rapidamente, tudo bem?\n\nhttps://impossible-floss-015.notion.site/Projeto-Sola-2024-Igrejas-f1ebb029a72e4ccd9f0a29016b666938?pvs=4"
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