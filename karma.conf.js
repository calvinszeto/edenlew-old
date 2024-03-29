// Karma configuration
// Generated on Sat Nov 01 2014 18:59:20 GMT-0400 (EDT)

module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '',


    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine'],


    // list of files / patterns to load in the browser
    files: [
      'vendor/assets/bower_components/angular/angular.js',
      'vendor/assets/bower_components/angular-resource/angular-resource.js',
      'vendor/assets/bower_components/angular-route/angular-route.js',
      'vendor/assets/bower_components/danialfarid-angular-file-upload/dist/angular-file-upload.js',
      'vendor/assets/bower_components/zebra-datepicker/javascript/zebra_datepicker.js',
      'vendor/assets/bower_components/angular-mocks/angular-mocks.js',
      'vendor/assets/javascripts/jquery-1.11.2.min.js',
      'app/assets/javascripts/**/*.coffee',
      'app/assets/javascripts/templates/**/*.html',
      'spec/javascripts/spec_helper.coffee',
      'spec/javascripts/**/*.coffee'
    ],


    // list of files to exclude
    exclude: [
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      'app/assets/javascripts/**/*.coffee': ['coffee'],
      'app/assets/javascripts/templates/**/*.html': ['ng-html2js'],
      'spec/javascripts/**/*.coffee': ['coffee']
    },

    ngHtml2JsPreprocessor: {
      stripPrefix: 'app/assets/javascripts/templates/',
      moduleName: 'templates'
    },

    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: false,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS'],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false
  });
};
