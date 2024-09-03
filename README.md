# DAMP

A simple Apache MySQL PhpMyAdmin solution build with Docker

**Included:**

- Ubuntu 20.04
- Apache 2.4
  - PHP 8.3 (FPM)
  - PHP 8.1 (FPM)
- MySQL 8.4
- PhpMyAdmin

**Features:**

- Setup supports multiple PHP versions via FPM modules and can be set per project.
- Provides usage of local development domains (no localhost:80 or something).
- Includes easy to use cli tool (damp) for quick project setups.
- No need to restart/rebuild container on changes as the projects are persistent volume binds.

## Installation

**Important:** Make sure you have git and docker installed before installing damp.

1. Download latest release: <a href="https://github.com/LeaveAirykson/docker-amp/archive/refs/heads/master.zip" target="_blank">DAMP (.zip)</a> and unzip its content to a folder of your choice.

2. For easier use symlink the damp script to any path included in your $PATH variable.

```shell
ln -s ~/projects/damp/damp ~/bin/damp
```

## Files

```
├─ apache/
│  ├─ Dockerfile        # Dockerfile for apache container
│  ├─ fpm.conf          # FPM Module configuration
│  ├─ startup.sh        # Apache startup script
│  └─ vhost.conf.tpl    # Template for vhost configs
├─ damp                 # cli executable
├─ docker-compose.yaml  # Docker compose file
├─ mysql/               # Mysql database files (autocreated)
├─ www/                 # Project directories (autocreated)
└─ vhost/               # Vhost configs (autocreated)
```

## Commands

```
damp <command> [option]
```

The damp executable is a small wrapper around docker compose and consists of these commands:

| command                 | desc                              |
| ----------------------- | --------------------------------- |
| `project add [name]`    | Add new project                   |
| `project remove [name]` | Remove a project                  |
| `connect [container]`   | ssh connect to specific container |

**Any other commands and arguments will be passed to `docker compose` inside the damp folder.**

```shell
damp up -d # => 'docker compose up -d'
damp start # => 'docker compose start'
damp down  # => 'docker compose down'
damp ps    # => 'docker compose ps'
```

## Projects

Projects inside damp consist of 2 important paths:

- `www/[name]` - This is the root directory of a project.
- `vhost/[name].conf` - The related vhost config file.

These files can be created manually or easily created via damp cli script:

```shell
damp project add [name]
```

Things to consider:

- Project names should all be lowercased letters.
- Place your project files inside the `www/[name]` folders.
- Damp will create project folders (`www/[name]`) if they do not exist.
- Project domains will be added to `/etc/hosts` file to make them accessible.
