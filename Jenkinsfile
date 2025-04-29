pipeline {
  agent any

  stages {
    stage('Clonar repositorio') {
      steps {
        git branch: 'main', url: 'https://github.com/Irvinglez12/tienda.git'
      }
    }

    stage('Construir imagen') {
      steps {
        sh 'docker-compose build'
      }
    }

    stage('Levantar servicios') {
      steps {
        sh 'docker-compose up -d'
      }
    }

    stage('Pruebas Laravel') {
      steps {
        sh 'docker-compose exec laravel php artisan test || true'
      }
    }

    stage('Pruebas Phoenix') {
      steps {
        sh 'docker-compose exec phoenix mix test || true'
      }
    }
  }

  post {
    always {
      echo 'Finalizando...'
      sh 'docker-compose down'
    }
  }
}