---
layout: documentation
title: RethinkDB Horizon
id: index
permalink: /docs/index.html
---

RethinkDB Horizon is an open-source developer platform for building realtime, scalable web apps. It is built on top of RethinkDB, and allows app developers to get started with building modern, engaging apps without writing any backend code.

Horizon consists of three components:

* **Horizon server:** a middleware server that connects to/is built on top of RethinkDB, and exposes a simple API/protocol to front-end applications.
* **Horizon client:** a JavaScript client library that wraps Horizon server's protocol in a convenient API for front-end developers.
* **Horizon CLI:** a command line tool, `hz`, aiding in scaffolding, development, and deployment.

## Using Horizon

* [Installing Horizon & RethinkDB]($$ROOT$$/install.html): an overview of installing the RethinkDB and Horizon servers.
* [Getting started]($$ROOT$$/docs/getting-started.html): get up to speed on Horizon's basics.
* The Horizon API: learn about the two JavaScript classes at the heart of Horizon:
    * [Horizon]($$ROOT$$/api/horizon.html) (the connection management class)
    * [Collection]($$ROOT$$/api/collection.html) (the data management class)
* [Permissions]($$ROOT$$/docs/permissions.html): how Horizon's permissions and schema enforcement system works.
* [Users and groups]($$ROOT$$/docs/users.html): an overview of Horizon's user management system.
* [Authentication]($$ROOT$$/docs/auth.html): integrating Horizon apps with Github, Twitter and other OAuth providers.
* Running the Horizon server:
    * [CLI]($$ROOT$$/docs/cli.html): running the `hz` command line tool.
    * [Embedding]($$ROOT$$/docs/embed.html): using Horizon with web frameworks like Express and Koa.
* [Configuration]($$ROOT$$/docs/configuration.html): all about the Horizon configuration file, `.hz/config.toml`.

## About This Documentation

This documentation is Copyright (c) the Linux Foundation, modified by
[Sam Hughes](http://samuelhughes.com/) to get it working as a static
website, and is provided under the [Creative Commons
Attribution-ShareAlike License]($$ROOT$$/LICENSE).

The static site generation code can be found at <https://github.com/srh/horizon-docs/>.
