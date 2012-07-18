<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ctf - configuration file deployer</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rev="made" href="mailto:root@localhost" />
</head>

<body style="background-color: white">


<!-- INDEX BEGIN -->
<div name="index">
<p><a name="__index__"></a></p>

<ul>

	<li><a href="#name">NAME</a></li>
	<li><a href="#synopsis">SYNOPSIS</a></li>
	<li><a href="#description">DESCRIPTION</a></li>
	<ul>

		<li><a href="#options">OPTIONS</a></li>
	</ul>

	<li><a href="#see_also">SEE ALSO</a></li>
</ul>

<hr name="index" />
</div>
<!-- INDEX END -->

<p>
</p>
<h1><a name="name">NAME</a></h1>
<p>ctf - configuration file deployer</p>
<p>
</p>
<hr />
<h1><a name="synopsis">SYNOPSIS</a></h1>
<pre>
  ctf [PATH ...]</pre>
<p>
</p>
<hr />
<h1><a name="description">DESCRIPTION</a></h1>
<p>ctf deploys managed configuration files from the configured repository
as specified in <em>ctf.conf(5)</em>.</p>
<p>ctf expects to find a <em>ctf.manifest(5)</em> directly
in the top level content directory.
The configuration files to deploy are found in subdirectories of the
content directory; each of these top-level 
subdirectories is called a component.</p>
<p>If PATH ... is supplied, only files under those paths are
deployed.</p>
<p>By default, when a file's content is changed, a backup copy of the
file is taken.  The backup file's name is based on the main file's
name, but with a . prepended and &quot;.ctfprev&quot; appended.  The backup
file path can be overridden or disabled per file (see <em>ctf.manifest(5)</em>),
or backup files can be disabled altogether (see --no-backups below).</p>
<p>
</p>
<h2><a name="options">OPTIONS</a></h2>
<dl>
<dt><strong><a name="c_config_cf" class="item">-c,--config CF</a></strong></dt>

<dd>
<p>Use CF as the configuration file.  The default configuration file is
/etc/ctf/ctf.conf for root, or ~/.ctf.conf for other users.</p>
</dd>
<dt><strong><a name="c_content_dir" class="item">-C,--content=DIR</a></strong></dt>

<dd>
<p>Use DIR as the content directory.  Defaults to /var/lib/ctf/content for 
root, or ~/.ctf/content for other users.  Can also be controlled by
the &quot;contentdir&quot; setting in ctf.conf(5), though the command line
option takes precedence.</p>
</dd>
<dt><strong><a name="t_test" class="item">-t,--test</a></strong></dt>

<dd>
<p>Report on what would be deployed, but don't do it.  Executes
prectf programs.</p>
</dd>
<dt><strong><a name="p_nopre" class="item">-P,--nopre</a></strong></dt>

<dd>
<p>Don't execute prectf programs.</p>
</dd>
<dt><strong><a name="t_nopost" class="item">-T,--nopost</a></strong></dt>

<dd>
<p>Don't execute postctf programs.</p>
</dd>
<dt><strong><a name="s_safe" class="item">-s,--safe</a></strong></dt>

<dd>
<p>Report on what would be changed, without executing any content from
the repository.  Currently equivalent to <code>-tP</code>.</p>
</dd>
<dt><strong><a name="h_home_src_path" class="item">-H,--home-src=PATH</a></strong></dt>

<dd>
<p>Override the input location of the built-in &quot;home&quot; component.  The default
is a directory named &quot;home&quot; in the content directory.</p>
</dd>
<dt><strong><a name="i_home_dst_path" class="item">-I,--home-dst=PATH</a></strong></dt>

<dd>
<p>Override the output location of the built-in &quot;home&quot; component.  The default
is $HOME taken from the environment.</p>
</dd>
<dt><strong><a name="r_root_src_path" class="item">-r,--root-src=PATH</a></strong></dt>

<dd>
<p>Override the input location of the built-in &quot;root&quot; component.  The default
is a directory named &quot;root&quot; in the content directory.</p>
</dd>
<dt><strong><a name="r_root_dst_path" class="item">-R,--root-dst=PATH</a></strong></dt>

<dd>
<p>Override the output location of the built-in &quot;root&quot; component.  The default
is &quot;/&quot;.</p>
</dd>
<dt><strong><a name="comp_name_and_comp_src_path_and_comp_dst_path" class="item">--comp=NAME and --comp-src=PATH and --comp-dst=PATH</a></strong></dt>

<dd>
<p>These may be defined in future to allow extra components to be
defined for the user.</p>
</dd>
<dt><strong><a name="b_no_backups" class="item">-B, --no-backups</a></strong></dt>

<dd>
<p>Don't take any backup copies of files.</p>
</dd>
<dt><strong><a name="h_help" class="item">-h,--help</a></strong></dt>

</dl>
<p>
</p>
<hr />
<h1><a name="see_also">SEE ALSO</a></h1>
<p>ctf.conf(5)
ctf.manifest(5)</p>

</body>

</html>
