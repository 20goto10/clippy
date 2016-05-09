Clippy - Helping you copy text to your clipboard
================================================

This is a fork from sborsje's fork of mojombo's extremely dormant clippy project. It allows you to copy to the clipboard via a simple Flash widget. This fork:

- works with swfmill 0.3.3 and haxe 3.2.1 (incorporating fauxparse's suggested changes from https://github.com/mojombo/clippy/pull/16)
- uses a transparent background to overlay over a background image set up by CSS (sample code is included)
- unlike the original, the transparent images allow you to size clippy however you choose (i.e. instead of scaling up the original's tiny button)
- eliminates the text that popped out in the original, but I've included sample JS code to replicate it.
- calls a JS function to retrieve the text. 
- includes precompiled binary in build/clippy.swf
- borrows a clipboard PNG file in the sample from Wikimedia commons (with a little border around it)
- is probably obsolete thanks to clipboardjs, but maybe this can help some projects where the effort of replacing clippy exceeds the time available

To use, take the sample OBJECT/EMBED HTML tags. For the FlashVars, you can use:

Javascript call to get text value:
call=whatever_fn

Callback after (note camel case):
callBack=whatever_callback_fn

Installation (Pre-Built SWF)
---------------------------

If you want to use Clippy unmodified, just copy `build/clippy.swf` to your
`public` directory or wherever your static assets can be found.

Installation (Compiling)
------------------------

In order to compile Clippy from source, you need to install the following:

* [haXe](http://haxe.org/)
* [swfmill](http://swfmill.org/)

The haXe code is in `Clippy.hx`, the button images are in `assets`, and the
compiler config is in `compile.hxml`. Make sure you look at all of these to
see where and what you'll need to modify. To compile everything into a final
SWF, run the following from Clippy's root directory:

    swfmill simple library.xml library.swf && haxe compile.hxml

If that is successful, copy `build/clippy.swf` to your
`public` directory or wherever your static assets can be found.

Contribute
----------

If you'd like to hack on Clippy, start by forking my repo on GitHub:

http://github.com/20goto10/clippy

The best way to get your changes merged back into core is as follows:

1. Clone down your fork
1. Create a topic branch to contain your change
1. Hack away
1. If you are adding new functionality, document it in README.md
1. If necessary, rebase your commits into logical chunks, without errors
1. Push the branch up to GitHub
1. Send me (20goto10) a pull request for your branch

License
-------

MIT License (see LICENSE file)
