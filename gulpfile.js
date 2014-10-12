var gulp = require('gulp');
var less = require('gulp-less');
var minifyCSS = require('gulp-minify-css');
var minifyHTML = require('gulp-minify-html');

gulp.task('styles', function() {
  return gulp.src('./less/style.less')
    .pipe(less())
    .pipe(minifyCSS())
    .pipe(gulp.dest('./dist/css/'));
});

gulp.task('views', function() {
  return gulp.src('index.html')
    .pipe(minifyHTML({conditionals:true}))
    .pipe(gulp.dest('./dist/'));
});

gulp.task('default', ['styles','views'], function() {
  gulp.watch('./less/**', ['styles']);
  gulp.watch('./index.html', ['views']);
});
