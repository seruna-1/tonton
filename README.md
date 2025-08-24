# Introdução

Servidor para gerenciamento de grupo de estudo.

Funcionalidades:

 - Anotações colaborativas.

 - Páginas pessoais para contribuintes.

 - Páginas páginas para projetos.

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
