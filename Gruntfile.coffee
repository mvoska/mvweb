module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    less:
      all:
        options:
          yuicompress: true
        files:
          'dist/css/style.css': 'less/style.less'

    dusthtml:
      all:
        options:
          basePath: 'dust'
          context: 'dust/context.json'
        files:
          [
            expand: true
            flatten: true
            src: ['dust/*.dust']
            dest: 'dist/'
            ext: '.html'
          ]

    concat:
      options:
        separator: ';'
      all:
        src:
          [
            'js/bootstrap.min.js',
            'js/index.js'
          ]
        dest:
          'dist/js/all.js'

    uglify:
      all:
        files:
          'dist/js/all.min.js': 'dist/js/all.js'

    copy:
      img:
        files:
          [
            expand: true
            src: 'img/**/*'
            dest: 'dist/'
            filter: 'isFile'
          ]
      font:
        files:
          [
            expand: true
            src: 'font/**/*'
            dest: 'dist/'
            filter: 'isFile'
          ]

    clean:
      all: ['dist/**/*']
      font: ['dist/font']
      img: ['dist/img']
      js: ['dist/all.js']

    watch:
      less:
        files: ['less/*.less', 'less/bootstrap/*.less', 'less/bootstrap/font-awesome/*.less']
        tasks: ['less:all']
      dusthtml:
        files: ['dust/**/*.dust']
        tasks: ['dusthtml']
      uglify:
        files: ['js/*.js']
        tasks: ['concat', 'uglify', 'clean:js']
      copy:
        files: ['font/**/*', 'img/**/*']
        tasks: ['clean:font', 'clean:img', 'copy']

  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-dust-html'

  grunt.registerTask 'default', ['clean', 'less', 'dusthtml', 'concat', 'uglify', 'clean:js', 'copy', 'watch']
