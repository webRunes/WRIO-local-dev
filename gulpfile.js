var gulp = require('gulp');
var webserver = require('gulp-webserver');
var exec = require('child_process').exec;

gulp.task('webserver', function() {
    exec('npm run watch');
    gulp.src('.')
        .pipe(webserver({
            livereload: true,
            open: true,
            port: 3000
        }));
});
gulp.task('default',['webserver']);