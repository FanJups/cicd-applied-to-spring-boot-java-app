node{
	def Namespace = "default"
	def ImageName = "sudiptod/cicd"
	def Creds = "DockerHub_Credentials"
	def GITHUB_URL = "https://github.com/sudipto92/cicd-applied-to-spring-boot-java-app.git"
    def GITHUB_Creds = "GITHUB_CREDENTIALS"
	try{
		stage('Checkout'){
			git credentialsId: "${GITHUB_Creds}", url: "${GITHUB_URL}"
			sh "git rev-parse --short HEAD > .git/commit-id"
			imageTag= readFile('.git/commit-id').trim()
		}
		stage('Compile, Test and Coverage'){
			sh "/opt/apache-maven-3.6.3/bin/mvn -B clean deploy -DskipTests"
			publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: "/var/lib/jenkins/workspace/${JOB_NAME}/target/site/jacoco/", reportFiles: 'index.html', reportName: 'Jacoco HTML Report', reportTitles: 'Jacoco'])
		}
		
        stage('SonarQube Analysis'){
		    withSonarQubeEnv('sonar') {
                sh "/opt/sonar-scanner/bin/sonar-scanner -Dsonar.projectKey=${JOB_NAME} -Dsonar.projectName=${JOB_NAME} -Dsonar.projectVersion=${BUILD_NUMBER} -Dsonar.sources=. -Dsonar.java.binaries=target/ -Dsonar.issuesReport.html.enable=true -Dsonar.issuesReport.html.location=. -Dsonar.issuesReport.html.name=sample -Dsonar.login=admin -Dsonar.password=admin123" 
            }
		}
		
		
	stage('Docker Build, Push'){
		withDockerRegistry([credentialsId: "${Creds}", url:'https://index.docker.io/v1/']) {
		   sh "docker build -t ${ImageName}:${imageTag} ."
		   sh "docker tag ${ImageName}:${imageTag} ${ImageName}:latest"
		   sh "docker push ${ImageName}:latest"
		   sh "docker push ${ImageName}:${imageTag}"
		}
	}
		
	stage('Deploy'){		
               sh "ansible-playbook -i ansiblek8/host ansiblek8/site.yml"
		}
	}
	
	catch (err) {
		currentBuild.result = 'FAILURE'
	}
}




