Feature: Payment Requests
  Background:
    * var baseUrl = "abc"
    * var abc = baseUrl + "hello" + `${baseUrl}`
    * set abc = {}
    Given request.host = "https://service-mesh-ingress-uat.fundingasiagroup.com/nb-payment-management-service"
    Given request.host = vars.host
    Given request.host = 100
    And request.headers["username"] = "chung.vo@fundingsocieties.com"
    And request.headers["country-id"] = "SG"
    And request.headers["scfs-user-uuid"] = "1253537"
    And request.headers["scfs-user-uuid"] = "dbe9f2dd-f578-4c5a-a064-ceb5a0366130"

  Scenario: Payment Request
    # Create payment request
    Given request.path = "/ext/v1/payables/payments"
    And request.body =
      """
        {
          "amount": 100,
          "description": "A description",
          "name": "A name",
          "reference": "a-refer-ence"
        }
      """
    When request.method = "post"
    Then expect response.statusCode to equal 200
    And expect response.statusMessage to equal "OK"
    And expect response.headers to equal {}
    And expect response.body to equal {}

    # Get the created payment request
    * $paymentRequestId = response.body.data.id
    Given request.path = "/ext/v1/payables/payments/${vars.paymentRequestId}"
    When request.method = "post"
    Then expect response.statusCode to equal 200
    And expect response.body to equal {}