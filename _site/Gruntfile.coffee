GruntVTEX = require 'grunt-vtex'

module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'
  
  config = GruntVTEX.generateConfig grunt, pkg, 
    relativePath: '/'
    replaceGlob: ''
    open: false
    port: 9000

  config['gh-pages'] = 
    options:
      base: 'build/<%= relativePath %>'
    src: ['**']

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
