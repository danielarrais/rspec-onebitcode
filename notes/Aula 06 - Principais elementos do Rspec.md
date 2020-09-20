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
