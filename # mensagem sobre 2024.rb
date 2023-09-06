# mensagem sobre 2024.
require 'cgi'
final = []
list = [["Paulo Ribeiro Nascimento", "44999016844"], ["Leonardo", "85986872150"], ["Beatriz", "11961246251"], ["Anna Queiroz ", "62981255898"]]
list.each do |item|
  name = item[0].split(' ').first
  phone = item[1].delete(' ')
  text = "Olá, #{name}, tudo bem? Boa noite!\n\nRecebemos sua solicitação de agenda para 2024.\nNossa agenda de 2024 ainda não foi aberta. A partir de agosto, receberemos convites para essa data e voltaremos a entrar em contato contigo, tudo bem?\n\nDiego\nProjeto Sola."
  text = CGI.escape text
  url = "https://web.whatsapp.com/send?phone=55#{phone}&text=#{text}\n\n"
  final << url
end
IO.popen('pbcopy', 'w') { |pipe| pipe.puts final }

# organização dos meses

list = ['Sara Jane Fernandes Viana', '27996874827','12/04/2025'], ['Homero Flávio Cordeiro Júnior', '011952737554','26/08/2023'], ['Fábio de Azevedo Soares', '11995699796','25/11/2023'], ['Millena Costa Meira', '61984277052','09/12/2023'], ['Felipe Ragazzi', '11997768366','07/10/2023'], ['Ana Cristina',	'11993698807','09/09/2023'], ['Lucas','11934278123','04/02/2024'], ['KARINE BORGES','31988345567','08/09/2023'], ['Plinio Cesar da Silva', 	'21987864438','30/09/2023'], ['Paulo Ritzel',	'84981859333','31/10/2023'], ['Jonatham Ferreira Sales',	'79999699579','03/08/2024'], ['Weide alexandre bento alves',	'85998276583','07/10/2023'], ['Sanzio Henrique Vieira Filho', 	'31997123651','28/10/2023'], ['Mariany Galvão', 	'22999185436','08/06/2024'], ['Davi Seiffert', 	'61985969286','11/01/2024'], ['Melissa Rodrigues de Brito Alves', 	'65993526506','23/09/2023']
list.select { |i| i[2].split('/')[2] == '2023'}.map { |item| item[2].split('/')[1] }.uniq.sort

