Publishist/Publiʃist
====================

The certifiably easiest way to manage your entire publication lifecycle, from
submission, to review, to publication, to sales.

Running the dev environment
---------------------------

This repo was built with [Yeoman]. It's just a basic web app, very little
javascript, but it's nice to be able to write Jade (similar to Haml, but for
node) templates and Coffeescript.

To install Yeoman, you'll need [nodejs] and [npm, the Node.js Package
Manager][npm]. You can install these with [homebrew] on OSX with `brew install
node`. (I think that includes npm, too. If the next command doesn't work, you
may need to `brew install npm`, too. Please update these docs when you verify.)
Once you've got that, go ahead and install Yeoman:

    npm install -g yo

  [Yeoman]: http://yeoman.io/
  [nodejs]: http://nodejs.org/
  [npm]: https://npmjs.org/
  [homebrew]: http://brew.sh/

To run the dev environment, run `grunt server` from the project directory.
Then, as you save changes to the files, your browser will be automatically
updated with your changes.

Deploying
---------

To minify everything for production, run `grunt`. This will minify & concat
files and put them all in the dist directory. You can make sure it looks good
by opening dist/index.html.

If that looks good, you can push the dist directory to the gh-pages branch on
github with the following command:

    git subtree push --prefix dist origin gh-pages

After you ensure that works, deploy to prod (on AWS) using rake! You'll need the following gems:

* aws
* mime-types

You'll also need my S3 credentials in a config.yml file. Which I won't give
you, probably! I guess these are just my notes. ;-)

Run `rake -T` to see the available rake commands. Check the Rakefile to see
what they do (or, read [this excellent article] that I stole it all from.)

  [this excellent article]: http://spin.atomicobject.com/2013/09/23/deploy-aws-s3-rake/
