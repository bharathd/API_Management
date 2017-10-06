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
    database: 'pmpd',
    multipleStatements: true
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
    path: '/employeelist',
    handler: function (request, reply) {

        connection.query('select * from employee', function (error, results, fields) {
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
//Add the route
server.route({
 method: 'GET',
 path: '/projects',
 handler: function (request, reply) {

     connection.query('SELECT  project.PROJECT_ID, project.PROJECT_NAME,project.PROJECT_DESCRIPTION, project_detail.PROJECT_SPRINT, project_detail.PROJECT_DOCUMENTS, project_detail.PROJECT_Duration, project_detail.TEAM_SIZE, project_detail.PROJECT_TEAM_MEMBER,project_detail.PROJECT_TEAM_MEMBER_ID FROM project INNER JOIN project_detail ON project.PROJECT_ID=project_detail.PROJECT_ID;', function (error, results, fields) {
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
    path: '/getechnologies',
    handler: function (request, reply) {
        const uid = request.params.uid;

        connection.query('SELECT * from technology', function (error, results, fields) {
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
    path: '/addproject',

    handler: function (request, reply) {

        const project_name = request.payload.qid.PROJECT_NAME;
        const project_description = request.payload.qid.PROJECT_DESCRIPTION;
        const user_id = 1;
        const project_Duration = request.payload.qid.PROJECT_DURATION;
        const project_startdate = request.payload.qid.PROJECT_START_DATE;
        const project_enddate = request.payload.qid.PROJECT_END_DATE;
        const project_tools = request.payload.qid.PROJECT_TOOLS_USED;
        const project_teammember = request.payload.qid.PROJECT_TEAM_MEMBER_ID;
        const project_scrum = request.payload.qid.PROJECT_SCRUM;
        const project_document = request.payload.qid.PROJECT_DOCUMENTS;
        const project_sprint = request.payload.qid.PROJECT_SPRINT;
         
console.log(project_name+"---");
connection.query('INSERT INTO project (PROJECT_NAME,PROJECT_DESCRIPTION,USER_ID) VALUES ("' + project_name  + '","' + project_description + '","' + user_id+ '")',function (error, results, fields) {
            if (error) throw error;
            else{
            	const project_id = results.insertId;
            	connection.query('INSERT INTO project_detail (PROJECT_ID,TEAM_SIZE,PROJECT_DURATION,PROJECT_START_DATE,PROJECT_END_DATE,PROJECT_TOOLS_USED,PROJECT_TEAM_MEMBER_ID,PROJECT_SCRUM,PROJECT_DOCUMENTS,PROJECT_SPRINT) VALUES ("' + project_id + '","'+ 5 + '","'+ project_Duration  + '","'  + project_startdate  + '","' + project_enddate  + '","' + project_tools  + '","' + project_teammember  + '","' + project_scrum  + '","' + project_document + '","'  + project_sprint+ '")',function (error, results, fields) {
            		
            	});
            }
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
    path: '/getemployeefilterlist',

    handler: function (request, reply) {
        const qid = "%"+request.payload.qid+"%";
        console.log("QA"+qid);
        connection.query ('select * from employee where TECHNOLOGY  like "' + qid + '"',
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
    path: '/gettechnoloyQA',

    handler: function (request, reply) {
        const qid = request.payload.qid;
        console.log("QA"+qid);
        connection.query ('SELECT * FROM technology_details WHERE TECHNOLOGY_ID = "' + qid + '"',
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