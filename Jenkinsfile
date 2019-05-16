node('linux') {
		stage('Setup') {
				git credentialsId: '57a73dcc-2949-4367-bbc3-046f3606f343', url: 'https://github.com/UST-SEIS665/hw11-seis665-03-spring2019-ihaughey.git'
				sh 'aws s3 cp s3://final-practice/classweb.html index.html'
		}
		stage('Build') {
				sh 'docker build -t classweb:1.0 .'
		}
		stage('Test') {
				
				sh 'docker stop classweb1||true'
				sh 'docker rm classweb1||true'
				
				sh 'docker run -d --name classweb1 -p 80:80 --env NGINX_PORT=80 classweb:1.0'
				sh '''
						CONTAINER_IP=$(docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $(docer ps -q))

						curl -s $CONTAINER_IP
				'''
				
				sh 'docker stop classweb1'
				sh 'docker rm classweb1'
		}
}
