
# AutoReload Gem

**AutoReload** is a Ruby gem that enhances your Rails development workflow by automatically reloading the browser whenever you save changes to your view files. This functionality mimics the live reloading experience commonly found in frontend frameworks like React, making your development process more efficient and seamless.

## Table of Contents

-   [Features](#features)
-   [Installation](#installation)
-   [Usage](#usage)
-   [Configuration](#configuration)
-   [Contributing](#contributing)
-   [License](#license)

## Features

-   **Automatic Browser Reloading**: Detects changes in your view files and reloads the browser instantly.
-   **Seamless Integration**: Easily integrates into your Rails application's middleware stack.
-   **Development Focused**: Designed to work in the development environment without affecting production.

## Installation

Add this line to your application's `Gemfile`:

ruby

Copy code

`gem 'auto_reload', git: 'https://github.com/puppe1990/auto_reload'` 

Replace `puppe1990` with your actual GitHub username if you have pushed the gem to GitHub. If you've published the gem to [RubyGems](https://rubygems.org), you can install it via:

ruby

Copy code

`gem 'auto_reload'` 

Then execute:

bash

Copy code

`bundle install` 

Or install it yourself as:

bash

Copy code

`gem install auto_reload` 

## Usage

The gem integrates automatically with your Rails application. No additional configuration is required. Simply start your Rails server:

bash

Copy code

`rails server` 

Now, when you edit and save any view file in `app/views`, your browser will automatically reload the page, reflecting your changes instantly.

## Configuration

By default, AutoReload watches the `app/views` directory for changes. If you need to customize the directories to watch or other settings, you can modify the gem's configuration (if such functionality is implemented).

**Note**: Currently, the gem watches `app/views` by default. Future updates may include customizable configurations.

## How It Works

The AutoReload gem consists of two main components:

1.  **File Watcher**: Uses the `listen` gem to monitor changes in your view files.
2.  **WebSocket Server**: Utilizes `faye-websocket` to establish a WebSocket connection between the server and the browser.

When a file change is detected, a 'reload' message is sent to the browser via WebSocket, triggering a page reload.

## Development

To install this gem onto your local machine for development purposes, run:

bash

Copy code

`bundle exec rake install` 

To release a new version:

1.  Update the version number in `version.rb`.
    
2.  Commit your changes:
    
    bash
    
    Copy code
    
    `git commit -am "Bump version to x.x.x"` 
    
3.  Push to GitHub:
    
    bash
    
    Copy code
    
    `git push origin master` 
    
4.  Publish the gem:
    
    bash
    
    Copy code
    
    `gem build auto_reload.gemspec
    gem push auto_reload-x.x.x.gem` 
    

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/puppe1990/auto_reload](https://github.com/puppe1990/auto_reload). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

### Steps to Contribute

1.  Fork the repository.
    
2.  Create a new branch for your feature or bugfix:
    
    bash
    
    Copy code
    
    `git checkout -b my-feature-branch` 
    
3.  Make your changes.
    
4.  Commit your changes with clear messages:
    
    bash
    
    Copy code
    
    `git commit -am "Add new feature"` 
    
5.  Push to the branch:
    
    bash
    
    Copy code
    
    `git push origin my-feature-branch` 
    
6.  Create a new Pull Request on GitHub.
    

## License

The gem is available as open source under the terms of the [MIT License](LICENSE).