node {
    def app
    
    withMaven(maven:'maven')
    
    {

        stage('Checkout') {
            git url: 'https://github.com/sidd-harth/hello2.git', branch: 'master'
        }
        
        stage('Build') {
            sh 'mvn clean package'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }
        
        
        stage('Build image') {
        /* This builds the actual image; synonymous to         * docker build on the command line */

        app = docker.build("sidd-harth/hello2/docker")
    }
        
        
            stage('Push image') {
        /* Finally, we'll push the image with two tags: First, the incremental build number from Jenkins Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("jenkins")
        }
        
        
    }
}
    
}
