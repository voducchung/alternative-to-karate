Feature: Alternative To Karate Steps

  Scenario: Examples
    # request steps
    Given request.host = "baseUrl"
    And request.path = "path"
    And request.headers = { "Content-Type": "application/json" }
    And request.headers["x-api-key"] = "api-key-12345"
    And request.method = "post"
    And request.body = "payload"

    # send the request
    When send the request

    # response steps
    Then response.statusCode == 200
    And response.statusMessage == "OK"
    And reponse.headers == "headers"
    And response.body == "body"
    And <expected> should <checkpoint> # to be using this https://www.chaijs.com/api/bdd/

    # extra steps
    * let loginResponse = previousResponse
    * set loginResponse.body.field1 = "a value"