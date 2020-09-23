## Dominando o básico
### Principais elementos do RSPEC

#### Describe
É usado para definir um "grupo de exemplos", e pode receber como paramêtros uma classe ou uma string.
```ruby
describe Hero do
 
end
```

#### Context
É usado para agrupar os testes de um mesmo contexto. Apesar de não ser obrigatório, ele ajuda a tornar os testes mais legíveis e pode ser usado quantas vezes forem necessárias.
 
```ruby
describe Hero do
 context 'Quando está com uma armadura de aço'  do
    ...
 end
 context 'Quando está com uma armadura de diamante'  do
    ...
 end
end
```

#### It
É usado para definir um exemplo, um teste. É possível ter quantos its forem necessários.
 
```ruby
describe Hero do
 context 'Quando está com uma armadura de aço'  do
  it 'tem 5000 pontos de HP' do
    ...
  end
 end
end
```

#### Expect
É onde verificamos se um determinada condição foi satisfeita para que seja determinado se o teste passou.
 
```ruby
describe Hero do
 context 'Quando está com uma armadura de aço'  do
  it 'tem 5000 pontos de HP' do
    hero = Hero.new
    expect(hero.hp).to eq(5000)
  end
 end
end
```

### O que são os matchers

Matcher é uma instrução utilizada para verificar se uma determinada condição está sendo atendida. Ós tópicos adiante contém alguns exemplos agrupados por finalidade.

Todos os matchers padrões do RSpec podem ser consultados neste [link](https://rubydoc.info/github/rspec/rspec-expectations/RSpec/Matchers).

#### Matchers de equivalência e identidade
```ruby
# Passa se o valor for igual ao esperado
expect(actual).to eq(expected)

# Passa se x.eql?(y)
expect(x).to eql(y)

# Passa se x.equal?(y)
expect(x).to be(y)
```

#### Matchers de comparação
```ruby

# Passa se x for maior que y
expect(x).to be > y

# Passa se x for maior ou igual que y
expect(x).to be >= y

# Passa se x for menor ou igual que y
expect(x).to be <= y

# Passa se x for menor que y
expect(x).to be < y

# Passa se x bater com a expressão regular
expect(x).to match(/expression/)
```

#### Matchers de classe e tipo
```ruby

# Passa se x for uma instância da classe y
expect(x).to be_an_instance_of(y)

# Passa se x for um objeto y
expect(x).to be_an_instance_of(y)
```

#### Matchers de true/false/nil
```ruby
# Passa se x não for falso ou nulo
expect(x).to be_truthy

# Passa se x for igual a true
expect(x).to be true

# Passa se x falso ou nulo
expect(x).to be_falsy

# Passa se x for igual a false
expect(x).to be false

# Passa se x nulo
expect(x).to be_nil

# Passa se x não for nulo
expect(x).to_not be_nil
```

#### Matchers de erro

```ruby
# Passa se a chamada levantar um erro
expect { ... }.to raise_error

# Passa se a chamada levantar um erro do tipo ErrorClass
expect { ... }.to raise_error(ErrorClass)

# Passa se a chamada levantar um erro com a mensagem 'message'
expect { ... }.to raise_error('message')

# Passa se a chamada levantar um erro do tipo ErrorClass com a mensagem 'message'
expect { ... }.to raise_error(ErrorClass, 'message')
```

## Testando Models

Os models são classes rubys que se conectam às tabelas do banco de dados para facilitar a manipulação delas. O teste dos models serve para garantir que a estrutura dos dados estjam corretas.

### Quando utilizar
Nem sempre é necessários testá-los, geralmente somente quando os models tiverem validações customizadas.

## Testes de requests

São testes de integração (ou seja, que testam vários componentes ao mesmo tempo) que realiza uma request completa para um endpoint do seu projeto e verifica se ele está respondendo adequadamente.

Exemplo:
```ruby
describe 'GET /home' do
  it "has the message 'Hello World'" do
    get home_path
    expect(reponse.body).to include('Hello World')
  end
end
```

### Porque utilizar?
1. Para garantir que seu endpoint está devolvendo o status code e a resposta esperada dele.
1. Para garantir que a integração entre od diversos elementos (model, controller, rota etc.) necessários para a resposta do endpoint estão funcionando adequadamente juntos.

### Quando utilizar
Sempre que possível, principalmente se a aplicação trata-se de uma API.
