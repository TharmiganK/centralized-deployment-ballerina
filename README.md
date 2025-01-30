# Centralized Ballerina Deployment Sources

This repository contains the source code for the Ballerina services that are used in the centralized deployment scenario.

## How to run

1. Publish the mock HTTP package with the `getDefaultListener` function.

   Go inside the `http` package directory and run the following command to publish the package to the Ballerina Local Central:

   ```bash
   $ bal pack; bal push --repository=local
   ```

2. Publish the service packages.

   Go inside the `service1`, `service2`, and `service3` directories and run the following command to publish the packages to the Ballerina Local Central:

   ```bash
   $ bal pack; bal push --repository=local
   ```

3. Run the consolidator package.

   Go inside the `consolidator` directory and run the following command to run the consolidator service:

   ```bash
   $ bal run
   ```

4. Test the client with the default configurations using cURL.

   Test service1:

   ```bash
   $ curl http://localhost:9090/api/v1
   ```

   Test service2:

   ```bash
   $ curl http://localhost:9090/api/v2
   ```

   Test service3:

   ```bash
   $ curl http://localhost:9090/api/v3
   ```

## Configure HTTP endpoint in the consolidator

Use the `Config.toml` file to configure the HTTP endpoint of the consolidator service.

The following is a sample configuration which changes the port to `8080`, HTTP version to `1.1` and
enable SSL.

```toml
[tharmigan.http]
defaultListenerPort = 8080

[tharmigan.http.defaultListenerConfig]
httpVersion = "1.1"

[tharmigan.http.defaultListenerConfig.secureSocket.key]
path = "resources/certs/ballerinaKeystore.p12"
password = "ballerina"
```
