require 'cgi'
require 'date'

type_string = 'pj'

month = 'Setembro'

contratante = 'Quinta Igreja Presbiteriana de Volta Redonda'
endereco = 'Rua Aracaju'
numero = '213'
bairro = 'Santo Agostinho'
cidade = 'Volta Redonda'
estado = 'RJ'
cep = '27210-340'
cnpj = '27.965.482/0001-70'

representante = 'Rev. Silas Daniel de Paulo'
nacionalidade = 'Brasileira'
estado_civil = 'Casado'
profissao = 'Pastor Presbiteriano'
rg = '10. 642.692'
orgao_emissor = 'SSP/SP'
cpf = '018.947.568-43'
endereco_representante = 'Rua Salvador'
numero_representante = '195'
bairro_representante = 'Morro da Conquista'
cidade_representante = 'Volta Redonda'
estado_representante = 'RJ'
cep_representante = '27210-100'
local_evento = 'Cine 9 de Abril'
data_evento = '06/10/2023'
horario_evento = '20 horas'
entrada = 'gratuita'
endereco_evento = 'rua 14'
numero_evento = '235'
bairro_evento = 'Vila Santa Cecília'
cidade_evento = 'Volta Redonda'
estado_evento = 'Rio de Janeiro'
cep_evento = '27260-140'

email_para_contrato = 'vinibosco@hotmail.com'

contratante = contratante.split(' ').map(&:capitalize).join(' ')
endereco = endereco.split(' ').map(&:capitalize).join(' ')
bairro = bairro.split(' ').map(&:capitalize).join(' ')
cidade = cidade.split(' ').map(&:capitalize).join(' ')
representante = representante.split(' ').map(&:capitalize).join(' ')
nacionalidade = nacionalidade.downcase
estado_civil = estado_civil.downcase
profissao = profissao.downcase
endereco_representante = endereco_representante.split(' ').map(&:capitalize).join(' ')
bairro_representante = bairro_representante.split(' ').map(&:capitalize).join(' ')
cidade_representante = cidade_representante.split(' ').map(&:capitalize).join(' ')
estado_representante = estado_representante.split(' ').map(&:capitalize).join(' ')

date = DateTime.now
pf = "
  <b> #{representante.split(' ').map(&:capitalize).join(' ')} </b>, #{nacionalidade.downcase}, #{estado_civil.downcase}, #{profissao.downcase}, portador(a) do RG nº #{rg}, #{orgao_emissor},
  inscrito(a) no CPF sob o nº #{cpf}, residente e domiciliado(a) na #{endereco_representante.split(' ').map(&:capitalize).join(' ')}, #{numero_representante}, #{bairro_representante.split(' ').map(&:capitalize).join(' ')}, CEP #{cep_representante}, #{cidade_representante.split(' ').map(&:capitalize).join(' ')}/#{estado_representante}, doravante denominada <b>CONTRATANTE</b>,
"
pj = "
<b> #{contratante.split(' ').map(&:capitalize).join(' ')} </b>, com endereço na #{endereco.split(' ').map(&:capitalize).join(' ')}, #{numero}, #{bairro.split(' ').map(&:capitalize).join(' ')}, CEP #{cep}, #{cidade.split(' ').map(&:capitalize).join(' ')}/#{estado}, inscrita no CNPJ sob o nº #{cnpj}, doravante denominada <b>CONTRATANTE</b>, neste ato representada
por #{representante.split(' ').map(&:capitalize).join(' ')}, #{nacionalidade}, #{estado_civil}, #{profissao}, portador(a) do RG nº #{rg}, #{orgao_emissor},
inscrito(a) no CPF sob o nº #{cpf}, residente e domiciliado(a) na #{endereco_representante}, #{numero_representante}, #{bairro_representante}, CEP #{cep_representante}, #{cidade_representante}/#{estado_representante},
"
type = binding.local_variable_get(type_string)
contract = "
<!DOCTYPE html>
<html lang='en'>

<head>
  <meta charset='UTF-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <title>Contrato - Projeto Sola</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
    section.contract {
      width: 80vw;
      display: flex;
      flex-direction: column;
      justify-content: center;
      text-align: justify;
    }
    
    section.assinaturas {
      width: 100%;
      display: flex;
      justify-content: space-evenly;
      font-weight: bold;
    }

    section.contratante, section.contratada, p.date {
      text-align: center;
    }

    section.assinaturas p {
      margin: .2rem
    }

    .title {
      text-align: center;
    }

    h4 {
      margin: 0
    }

    h3 {
      margin: 1rem 0;
    }
    
    h5 {
      margin: 0;
      margin-top: 12px;
    }
  </style>
</head>

<body>
  <section class='contract'>

    <h3 class='title'> CONTRATO DE PRESTAÇÃO DE SERVIÇOS ARTÍSTICOS </h3>

    <p> 
    #{type} e, do outro lado, <b>PROJETO SOLA ARTIGOS PROMOCIONAIS E EVENTOS LTDA</b>, inscrita no CNPJ sob
      o n° 12.758.387/0001-29, com endereço na Rua Campos Sales, n° 1545, Apartamento 026-Torre 1, Centro, Barueri/SP,
      doravante denominada <b>CONTRATADA</b>, neste ato representada por GUILHERME IAMARINO SANTOS, brasileiro, casado,
      inscrito no CPF sob o n° 368.503.218-62, com endereço na Rua Adelino Cardana, 431, Apto 197 bloco B, Bethaville,
      Barueri/SP, Cep 06401-147, têm entre si justos e contratados os seguintes termos:
    </p>

    <h3>DO OBJETO DO CONTRATO</h3>

    <h4>Cláusula 01</h4>
    <p>
      O presente contrato tem como objeto a participação da <b>CONTRATADA</b> no evento de entrada #{entrada} realizado pelo
      <b>CONTRATANTE</b>, no dia #{data_evento}, na <b>#{local_evento}</b>, com endereço na #{endereco_evento}, #{numero_evento}, #{bairro_evento}, CEP #{cep_evento}, #{cidade_evento}/#{estado_evento}, com previsão de início da apresentação às #{horario_evento}.
    </p>
    <h4>Cláusula 02</h4>
    <p>
      A participação da <b>CONTRATADA</b> consistirá em uma apresentação realizada em um período de aproximadamente 90 (noventa) minutos.
    </p>

    <h3>
      DO PREÇO E DA FORMA DE PAGAMENTO
    </h3>

    <h4>
      Cláusula 03
    </h4>
    <p>
      O valor do presente contrato é de <b>R$ 7.500,00</b>, a ser pago à <b>CONTRATADA</b> da seguinte forma: <b>R$ 1.500,00</b>, referente
      à
      entrada, via depósito bancário, já depositado na conta de <b>titularidade da empresa contratada, Agência: 2980,
      conta:
      32619-9, Itaú S.A.</b>, e o remanescente, no valor de <b>R$ 6.000,00</b>, deverá ser depositado na mesma conta da <b>CONTRATADA</b>
      até o dia do evento, ou seja, #{data_evento}.
    </p>

    <h5>
      Parágrafo Primeiro
    </h5>
    <p>
      A comprovação do pagamento se dará através da devida compensação dos valores acima especificados, não sendo
      considerados para esse fim depósitos realizados no autoatendimento ou depósitos em cheques.
    </p>

    <h5>
      Parágrafo Segundo
    </h5>
    <p>
      A reserva da data escolhida e a consequente confirmação da participação da <b>CONTRATADA</b> no evento da <b>CONTRATANTE</b>
      ficam
      condicionadas ao pagamento do valor referente à entrada supramencionada.
    </p>
    <h3>
      DAS OBRIGAÇÕES
    </h3>
    <h4>
      Cláusula 04
    </h4>
    <p>
      O <b>CONTRATANTE</b> deverá arcar com os custos de alimentação, transporte (tanto no local do evento, quanto na cidade de
      origem da banda), seja aéreo ou terrestre e, sendo o caso, hospedagem, para 7 (sete) pessoas.
    </p>
    <h4>
      Cláusula 05
    </h4>
    <p>
      Fica estabelecido que o <b>CONTRATANTE</b> deverá providenciar por sua inteira e exclusiva responsabilidade todas as
      licenças e alvarás necessários à realização do evento junto aos órgãos competentes, incluindo o Juizado de
      Menores,
      Prefeitura Municipal, Órgão de Censura de Diversões Públicas, instituições arrecadadoras de direitos autorais
      (associadas ou independentes) e todas as demais entidades que possam interferir na realização do evento.
    </p>
    <h4>
      Cláusula 06
    </h4>
    <p>
      O local da apresentação deverá ser cedido à <b>CONTRATADA</b>, com três horas de antecedência, para reconhecimento do
      local, passagem de som e montagem dos equipamentos.
    </p>
    <h4>
      Cláusula 07
    </h4>
    <p>
      O <b>CONTRATANTE</b> deverá fornecer água mineral no palco para todos os integrantes da banda da <b>CONTRATADA</b>.
    </p>
    <h4>
      Cláusula 08
    </h4>
    <p>
      Fica a cargo do <b>CONTRATANTE</b>, ainda, providenciar toda a divulgação do evento.
    </p>
    <h4>
      Cláusula 09
    </h4>
    <p>
      O <b>CONTRATANTE</b> deverá zelar pelos objetos e acessórios de propriedade da <b>CONTRATADA</b> utilizados para a realização da
      apresentação, tais como instrumentos musicais, cabos e aparelhos eletrônicos, devendo a <b>CONTRATADA</b> ser ressarcida
      em
      caso de furto ou roubo no local do evento ou, ainda, danificação provocada pela má conservação do sistema elétrico
      do espaço ou por qualquer pessoa relacionada ao evento que não seja um dos integrantes da equipe da <b>CONTRATADA</b>.
    </p>
    <h4>
      Cláusula 10
    </h4>
    <p>
      Qualquer ato danoso cometido por parte da <b>CONTRATADA</b> será de total responsabilidade da mesma, bem como o conteúdo
      do
      que será apresentado no evento.
    </p>
    <h4>
     Cláusula 11
    </h4>
    <h5>Parágrafo Primeiro</h5>
    <p>
      As partes acordam que a estrutura de som do local designado para a realização do evento deverá ser avaliada e aprovada previamente pela equipe técnica, conforme estipulado neste contrato. A referida avaliação ocorrerá por meio de uma visita técnica ao local do evento.
    </p>
    <h5>Parágrafo Segundo</h5>
    <p>
      Caso a equipe técnica constate a necessidade de locação de equipamentos adicionais para garantir a qualidade da estrutura de som, a contratação dos mesmos será obrigatória para a efetivação deste contrato.
    </p>
    <h5>Parágrafo Terceiro</h5>
    <p>
      A equipe técnica se reserva o direito de reprovar a estrutura de som existente no local, caso esta não atenda aos padrões técnicos necessários para a realização do evento. Nesse caso, a contratação de equipamentos adicionais será obrigatória para o cumprimento deste contrato.
    </p>
    <h5>Parágrafo Quarto</h5>
    <p>
      Todos os custos decorrentes da locação de equipamentos adicionais necessários serão de responsabilidade da parte contratante.
    </p>
    <h5>Parágrafo Quinto</h5>
    <p>
      A não aprovação da estrutura de som pelo time técnico somada a não locação dos equipamentos necessários, quando indicado, poderão resultar na rescisão deste contrato, sem qualquer ônus para a parte contratada.</p>
    <h3>
      DAS DISPOSIÇÕES FINAIS
    </h3>
    <h4>
      Cláusula 12
    </h4>
    <p>
      A infração das disposições deste contrato sujeitará o <b>CONTRATANTE</b> ou a <b>CONTRATADA</b> a <b>arcarem com o pagamento da
      multa no valor de 50% (cinquenta por cento)</b> do valor total do contrato, exceto por motivo de caso fortuito ou
      força
      maior, conforme artigo 393 e parágrafo único do Código Civil.
    </p>
    <h5>
      Parágrafo Primeiro
    </h5>
    <p>
      Em caso de cancelamento por parte do <b>CONTRATANTE</b>, ressalvadas as razões de caso fortuito ou força maior, os
      valores
      já depositados não serão devolvidos ou reaproveitados, ainda que para o mesmo evento em outra data.
    </p>

    <h5>
      Parágrafo Segundo
    </h5>
    <p>
      Se o cancelamento do evento for ocasionado por motivo de caso fortuito ou força maior, o <b>CONTRATANTE</b>, com prévia
      consulta de disponibilidade, poderá agendar nova data para a realização do evento, nos mesmos moldes, ressalvados
      os
      valores já pagos.
    </p>

    <h4>
      Cláusula 13
    </h4>
    <p>
      Fica eleito o Foro da cidade de São Paulo/SP para dirimir quaisquer conflitos oriundos deste contrato, com
      renúncia
      expressa de qualquer outro foro, por mais privilegiado que seja.
    </p>

    <p>
      Firmam as partes o presente instrumento particular de contrato, em duas vias de igual teor, na presença de duas
      testemunhas infra assinadas e qualificadas.
    </p>


    <p class='date'>
      São Paulo, #{date.day} de #{month} de #{date.year}.
    </p>
  </section>
  <section class='assinaturas'> 
    <section class='contratante'>

      <p>
        ____________________________________
      </p> 
      <p>
        #{contratante.split(' ').map(&:capitalize).join(' ') if type_string == 'pj'}
      </p>
      <p>
        #{representante.split(' ').map(&:capitalize).join(' ')}
      </p>
      <p>
        Contratante
      </p>
    </section>
    
    <section class='contratada'>

      <p>
        ____________________________________
      </p>
      <p>
        Projeto Sola
      </p>
      <p>
        Guilherme Iamarino Santos
      </p>
      <p>
        Contratada
      </p>
    </section>
  </section>
</body>

</html>
"
IO.popen('pbcopy', 'w') { |pipe| pipe.puts contract }

