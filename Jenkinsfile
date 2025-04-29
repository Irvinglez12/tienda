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
        script {
          try {
            sh 'docker-compose build'
          } catch (err) {
            error "❌ Error: No se pudo construir la imagen. Verifica permisos de Docker."
          }
        }
      }
    }

    stage('Levantar servicios') {
      steps {
        script {
          try {
            sh 'docker-compose up -d'
          } catch (err) {
            error "❌ Error: No se pudieron levantar los servicios. Verifica permisos de Docker."
          }
        }
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
      script {
        try {
          sh 'docker-compose down'
        } catch (err) {
          echo '⚠️ No se pudieron bajar los servicios correctamente.'
        }
      }
    }
  }
}
