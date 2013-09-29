Publishist/Publiʃist
====================

The certifiably easiest way to manage your entire publication lifecycle, from
submission, to review, to publication, to sales.

Running the dev environment
---------------------------

This repo was built with [Yeoman]. It's just a basic web app, very little
javascript, but it's nice to be able to write Jade (similar to Haml, but for
node) templates and Coffeescript.

  [Yeoman]: http://yeoman.io/

To run the dev environment, run `grunt server` from the project directory.

Deploying
---------

To minify everything for production, run `grunt`. This will minify & concat
files and put them all in the dist directory. You can make sure it looks good
by opening dist/index.html.

If that looks good, you can push the dist directory to the gh-pages branch on
github with the following command:

    git subtree push --prefix dist origin gh-pages
