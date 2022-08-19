node {
  checkout scm
    docker.withRegistry('https://neo-har-lnx-col01.neosecure.com','Harbor') {
      def customImage = docker.build("panos_exporter/panoshelpdesk:0.1")
        /* Push the container to the custom Registry */
      customImage.push()
  }
}
