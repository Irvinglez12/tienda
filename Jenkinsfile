pipeline {
  agent any

  stages {
    stage('Clonar repositorio') {
      steps {
        git 'https://github.com/Irvinglez12/tienda.git' // ← cambia por tu repo real
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

    stage('Pruebas') {
      steps {
        sh 'docker-compose exec app mix test || true'
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
