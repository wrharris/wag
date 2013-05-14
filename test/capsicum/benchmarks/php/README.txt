php-cgi.wvd: the weaved PHP CGI interpreter

This document describes how to configure, build, run, and test the
weaved PHP interpreter with CGI interface (php-cgi.wvd).

Configuring policy checks
-------------------------

CapWeave has been applied to php-cgi to weave in 5 of the 6
requirements specified via email by MIT-LL ("CapWave policy for PHP",
Michael Zhivich, 5 May 2012). The desired policy is a conjunction of
the following six requirements:

1. Allow read-only access to a whitelist of system libraries
2. Allow read-only access to PHP and MediaWiki configuration files
3. Allow read-only access to MediaWiki PHP scripts
4. Allow read-only access to MediaWiki "skin" files (images, JavaScript, etc)
5. Allow creation of subdirectories and read/write access to contents for
   /tmp, /var/tmp, /usr/local/www/mediawiki/images/*
6. Allow socket open and read/write access to localhost:5432 (database server)

The first five requirements are satisfied by php-cgi.wvd.

Each requirement is parameterized by a condition on system files and
the rights that PHP should have for any file that satisfies the
condition. php-cgi.wvd can be reconfigured to redefine each of the
requirement conditions without recompiling or reweaving the entire PHP
interpreter. Each requirement condition is implemented as a C function
found in PHP_ROOT/wvd_policy/pol_validators.c, where "PHP_ROOT" is the
root directory of the php installation. The conditions for
requirements correspond to C functions as follows:

1. Req 1: is_wl_sys_lib()

2. Req 2: is_php_mw_config()

3. Req 3: is_mw_php()

4. Req 4: is_skin()

5. Req 5: is_scratch()

Each condition function takes as input a C string that denotes a path in
the file-system, and returns an integer that should be non-zero if and
only if the input path points to a file that satisfies the
condition. The policy that php-cgi.wvd satisfies ensures that each
condition function executes with ambient capability (i.e., code
executing in the function can open any resources on the system allowed
for the user executing the interpreter).

You can change the implementations of each of the condition functions
to redefine which paths in the file system satisfy which conditions in
the policy requirements. After changing any of the functions in
PHP_ROOT/wvd_policy/pol_validators.c, rebuild php-cgi.wvd using the
instructions given in the next section.


Rebuilding php-cgi.wvd
----------------------

To rebuild php-cgi.wvd after changing the definition of policy
validators (a.k.a. "condition functions"), run:

$ make -f Makefile-wvd php-wvd


Running and Testing php-cgi.wvd
-------------------------------

The build system writes the weaved PHP CGI interpreter at
PHP_ROOT/sapi/cgi/php-cgi.wvd. You can run the weaved interpreter as
you would run the standard PHP interpter, by passing a script as input
to the interpreter over its standard input.

We have included a small script at PHP_ROOT/tests/tiny/tiny.php that
can be used to test the weaved interpreter. To use this script, add
php-cgi.wvd to your path, change your working directory to tests/tiny,
and run:

$ php-cgi.wvd < tiny.php

You can change the files opened in tiny.php, along with the policy
checkers in PHP_ROOT/wvd_policy/pol_validators.c, to experiment with
php-cgi.wvd.
