var spawn = require("child_process").spawn;
var util = require("util");
var fs = require("fs");

function run(cmd, args, options, callback) {
    var proc = spawn(cmd, args, options);
    
    util.pump(proc.stdout, process.stdout);
    util.pump(proc.stderr, process.stderr);
    
    proc.on('exit', function (code) {
        callback(code);
    });
}

var cmd = process.argv[2];
var pathParts = process.argv[1].split("/");
var rootDir = pathParts.slice(0, pathParts.length - 1).join("/") + "/..";
var packagesDir = rootDir + "/packages"

var commands = {
    source: function(packages) {
        installPackages(packages, true);
    },
    install: function(packages) {
        installPackages(packages, false)
    }
};

commands[cmd](process.argv.slice(3));

function installPackages(packages, fromSource) {
    asyncForEach(packages, function(packageName, next) {
        var all = fs.readdirSync(packagesDir);
        
        var candidates = all.filter(function(name) {
            return name.indexOf(packageName) === 0;
        });
        
        if(candidates.length === 0)
            next("Package not found: " + packageName);
        else if(candidates.length > 1)
            next("Multiple install candidates found, please be more specific: " + candidates.join(" "));
        else 
            installPackage(candidates[0], fromSource, next);
            
    }, function(err) {
        if(err)
            return console.error(err);
        console.log("Done!");
    });
}

function installPackage(name, fromSource, callback) {
    var packageDir = packagesDir + "/" + name;
    var packageJson = JSON.parse(fs.readFileSync(packageDir + "/package.json"));
    console.log(packageJson);
    if(packageJson.downloadable && !fromSource) {
        console.log("Downloading package");
        run(rootDir + "/common/download.sh", [name], {
            env: process.env
        }, callback);
    }
    else {
        console.log("Building package");
        run("./install.sh", [], {cwd: packageDir}, callback);
    }
}

function asyncForEach(array, fn, callback) {
    array = array.slice(0).reverse();
    function processOne() {
        var item = array.pop();
        fn(item, function(err, result) {
            if(err)
                return callback(err);
                
            if (array.length > 0)
                processOne();
            else
                callback(err, result);
        });
    }
    if (array.length > 0)
        processOne();
    else
        callback();
}