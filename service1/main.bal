import ballerina/http;

import tharmigan/http as http1;

listener http:Listener httpListener = http1:getDefaultListener();

service /api/v1 on httpListener {

    resource function get greeting() returns string {
        return "Hello, World from Service 1!";
    }
}
