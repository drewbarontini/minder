Status
======

A Middleman-powered front-end status application.

## Installing Middleman

```shell
gem install middleman
```

Then run:

```shell
bundle install
```

## Running the Application

You run the application by starting the Middleman server:

```shell
middleman s
```

If you're using Rbenv with binstubs:

```shell
./bin/middleman s
```

## Building the Static Files

To build the static files:

```shell
middleman build
```

Or, if you're using Rbenv:

```shell
./bin/middleman build
```

Setup
-----

Open up `data/status.yml` and edit the settings:

```yaml
title: 'Status' # The site name
description: 'A status site for the front-end.' # The description
path: '' # The path to this page (if a sub-directory; e.g. `/status/`)
index_section: 'section-one' # Which section would you like to be the index
success_status: 'Success' # The success status title
warning_status: 'Warning' # The warning status title
error_status: 'Error' # The error status title
```

Adding Pages
------------

Next, add your pages to `data/pages.yml`:

```yaml
- title: 'Page Title' # The page title
  link: '#' # The link to the page
  status: 'success' # The page status ('success', 'error', or 'warning')
  note: 'This is a note for the page.' # Optional page note
  type: 'section-one' # The section it belongs to (generates URL and sidebar item)
```

