
# TMDB + Pilar
O aplicativo desenvolvido em Flutter oferece uma experiência envolvente e intuitiva para os entusiastas de filmes, permitindo acesso fácil e rápido a uma vasta biblioteca de informações sobre filmes disponíveis na plataforma TMDB (The Movie Database). Utilizando a poderosa estrutura do Flutter, o aplicativo oferece uma interface de usuário fluida e responsiva em dispositivos móveis.

# Como Inicializar

### Pré-requisitos  

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Editor de código (recomendado: [VSCode](https://code.visualstudio.com/) com [Flutter Extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter))
- Dispositivo Android/iOS ou Emulador

### Passos

1. Clone o repositório:
```bash

git clone git@github.com:gabrielWilli/Tmdb-Pilar.git

```
2. Navegue até o diretório do projeto:

```bash

cd tmdb_pilar

```

3. Instale as dependências:

```bash

flutter pub get

```

4. Execute o aplicativo:

```bash

flutter run -d <NAME_EMULATOR> --dart-define="TOKEN_TMDB=<YOUR_TOKEN_TMDB>"

```

# Principais Tecnologias Utilizadas

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [go_router](https://pub.dev/packages/go_router)
- [bloc](https://pub.dev/packages/bloc)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [injectable](https://pub.dev/packages/injectable)
- [injectable_generator](https://pub.dev/packages/injectable_generator)
- [get_it](https://pub.dev/packages/get_it)
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [equatable](https://pub.dev/packages/equatable)
- [dartz](https://pub.dev/packages/dartz)
- [http](https://pub.dev/packages/http)
- [build_runner](https://pub.dev/packages/build_runner)
- [mocktail](https://pub.dev/packages/mocktail)

# Rotas Implementadas

1.  **Home**: A rota principal do aplicativo, nela podemos ver duas listas sendo a primeira os filmes com a categoria **popular** e a segunda **top rated**.
2.  **Search**: Essa rota é destinada a busca de filmes dentro do aplicativo.
3.  **Details**: Essa rota detalha as informações do filme selecionado.

# **Arquitetura**

Esse projeto trabalha com o conceito de arquitetura limpa, separando o projeto em três camadas principais:

- [data](#data)
- [domain](#domain)
- [presentation](#presentation)

![architecture_link]

### **Data**

A camada de "data" consiste em uma implementação de "repository" (o contrato vem da camada de "domain") e "data sources" - uma geralmente é para obter dados "remote" (API) e a outra para armazenar em cache esses dados. O repository é onde você decide se deseja retornar dados atualizados ou armazenados em cache, quando armazená-los em cache e assim por diante.

### **Domain**

Ele conterá apenas a lógica de negócios principal (use cases) e objetos de negócios (entities). Deve ser totalmente independente de todas as outras camadas.

### **Presentation**

É a camada de interação com o usuário. Você obviamente precisa de widgets para exibir algo na tela. Esses widgets então despacham eventos para o Bloc ou são acionados por métodos e um Cubit e escutam os estados.

# Estrutura do Projeto

Breve descrição da estrutura de diretórios e arquivos do projeto.

```

├── lib

| ├── data

│ │ ├── datasources

| | └── models

│ │ └── repositories

| ├── domain

│ │ ├── entities

| | └── usecases

│ │ └── repositories

| ├── ratchet

│ │ ├── bloc

│ │ │ └── ratchet_bloc.dart

| | | └── ratchet_event.dart

| | | └── ratchet_state.dart

│ │ └── view

│ │ | ├── ratchet_page.dart

│ │ | └── ratchet_list.dart

| | | └── view.dart

| | └── widgets

| | | └── bottom_loader.dart

| | | └── ratchet_list_item.dart

| | | └── widgets.dart

│ │ ├── ratchet.dart

│ ├── app.dart

│ └── main.dart

├── pubspec.lock

├── pubspec.yaml

```

[architecture_link]: https://raw.githubusercontent.com/ResoCoder/flutter-tdd-clean-architecture-course/master/architecture-proposal.png
