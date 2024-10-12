# 📝 To-do List SwiftUI / MVVM / Testes Unitários

Projeto de um **app To-do List** utilizando a arquitetura **MVVM**, interfaces implementadas com **SwiftUI** e **Testes Unitários** com **XCTest** nativo. Este projeto inclui:

✨ **Principais Funcionalidades**:
- Arquitetura **MVVM** para separação de responsabilidades;
- Implementação de interfaces com **SwiftUI**;
- Testes Unitários de **ViewModels**, **Repository** e **Interfaces** com **XCTest**;
- Mocks para testes unitários e visualização correta de previews;
- Persistência de dados com **UserDefaults**;
- Utilização de **protocols** para persistência com **UserDefaults**;
- Estruturas (`structs`) customizadas;
- Adição e exclusão de tarefas;
- Marcar/desmarcar tarefas como concluídas;
- Animações suaves para as ações de marcar/desmarcar e exclusão de tarefas;
- Ação de exclusão com gesto nativo de **arrastar para o lado** em listas;
- Listas separadas para **tarefas completadas** e **incompletas**.

## 🛠 Requisitos
- **macOS** 11 ou superior
- **Xcode** 12 ou superior
- **Swift** 5.3 ou superior

## 📦 Dependências Externas
Este projeto **não possui dependências externas**, como web services. Basta rodar o projeto diretamente para utilizá-lo.

## 📸 Imagens

| ![GIF do App](to-do-list-swiftui/Assets/gif-currency-converter.gif) | ![Tela Principal](to-do-list-swiftui/Assets/print-dark.png) | ![Adição de Tarefa](to-do-list-swiftui/Assets/print-light.png) |
|:-----------------------------------------------:|:-----------------------------------------------:|:-----------------------------------------------:|
|                **GIF de Funcionamento**         |               **Tela Principal**                |           **Tela de Adição de Tarefa**          |

## 🚀 Como Rodar o Projeto
1. Abra o projeto no **Xcode**.
2. Selecione um simulador ou dispositivo real.
3. Execute o app clicando no botão **Run** ou usando o atalho `Cmd + R`.

## 🔍 Testes
- Para rodar os **Testes Unitários**, selecione o target de teste e use `Cmd + U` no **Xcode**.
- Os testes cobrem:
  - **ViewModels**;
  - **Repository**;
  - **Interfaces**;
  - Previews com **Mocks**.

## 📄 Licença
Este projeto é licenciado sob a **MIT License**. Veja a seção de [Licença](#licença) para mais detalhes.
