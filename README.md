Status
======

A Middleman-powered front-end status application. Use cases:

- When building out a front-end for a site, adding pages for the designer to review once the front-end is implemented.
- Using the list to mark the status of live pages on a front-end and mark the bug-free, completed pages.

Installing Middleman
--------------------

```shell
gem install middleman
```

Then run:

```shell
bundle install
```

Running the Application
-----------------------

You run the application by starting the Middleman server:

```shell
middleman s
```

If you're using Rbenv with binstubs:

```shell
./bin/middleman s
```

Building the Static Files
-------------------------

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
path: '/' # The path to this page (if a sub-directory; e.g. `/status/`)
index_section: 'section-one' # Which section would you like to be the index
# Keep these short, or they'll break in the UI
success_status: 'Success' # The success status title (e.g. 'Reviewable')
warning_status: 'Warning' # The warning status title (e.g. 'In Progress')
error_status: 'Error' # The error status title (e.g. 'Not Started')
```

### Logo

If you want to use a logo instead of the title you set above:

1. Add your logo to `source/assets/images`.
2. Add the `logo` element with the appropriate filename:

```yaml
logo: 'logo.png'
```

**Note**: Make sure that you size the logo appropriately to fit the space!

### Optional Status Types

If you want to exclude any of the three status types, you can just pass `false` to that element:

```yaml
error_status: false
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

- title: 'Another Page Title' # The page title
  link: '#' # The link to the page
  status: 'warning' # The page status ('success', 'error', or 'warning')
  type: 'section-two' # The section it belongs to (generates URL and sidebar item)
```

You'll need to restart your Middleman server to see the changes if you add new pages or sections.

Deploying
---------

If you'd like to deploy the site, add a `Rakefile` and take a look at the [Baseman](https://github.com/drewbarontini/baseman#deploying) deploy documentation.

**Note**: Be sure to remove the `Rakefile` from the `.gitignore`!
