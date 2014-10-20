var gulp = require('gulp');
var gutil = require('gulp-util');
var plumber = require('gulp-plumber');
var concat = require('gulp-concat');
var less = require('gulp-less');
var minifyCSS = require('gulp-minify-css');
var minifyHTML = require('gulp-minify-html');
var uglify = require('gulp-uglify');

var onError = function (err) {
  gutil.beep();
  gutil.log(gutil.colors.red(err.message));
};

gulp.task('styles', function() {
  return gulp.src('./less/style.less')
    .pipe(plumber(onError))
    .pipe(less())
    .pipe(minifyCSS())
    .pipe(gulp.dest('./dist/css/'));
});

gulp.task('scripts', function() {
  return gulp.src([
    './vendor/bootstrap/dist/js/bootstrap.min.js',
    './js/*.js'
  ])
    .pipe(plumber(onError))
    .pipe(concat('all.js'))
    .pipe(uglify({preserveComments: "some"}))
    .pipe(gulp.dest('./dist/js/'));
});

gulp.task('views', function() {
  return gulp.src('index.html')
    .pipe(plumber(onError))
    .pipe(minifyHTML({conditionals:true}))
    .pipe(gulp.dest('./dist/'));
});

gulp.task('default', ['styles','scripts','views'], function() {
  gulp.watch('./less/**', ['styles']);
  gulp.watch('./js/**', ['scripts']);
  gulp.watch('./index.html', ['views']);
});
