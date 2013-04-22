var spawn = require("child_process").spawn;
var util = require("util");
var fs = require("fs");

var cmd = process.argv[2];
var pathParts = process.argv[1].split("/");
var rootDir = pathParts.slice(0, pathParts.length - 1).join("/") + "/..";
var packagesDir = rootDir + "/packages";

var commands = {
    "source-install": function(packages) {
        installPackages(packages, true);
    },
    install: function(packages) {
        installPackages(packages, false);
    },
    list: function() {
        fs.readdirSync(packagesDir).sort().forEach(function(packageName) {
            console.log(packageName);
        });
    }
};

if(!commands[cmd] || commands[cmd] === "help") {
    if (typeof cmd !== "undefined") {
        console.error("No such command:", cmd);
        return process.exit(1);
    }
    
    console.log("Welcome to the Cloud9 package manager\n\n" + 
"You can use this package manager to install packages into your Cloud9 IDE workspace\n\n" + 
"Available commands\n" +
"\thelp\t\t\tThis overview\n" +
"\tlist\t\t\tList available packages\n" +
"\tinstall [package]\tInstall a package\n" +
// "\tsource-install [package]\tInstall a package from source (when available)\n" + /* this doesnt work very well a.t.m. */
"\n" +
"This software is open source, for support, suggestions or to add new packages, see:\n" +
"\thttps://github.com/c9/c9pm");
    return process.exit(0);
}

commands[cmd](process.argv.slice(3));

function installPackages(packages, fromSource) {
    console.log("Packages to install:", packages);
    asyncForEach(packages, function(packageName, next) {
        console.log("Going to install", packageName);
        var all = fs.readdirSync(packagesDir);
        
        var candidates = all.filter(function(name) {
            return name.indexOf(packageName + "-") === 0;
        });
        console.log("candidates: " + candidates)
        if(candidates.length === 0)
            next("Package not found: " + packageName);
        else if(candidates.length > 1)
            next("Multiple install candidates found, please be more specific: " + candidates.join(" "));
        else 
            installPackage(candidates[0], fromSource, next);
            
    }, function(err) {
        if (err) {
            return console.error(err);
        }
        if (packages.length > 1) {
            console.log("\nAll packages have been installed");
        }
    });
}

function installPackage(name, fromSource, callback) {
    var _cb = callback;
    
    var packageDir = packagesDir + "/" + name;
    var packageJson = JSON.parse(fs.readFileSync(packageDir + "/package.json"));
    
    // some packages have their own instructions how to use them,
    // for other packages we show a generic message that the package has been installed
    if (!packageJson.hasOwnInstructions) {
        callback = function (err) {
            if (err) {
                console.error("\n" + packageJson.name + " " + packageJson.version + " has failed to install (" + err + ")");
            }
            else {
                console.log("\n" + packageJson.name + " " + packageJson.version + " has been installed");
            }
            _cb.apply(this, arguments);
        };
    }
    
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

function run(cmd, args, options, callback) {
    options.customFds = [process.stdin.fd, process.stdout.fd, process.stderr.fd];
    var proc = spawn(cmd, args, options);
    
    proc.on('exit', function (code) {
        callback(code);
    });
}
