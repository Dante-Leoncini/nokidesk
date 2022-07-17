//     telegram.link
//     Copyright 2014 Enrico Stara 'enrico.stara@gmail.com'
//     Released under the MIT License
//     http://telegram.link

// Import dependencies.
var tl = require('telegram-tl-node');

// API TL schema as provided by Telegram.
var apiTlSchema = require('./api-tlschema.json');

// Declare the `type` module.
var type = {_id: 'api.type'};
// Build  the constructors.
tl.TypeBuilder.buildTypes(apiTlSchema.constructors, null, type);
// Export the `type` module.
exports.type = type;

// Declare the `service` module.
var service = { _id: 'api.service'};
// Build registered methods.
tl.TypeBuilder.buildTypes(apiTlSchema.methods, null, service, true);
// Export the `service` module.
exports.service = service;