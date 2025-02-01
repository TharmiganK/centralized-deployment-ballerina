import ballerina/http;

isolated http:Listener? defaultListener = ();

# Default HTTP listener port used by the HTTP Default Listener.
# The default value is 9090.
public configurable int defaultListenerPort = 9090;

# Default HTTP listener configuration used by the HTTP Default Listener.
public configurable http:ListenerConfiguration defaultListenerConfig = {};

# Returns the default HTTP listener. If the default listener is not already created, a new listener
# will be created with the default port and configuration. An error will be returned if the listener
# creation fails.
# 
# The default listener configuration can be changed in the `Config.toml` file. Example:
# ```toml
# [ballerina.http]
# defaultListenerPort = 8080
# 
# [ballerina.http.defaultListenerConfig]
# httpVersion = "1.1"
# 
# [ballerina.http.defaultListenerConfig.secureSocket.key]
# path = "resources/certs/key.pem"
# password = "password"
# ```
# 
# + return - The default HTTP listener or an error if the listener creation fails.
public isolated function getDefaultListener() returns http:Listener|http:ListenerError {
    lock {
        if defaultListener is () {
            defaultListener = check new (defaultListenerPort, defaultListenerConfig);
        }
        return checkpanic defaultListener.ensureType();
    }
}
