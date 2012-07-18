use ExtUtils::MakeMaker;
WriteMakefile(
    NAME      => 'ctf',
    VERSION   => '0.1',
    ABSTRACT  => 'Deploy a repository of configuration files',
    AUTHOR    => 'Tom Jones <tom@oxix.org>',
    EXE_FILES => [ glob('bin/*') ],
    MAN1PODS  => {
	'doc/ctf' => 'blib/man1/ctf.1',
	'doc/ctfi' => 'blib/man1/ctfi.1',
    },
    MAN3PODS  => {
	'doc/prectf' => 'blib/man3/prectf.3',
	'doc/postctf' => 'blib/man3/postctf.3',
    },
);

{
    package MY;

    sub constants {
	my $self = shift;

	my $inherited = $self->SUPER::constants(@_);

	my $prefix = $ExtUtils::MakeMaker::VERSION >= 6.18 ? 'SITEPREFIX' :
	                                                 'PERLPREFIX';

	my $man5 = sprintf <<'EOF', $prefix;
# begin pod-local
INST_MAN5DIR = blib/man5
INSTALLMAN5DIR = $(DESTDIR)$(PREFIX)/share/man/man5
INSTALLSITEMAN5DIR = $(DESTDIR)$(SITEPREFIX)/share/man/man5
INSTALLVENDORMAN5DIR = $(DESTDIR)$(VENDORPREFIX)/share/man/man5
MAN5EXT = 5
# end pod-local

EOF



	return $inherited . $man5;
    }


    sub MY::top_targets {
	my $self = shift;

	use Config;
	my $inherited = $self->SUPER::top_targets(@_);

	my ($perlh) = $self->catfile($Config{archlibexp}, 'CORE', "perl.h");

	my $noecho = q{NOECHO = @} unless $inherited =~ /NOECHO/;

	my $man5 = sprintf <<'EOF', $perlh, $perlh;

# begin pod-local
config :: $(INST_MAN5DIR)/.exists
	@$(NOOP)

$(INST_MAN5DIR)/.exists :: %s
	@$(MKPATH) $(INST_MAN5DIR)
	@$(EQUALIZE_TIMESTAMP) %s $(INST_MAN5DIR)/.exists
	-@$(CHMOD) $(PERM_RWX) $(INST_MAN5DIR)
# end pod-local

EOF


	return $inherited . $man5;
    }


    sub MY::manifypods {
	my $self = shift;
	my $inherited = $self->SUPER::manifypods(@_);

	$inherited =~ s{^(manifypods : .*)\\}{$1 manifypods-local \\}m;

	# MakeMaker 6.06_x through 6.13 eliminated the POD2MAN macro.
	my $pod2man = $inherited =~ /^POD2MAN\b/m ? ''
	                                      : 'POD2MAN = $(POD2MAN_EXE)';

	my $manifypods_this = sprintf <<'MAKE_FRAG', $pod2man;

# begin pod-local
%s

manifypods-local : $(INST_MAN5DIR)/ctf.conf.$(MAN5EXT) \
  $(INST_MAN5DIR)/ctf.manifest.$(MAN5EXT)

$(INST_MAN5DIR)/%%.$(MAN5EXT): doc/%%
	$(POD2MAN) --section=5 $< $@

#end pod-local
MAKE_FRAG

	return $inherited . "\n" . $manifypods_this;
    }


    sub MY::install {
	my $self = shift;

	my $inherited = $self->SUPER::install(@_);

	my $man5 = q{ \\
	        $(INST_MAN5DIR) $(INSTALLMAN5DIR)};

	$inherited =~ s/(\$\((?:DEST)?INSTALL\w*MAN1DIR\))/$1$man5/gm;

	return $inherited;
    }
}

