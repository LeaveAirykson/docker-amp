# DAMP

A simple Apache MySQL PhpMyAdmin solution build with Docker

**Included:**

- Ubuntu 20.04
- Apache 2.4
  - PHP 8.3 (FPM)
- MySQL 8.4
- PhpMyAdmin

**Features:**

- Setup supports multiple PHP versions via FPM modules and can be set per project.
- Provides usage of local development domains (no localhost:80 or something).
- Includes easy to use cli tool (damp) for quick project setups.
- No need to restart/rebuild container on changes as the projects are persistent volume binds.

## Folder Structure

```
├─ apache/
│  ├─ Dockerfile        # Dockerfile for apache container (Based on ubuntu:20.04)
│  └─ fpm.conf          # Default apache config for fpm module
├─ damp                 # cli executable
├─ docker-compose.yaml  # Docker compose file
├─ www/                 # Document root directories for projects
└─ vhost/               # vhost files for projects
```

## Installation

Clone repository into a directory of your choice:

```shell
git clone git@github.com:LeaveAirykson/docker-amp.git ~/projects/damp
```

Run setup

```shell
cd ~/projects/damp
./damp setup
# If you want to use damp command from everywhere make sure to symlink cli file:
ln -s ~/projects/damp/damp ~/bin/damp
```

## How to use

Projects inside damp consist of 2 important paths:

- `www/<project>` - This is the root directory of a project.
- `vhost/<project>.conf` - The related vhost config file.

These files can be created manually or easily created via damp cli script `damp add <project>`.

Things to consider:

- Project names should all be lowercased letters.
- Place your project files inside `www/<project>` folders.
- Damp will create project folders (`www/<project>`) if they do not exist.
- You need to add the project domains to your `/etc/hosts` file to make them accessible.

## Commands

```
damp <command> [option]
```

| command            | desc                                  |
| ------------------ | ------------------------------------- |
| `up`               | starts all damp container             |
| `down`             | stops all damp container              |
| `add [name]`       | Add new project                       |
| `remove [name]`    | Remove project                        |
| `list`             | lists all projects                    |
| `build`            | builds damp container                 |
| `build --no-cache` | builds damp container without cache   |
| `connect [name]`   | ssh connect to container named [name] |
