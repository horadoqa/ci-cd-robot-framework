name: Robot Framework Tests

on: push 

jobs:
  test_api:
    name: API Tests
    runs-on: ubuntu-24.04

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.12'

      - name: Install dependencies
        run: |
          echo Instalação das depedências do Projeto
          pip install robotframework
          pip install robotframework-requests

      - name: Run Robot Framework tests
        run: |
          echo Executando os testes de API do Robot
          robot --name "API and Web Tests" --outputdir results/ tests/serverest/tests/api/ 
      
      - name: Test Report
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: robot-framework-report-api
          path: results/
  
  test_web:
    name: Web Tests
    runs-on: ubuntu-24.04

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.12'

      - name: Install dependencies
        run: |
          echo Instalação das depedências do Projeto
          pip install robotframework-seleniumlibrary

      - name: Run Robot Framework tests
        run: |
          echo Executando os testes de API do Robot
          robot --name "API and Web Tests" --outputdir results/ tests/serverest/tests/web/
      
      - name: Test Report
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: robot-framework-report-web
          path: results/

  merge:
    name: Merge Reports
    runs-on: ubuntu-latest
    needs: 
      - test_api
      - test_web

    steps:
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.12'

      - name: Install dependencies
        run: |
          echo Instalação das depedências do Projeto
          pip install robotframework

      - name: Download Artifacts
        uses: actions/download-artifact@v4
        with: 
          path: results/

      - name: Merge Reports
        run: |
          rebot --merge results/robot-framework-report-api/output.xml results/robot-framework-report-web/output.xml
          ls -a

      - name: Upload Merge Report
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: robot-framework-report
          path: ./*.html
        
