GruntVTEX = require 'grunt-vtex'

module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'
  
  config = GruntVTEX.generateConfig grunt, pkg, 
    relativePath: '/'
    replaceGlob: ''
    open: false
    port: 9001

  config['gh-pages'] = 
    options:
      base: 'build/<%= relativePath %>'
    src: ['**']

  config.less =
    main:
      files: [
        expand: true
        cwd: 'src/assets/stylesheets/'
        src: ['academy.less']
        dest: "build/assets/stylesheets/"
        ext: '.css'
      ]

  config.watch.less =
    options:
      livereload: false
    files: ['src/assets/stylesheets/**/*.less']
    tasks: ['less']
  
  config.watch.main =
    files: ['src/assets/script/**/*.js',
            'src/assets/images/**/*',
            'src/assets/libs/**/*',
            'src/index.html']
    tasks: ['copy:main', 'getTags', 'copy:dev']

  config.copy.main.files = [
    expand: true
    cwd: 'src/'
    src: ['**']
    dest: "build/"
  ]

  tasks =
    # Building block tasks
    build: ['clean', 'copy:main', 'copy:pkg', 'coffee', 'less']
    min: ['useminPrepare', 'concat', 'uglify', 'cssmin', 'usemin'] # minifies files
    # Deploy tasks
    dist: ['build', 'min', 'gh-pages'] # Dist - minifies files
    # Development tasks
    default: ['build', 'connect:http', 'watch']
    devmin: ['build', 'min', 'connect:http:keepalive'] # Minifies files and serve

  # Project configuration.
  grunt.initConfig config
  grunt.loadNpmTasks name for name of pkg.devDependencies when name[0..5] is 'grunt-' and name isnt 'grunt-vtex'
  grunt.registerTask taskName, taskArray for taskName, taskArray of tasks
