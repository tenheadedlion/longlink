# A URL Shortener System

A project to mock the shortener(or protector) system of a funny social media platform.

## Introduction

This URL shortener system was designed to run on my website for fun, however there were a lot of troubles in deployment, I didn't expect to face the most embarrassing engineering problem, it surely can perfectly run on my PC, which runs the latest Ubuntu LTS release, 22.04, but it can't be run on older versions of Ubuntu server as the binary it built depends on a higher version of glibc, worst still the development environment can't be switched to my another PC with different Elixir version. As docker is broken in Ubuntu 22.04, I decide to give up the deployment.

Still, this is a functional Elixir codebase, I hope it is a userful example of umbrella projects. But perhaps the umbrella layout does not worth all that trouble it causes in development and deployment, in the next repository, I am going to restruct it to a conventional Phoenix project.

```shell
$ mix phx.routes 
       session_path  GET     /login                  LonglinkWeb.SessionController :new
       session_path  POST    /login                  LonglinkWeb.SessionController :create
       session_path  DELETE  /logout                 LonglinkWeb.SessionController :delete
          page_path  GET     /                       LonglinkWeb.PageController :index
          page_path  GET     /:id                    LonglinkWeb.PageController :show
      longlink_path  GET     /urls/new               LonglinkWeb.LonglinkController :new
      longlink_path  GET     /urls/:id               LonglinkWeb.LonglinkController :show
      longlink_path  POST    /urls                   LonglinkWeb.LonglinkController :create
          user_path  GET     /users/new              LonglinkWeb.UserController :new
          user_path  GET     /users/:id              LonglinkWeb.UserController :show
          user_path  POST    /users                  LonglinkWeb.UserController :create
live_dashboard_path  GET     /dashboard              Phoenix.LiveDashboard.PageLive :home
live_dashboard_path  GET     /dashboard/:page        Phoenix.LiveDashboard.PageLive :page
live_dashboard_path  GET     /dashboard/:node/:page  Phoenix.LiveDashboard.PageLive :page
                     *       /dev/mailbox            Plug.Swoosh.MailboxPreview []
```

![](https://raw.githubusercontent.com/tenheadedlion/longlink/master/images/redirection.png)
