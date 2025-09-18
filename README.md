# Robot Framework - Restful Booker

Este repositório contém testes automatizados para a API [Restful Booker](https://restful-booker.herokuapp.com), desenvolvidos utilizando **Robot Framework** com a **RequestsLibrary**.  
O objetivo é validar operações de CRUD (Create, Read, Update, Delete) em reservas de hotel.

---

## 📂 Estrutura do Projeto

```
├── resources/ # Arquivos com palavras-chave reutilizáveis (keywords)
├── results/ # Resultados da execução dos testes (logs, reports, outputs)
├── tests/ # Casos de teste organizados
└── interactive_console_output.xml # Saída gerada pela execução no console
```
---

## 🚀 Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/)
- [RequestsLibrary](https://marketsquare.github.io/robotframework-requests/)

---

## ⚙️ Como Executar os Testes

1. Clone este repositório:
```
   git clone https://github.com/SEU_USUARIO/robotframework-restful-booker.git
   cd robotframework-restful-booker/tests
```
2. Execute os testes:

```
   robot -d ../results booking_tests.robot
```
3. Acesse os relatórios gerados:
```
   Log: results/log.html
   Report: results/report.html
```
---
## 🧪 Testes Implementados

[GET] Listar todas as reservas
[POST] Criar nova reserva
[PUT] Atualizar reserva existente
[DELETE] Excluir reserva
---
## ✨ Autor

Desenvolvido por Emanuel Felipe como prática de automação de testes com Robot Framework.
