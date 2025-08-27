# Introdução

TonTon é um projeto de site para estudo colaborativo.

O site oferece ao público uma interface para navegar entre os materiais produzidos pela comunidade e visualizar os contribuintes e seus perfis.

O material é armazenado em um repositório Git. Qualquer pessoa pode propor uma contribuição ou iniciar um novo tópico. Caso a alteração seja aceita por um administrador, ela será incorporada ao repositório e estará disponível no site, junto com uma referência à pessoa que a produziu.

Para propor uma alteração, é necessário fazer um pull request. Para começar, crie seu próprio fork do [repositório de material](https://github.com/seruna-1/tonton-repo/tree/main#) e, tendo feito isso, clone-o localmente:

	git clone "git@github.com:seruna-1/tonton-repo.git"

	cd tonton-repo

No clone do seu fork, inicie uma nova branch, de preferência com um nome explicativo e em inglês. Por exemplo, vamos iniciar um tópico de herança (inheritance) de classes em ruby.

	git branch ruby-inheritance

	git switch ruby-inheritance

Caso esse tópico já exista, você pode nomear sua branch com o prefixo [to-] ou [on-]

	git branch to-ruby-inheritance

	git switch to-ruby-inheritance

Agora, crie um arquivo Markdown contento o conteúdo que você quer propor como contribuição àquele tópico. Caso o tópico já exista, basta editar o arquivo desejado. Caso você queira adicionar um novo arquivo, procure um local apropriado. No nosso exemplo, vamos criar o arquivo no seguinte caminho:

	mkdir -p ruby/classes

	touch ruby/classes/inheritance.md

Após fazer as edições necessárias, faça um commit na branch de contribuição:

	git add -A

	git commit -m "[ New topic: ruby class inheritance ]"

Caso fosse uma alteração sobre um tópico já existente, o commit poderia ter a mensagem:

	git commit -m "[ More on: ruby classes inheritance ]"

Atualize a branch remota:

	git push origin main

Agora o seu fork no GitHub contém as modificações prontas para um pull request. Uma vez feita e aprovada por um adiministrador, a requisição será integrada ao repositório e poderá ser visualizada publicamente no site. Um perfil para o contribuinte também será criado.

# Perfil do contribuinte

As pessoas que contribuiram com o material são registradas no histórico de versionamento do Git e ganham perfis no site. Cada página exibe as pessoas que contribuiram com ela, e os perfis dessas pessoas podem ser acessados tanto pela referência na página quanto pela ferramenta de busca.

O perfil do contribuinte contém:

 - Tópicos com os quais aquela pessoa contribuiu

 - Tópicos criados

 - Tempo de presença no grupo e etiquetas de idade, como [padawan] e [eremita], que são geradas automaticamente.

 - Desafios concluídos.

Informações adicionais incluem:

 - Etiquetas de cargo, como [administrador] ou [desenvolvedor]. Pessoas que já ocuparam cargos mas não ocupam atualmente também possuem etiquetas, como [ex-adiministrador].

 - Etiquetas de eventos, dadas por participação em eventos, como conferências.

Além de tudo isso, o perfil do contribuinte pode conter uma mensagem pessoal.

# Plano de desenvolvimento

TODO

# Building

Clone o repositório:

	git clone "https://github.com/seruna-1/tonton.git"

	cd tonton

Instale ruby e bundler com o seu gerenciador de pacotes. Exemplo:

	pacman -S ruby ruby-bundler

Instale as gems:

	bundle install

E inicie o servidor:

	bundle exec rails server

O servidor estará acessível em [http://[::1]:3000] ou [http://localhost:3000].

# Repositório de anotações

Repositórios de anotações são criados (clonados), removidos e atualizados por um administrador, na central de adimnistração de repositório [/repositories].

Estrutura exemplo de um repositório de anotações:

	collaboration/

		programming/

			ruby/

				message.md

				about.json

				icon.png
