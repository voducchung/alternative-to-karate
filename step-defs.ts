import { defineStep } from '@cucumber/cucumber'

const vars = {}
const request = {
  host: null,
  path: null,
  headers: {},
  method: null,
  body: null,
}
const response = {
  statusCode: null,
  statusMessage: null,
  headers: {},
  body: null,
}

defineStep(/^request.(.*) = (.*)/, function (key, value) {
  eval(`request.${key} = ${value}`)

  if (key === 'method') {
    console.log(`to send a ${key} request`)
  }
})

defineStep(/^request.(.*) =$/, function (key, value) {
  eval(`request.${key} = ${value}`)
})

defineStep(/^var|^set (.*) = (.*)/, function (key, value) {
  console.log(key, '------', value)
  eval(`globalThis[${key}] = ${value}`)
  console.log(eval(`${key}`))
})