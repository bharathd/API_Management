'use strict';

const Hapi = require('hapi');
const MySQL = require('mysql');
const Joi = require('joi');
const Bcrypt = require('bcrypt');
// Create a server with a host and port
const server = new Hapi.Server();


const connection = MySQL.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'pmpd'
});




server.connection({
    host: 'localhost',
    port: 8000,

});
connection.connect();

server.route({
    method: 'GET',
    path: '/helloworld',
    handler: function (request, reply) {
        return reply('hello world');
    }
});

// Add the route
server.route({
    method: 'GET',
    path: '/users',
    handler: function (request, reply) {

        connection.query('select * from customers2', function (error, results, fields) {
            if (error) throw error;
            console.log(results);
            reply(results);
        });

    },
    config: {
        cors: {
            origin: ['*'],
            additionalHeaders: ['cache-control', 'x-requested-with']
        }
    }
});

server.route({
    method: 'GET',
    path: '/user/{uid}',
    handler: function (request, reply) {
        const uid = request.params.uid;

        connection.query('SELECT uid, username, email FROM users WHERE uid = "' + uid + '"', function (error, results, fields) {
            if (error) throw error;
            console.log(results);
            reply(results);
        });

    },
    config: {
        validate: {
            params: {
                uid: Joi.number().integer()
            }
        }
    }
});
server.route({
    method: 'POST',
    path: '/signin',

    handler: function (request, reply) {

        const username = request.payload.username;
        const password = request.payload.password;
console.log(username);
//        var salt = Bcrypt.genSaltSync();
//        var encryptedPassword = Bcrypt.hashSync(password, salt);
//     
//        var orgPassword = Bcrypt.compareSync(password, encryptedPassword);

        connection.query('SELECT * FROM login WHERE UserName = "' + username + '"'+ '"AND Password = "' + password + '"', function (error, results, fields) {
            if (error) throw error;
            console.log(results);
            reply(results);
        });

    },
    config: {
    	 cors: {
             origin: ['*'],
             additionalHeaders: ['cache-control', 'x-requested-with']
         }

    }
});

server.route({
    method: 'POST',
    path: '/signup',

    handler: function (request, reply) {

        const username = request.payload.username;
//        const email = request.payload.email;
        const password = request.payload.password;
console.log(username);
//        var salt = Bcrypt.genSaltSync();
//        var encryptedPassword = Bcrypt.hashSync(password, salt);
//     
//        var orgPassword = Bcrypt.compareSync(password, encryptedPassword);

        connection.query('INSERT INTO users (username,password) VALUES ("' + username  + '","' + encryptedPassword + '")', function (error, results, fields) {
            if (error) throw error;
            console.log(results);
            reply(results);
        });

    },
    config: {
    	 cors: {
             origin: ['*'],
             additionalHeaders: ['cache-control', 'x-requested-with']
         },
        validate: {
            payload: {
                username: Joi.string().alphanum().min(3).max(30).required(),
               
                password: Joi.string().regex(/^[a-zA-Z0-9]{8,30}$/)
            }
        }

    }
});


server.route({
    method: 'POST',
    path: '/sendMessage',
    handler: function (request, reply) {

        const uid = request.payload.uid;
        const message = request.payload.message;
       
        connection.query('INSERT INTO messages (message,uid_fk) VALUES ("' + message + '","' + uid + '")', function (error, results, fields) {
            if (error) throw error;
            console.log(results);
            reply(results);
        });

    },
    config: {
        validate: {
            payload: {
                uid: Joi.number().integer(),
                message: [Joi.string(), Joi.number()]
            }
        }

    }
});

server.route({
    method: 'POST',
    path: '/messages',

    handler: function (request, reply) {
        const uid = request.payload.uid;
        const pwd=request.payload.pwd;
        console.log(uid);
        connection.query ('SELECT * FROM USER WHERE USER_NAME = "' + uid + '"AND PASSWORD = "' + pwd + '"',
        	    function (error, results, fields) {
        
            if (error) throw error;
            console.log(results);
            reply(results);
        });

    },
    config: {
    	cors: {
            origin: ['*'],
            additionalHeaders: ['cache-control', 'x-requested-with']
        }
       

    }
});
server.route({
    method: 'POST',
    path: '/getprojectlist',

    handler: function (request, reply) {
        const uid = request.payload.uid;
      
        console.log(uid);
        connection.query ('SELECT * FROM PROJECT WHERE USER_ID ="' + uid + '"',
        	    function (error, results, fields) {
        
            if (error) throw error;
            console.log(results);
            reply(results);
        });

    },
    config: {
    	cors: {
            origin: ['*'],
            additionalHeaders: ['cache-control', 'x-requested-with']
        }
       

    }
});

server.route({
    method: 'DELETE',
    path: '/message/{uid}/{mid}',
    handler: function (request, reply) {
        const uid = request.params.uid;
        const mid = request.params.mid;

        console.log(uid + "---" + mid);

        connection.query('DELETE FROM messages WHERE uid_fk = "' + uid + '"AND mid = "' + mid + '"', function (error, result, fields) {
            if (error) throw error;

            if (result.affectedRows) {
                reply(true);
            } else {
                reply(false);
            }

        });
    },
    config: {
        validate: {
            params: {
                uid: Joi.number().integer(),
                mid: Joi.number().integer()
            }
        }

    }
});


// Start the server
server.start((err) => {

    if (err) {
        throw err;
    }
    console.log('Server running at:', server.info.uri);
});