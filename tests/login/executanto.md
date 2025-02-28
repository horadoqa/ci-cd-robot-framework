# Executando os cenários

Se for executar cenário por cenário: 

```bash
robot --outputdir resultados cenario1.robot
```
Se for executar todos os cenários de um diretório/pasta: 

```bash
robot --outputdir resultados ./login/*.robot
```

```bash
robot cenario1.robot cenario2.robot cenario3.robot
```

Executando um suite de testes

```bash
robot --outputdir resultados suite_de_testes.robot 
```
