var gulp = require('gulp');
var webserver = require('gulp-webserver');
var spawn = require('child_process').spawn;

gulp.task('webserver', function() {
    if (process.platform === 'win32') {
        sh = 'cmd';
        shFlag = '/c';
    } else {
        sh = 'sh';
        shFlag = '-c';
    }
<<<<<<< HEAD
    cmd = 'bash -c "cd WRIO-InternetOS && gulp watchDev --dev"';
=======
    cmd = "cd WRIO-InternetOS && gulp && gulp watchDev --dev";
>>>>>>> 9ac63214634fba4ffb8589e582a16105365a7a83
    var child = spawn(sh,[shFlag,cmd], {
        cwd: process.cwd,
        env: process.env,
        stdio: ['pipe', process.stdout, process.stderr]
    });


    gulp.src('.')
        .pipe(webserver({
            livereload: true,
            open: true,
            port: 3000
        }));
});
gulp.task('default',['webserver']);