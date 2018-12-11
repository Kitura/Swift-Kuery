<p align="center">
    <a href="http://kitura.io/">
        <img src="https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Sources/Kitura/resources/kitura-bird.svg?sanitize=true" height="100" alt="Kitura">
    </a>
</p>


<p align="center">
    <a href="https://ibm-swift.github.io/Swift-Kuery/index.html">
    <img src="https://img.shields.io/badge/apidoc-SwiftKuery-1FBCE4.svg?style=flat" alt="APIDoc">
    </a>
    <a href="https://travis-ci.org/IBM-Swift/Swift-Kuery">
    <img src="https://travis-ci.org/IBM-Swift/Swift-Kuery.svg?branch=master" alt="Build Status - Master">
    </a>
    <img src="https://img.shields.io/badge/os-macOS-green.svg?style=flat" alt="macOS">
    <img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
    <img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
    <a href="http://swift-at-ibm-slack.mybluemix.net/">
    <img src="http://swift-at-ibm-slack.mybluemix.net/badge.svg" alt="Slack Status">
    </a>
</p>

# Migrating to Swift Kuery 3.0

This migration guide will highlight the changes in Swift Kuery 3.0 that will affect existing code and is intended to help consumers during their adoption of this release.

Each change in the API is broken down and examples are provided for it's usage before and after.

## Using the asynchronous API

TODO - Provide example of non-nested API usage that no longer works. Highlight how API should be used.

## Getting a database connection

TODO - Discuss API changes and sync function. Provide an example of how the old API would be used and then examples of the new API.

## Using a connection pool

TODO - Discuss connection pool changes including closure signature for tasks. Provide example of old API and exampele of new usage

## Preparing Statements

TODO - Discuss changes arounf preparing statements, to include QueryResult helper method. Provide example of previous usage and new usage.

## Protocol changes for QueryBuilder

TODO - Discuss QueryBuilder protocol changes. Provide examples of new requirements.

## Fetching results asynchronously / Releasing connections to the pool.

TODO - Discuss changes in ResultSet and new requirement to call done() once finished with result sets. Discuss result fetcher changes. Add examples.



