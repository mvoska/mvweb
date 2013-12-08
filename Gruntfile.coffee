module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    
    cssmin:
      combine:
        files:
          'assets/css/style.min.css':
            [ 'assets/css/bootstrap.css'
              'assets/css/bootstrap-responsive.css'
              'assets/css/main.css'
              'assets/css/font-awesome.min.css'
              'assets/css/mv.css'
            ]

    concat:
      options:
        separator: ';'
      all:
        src:
          [ "assets/js/jquery.js"
            "assets/js/google-code-prettify/prettify.js"
            "assets/js/bootstrap-transition.js"
            "assets/js/bootstrap-modal.js"
            "assets/js/bootstrap-scrollspy.js"
            "assets/js/bootstrap-button.js"
            "assets/js/bootstrap-carousel.js"
            "assets/js/jquery.localscroll-1.2.7-min.js"
            "assets/js/jquery.inview.js"
            "assets/js/jquery.scrollTo-1.4.2-min.js"
            "assets/js/jquery.parallax-1.1.3.js"
            "assets/js/index.js"
          ]
        dest:
          "assets/js/all.js"

    uglify:
      all:
        files:
          "assets/js/all.min.js": "assets/js/all.js"

    htmlmin:
      all:
        options:
          removeComments: true,
          collapseWhitespace: true
        files:
          "index.html": "templates/index.html"

    watch:
      cssmin:
        files: ['assets/css/*.css']
        tasks: ['cssmin:all']
      concat:
        files: ['assets/js/*.js']
        tasks: ['concat:all', 'uglify:all']
      htmlmin:
        files: ['templates/*.html']
        tasks: ['htmlmin:all']

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'default', ['cssmin', 'concat', 'uglify', 'htmlmin', 'watch']
