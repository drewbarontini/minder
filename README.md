Status (v1.0.1)
Minder (v1.0.0)

> A minder is a person assigned to guide or escort a visitor, or to provide
> protection to somebody, or to otherwise assist or take care of something,
> i.e. a person who "minds".

**Minder** is a Middleman-powered site used to oversee your front-end.

- When building out a front-end for a site, add pages for the designer to review once the front-end is implemented.
- Use the list to mark the status of live pages on a front-end and mark the bug-free, completed pages.

To set this up, all you have to do is edit two YAML files, a configuration file and the list of pages. Once that is done, simply build and deploy your site!

Installing Middleman
--------------------

```shell
gem install middleman
```

Then run:

```shell
bundle install
```

If you use `binstubs`, run `bundle install --binstubs`.

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

If you want to use a logo instead of the title text you set above:

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

Referencing Local Files
-----------------------

If you want to include your files in the local Middleman version rather than linking offsite, you can use the `source/layouts/blank.haml` file, and then follow the Middlman documentation on [Custom Layouts](http://middlemanapp.com/basics/templates/) to use that layout file for your local pages. 

Deploying
---------

If you'd like to deploy the site, add a `Rakefile` and take a look at the [Baseman](https://github.com/drewbarontini/baseman#deploying) deploy documentation.

**Note**: Be sure to remove the `Rakefile` from the `.gitignore`!
