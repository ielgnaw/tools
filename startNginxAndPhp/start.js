var fs = require('fs');
var EventEmitter = require('events').EventEmitter;
var emitter = new EventEmitter();
var NGINXPROCESS = 'nginx.exe';
var pids = [];

/**
 * 获取ip地址
 */
function getIP () {
    var ifaces = require( 'os' ).networkInterfaces();
    var defultAddress = '127.0.0.1';
    var ip = defultAddress;

    for (var dev in ifaces) {
        ifaces[dev].forEach(function (details) {
            if (ip === defultAddress && details.family === 'IPv4') {
                ip = details.address;
            }
        });
    }

    return ip;
}

var FILE = 'D:/All-Workspace/baidu/ershouche/middle-page/mock/index.php';

fs.readFile(FILE, 'utf8', function (err, data) {
        var reg = /http:\/\/.*(?=:8506)/g;
        var newData = data.replace(reg, function () {
            return 'http://' + getIP();
        });

        fs.writeFile(FILE, newData, 'utf8', function(err){
            if (err) {
                console.log('写入文件失败');
            }
        });
    }
);

var childProcess = require('child_process');
childProcess.exec('start nginx.exe');
childProcess.exec(''
    + '"D://nginx-1.2.0//php//php-cgi.exe"'
    + ' -b 127.0.0.1:9000 -c "D://nginx-1.2.0//php//php.ini"'
);
childProcess.exec('start http://' + getIP() + ':8505/');

setTimeout(function () {
    childProcess.exec('tasklist', function(err, stdout, stderr) {
        var lines = stdout.toString().split('\n');
        lines.forEach(function(line) {
            var parts = line.split('=');
            parts.forEach(function (items) {
                if (items.toString().indexOf(NGINXPROCESS) > -1) {
                    pids.push(items.trim().split(/\s+/)[1]);
                }
            });
        });
    });
}, 500);

emitter.on('close', function () {
    pids.forEach(function (pid) {
        process.kill(pid);
    });
});

process.on('SIGINT', function() {
    emitter.emit('close');
    process.exit(0);
});

process.on('exit', function () {
    console.log('exit');
});