# ci-cd-robot-framework

Criando processo de CI/CD com Robot Framework

## Etapas para configurar o CI/CD com Robot Framework e deploy no GitHub Pages:

- [ ] [Criar repositório no GitHub](./docs/criar.md)
- [ ] [Clonar repositório localmente](./docs/clonar.md)
- [ ] [Criar nova branch para o desenvolvimento de CI/CD](./docs/branch.md)
- [ ] Configurar ambiente de desenvolvimento local
    - [ ] [Criar a página de Login](./login/)
    - [ ] [Instalar dependências do projeto com Robot Framework](./docs/robot.md)
    - [ ] [Criar testes automatizados usando Robot Framework](./teste/)
- [ ] [Criar uma branch para o deploy no GitHub Pages](./docs/branch.md)
- [ ] Configurar o deploy automático no GitHub Pages via GitHub Actions
    - [ ] Criar um arquivo de workflow para deploy no GitHub Pages (`.github/workflows/deploy.yml`)
    - [ ] Definir as etapas de deploy do projeto na branch de produção
    - [ ] Configurar a chave do deploy para permitir o upload do conteúdo para GitHub Pages
    - [ ] Verificar se o deploy automático está funcionando corretamente
- [ ] [Criar uma branch para o deploy no GitHub Pages](./docs/branch.md)
- [ ] Configurar GitHub Actions para integração contínua (CI)
    - [ ] Criar um arquivo de workflow do GitHub Actions (`.github/workflows/ci.yml`)
    - [ ] Definir jobs de build, teste e linting no workflow
    - [ ] Configurar cache de dependências para melhorar o tempo de execução
    - [ ] Adicionar etapas para rodar os testes do Robot Framework
    - [ ] Testar se o CI está funcionando corretamente com GitHub Actions
- [ ] Realizar testes no GitHub Pages para verificar se o site foi publicado corretamente
- [ ] Criar um arquivo `README.md` com instruções para o projeto e para o processo de CI/CD
- [ ] Subir todas as mudanças para o repositório remoto
- [ ] Fazer o merge da branch de desenvolvimento para a branch principal (ex: `main`)
- [ ] Monitorar os builds e deploys no GitHub Actions
- [ ] Verificar a integridade do CI/CD e corrigir eventuais falhas
