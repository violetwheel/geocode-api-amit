<h1 align="center">Zonda Geocoding API</h1>

## Introduction

The Geocoding API is an enterprise level application for forward and reverse geocoding across the Org.

## Use Cases

- Salesforce Project Address Autocomplete
- Deed/Listing Lat/Lon population
- Iris
- Zonda Education
- BDX

## Techstack

- Eslint
- Nodejs
- Chai
- Dynamodb
- Snowflake
- AWS Zonda Account

## Environment Variables
- NODE_ENV: dev|production

## Build Instructions

TODO: Add build / CICD instructions

## Design

![Design](https://github.com/zondahome/geocoding-api/blob/main/docs/design.png?raw=true)
[Confluence Design Doc](https://zondahome.atlassian.net/wiki/spaces/ARCH/pages/2432008219/Geocoding)

## Coding Standards

See: [Node Style Guide](https://github.com/felixge/node-style-guide)
See: [Github SOP](https://zondahome.atlassian.net/wiki/spaces/DO/pages/2434465795/SOP+-+GitHub+Workflow)

Additionally:

* Functions use fat arrow definitions for lexical this usage. eg. const MyFunction = (param1) => { dostuff; }
* We use let instead of var

## Contributing

1. All changes must be approved through a pull request. See: https://zondahome.atlassian.net/wiki/spaces/DO/pages/2434465795/SOP+-+GitHub+Workflow
2. Prior to checking in, the following commands must be run locally:
3.   npm run test:coverage
4.   npm run lint

Unit test coverage should be at 100% and there should be no lint errors. 

## Deployment

TODO: Add instructions

- Terraform

## Local Testing

TODO: Add instructions


## TODO:


