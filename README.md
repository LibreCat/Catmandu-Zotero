# NAME

Catmandu::Zotero - Catmandu modules for working with Zotero web

# STATUS

[![Build Status](https://travis-ci.org/LibreCat/Catmandu-Zotero.png)](https://travis-ci.org/LibreCat/Catmandu-Zotero)
[![Coverage Status](https://coveralls.io/repos/LibreCat/Catmandu-Zotero/badge.png)](https://coveralls.io/r/LibreCat/Catmandu-Zotero)
[![Kwalitee Score](http://cpants.cpanauthors.org/dist/Catmandu-Zotero.png)](http://cpants.cpanauthors.org/dist/Catmandu-Zotero)

# SYNOPSIS

    # From the command line
    $ catmandu convert Zotero --userID <userID> to JSON
    $ catmandu convert Zotero --groupID <groupID> to JSON
    
    # From Perl
    use Catmandu;

    my $importer = Catmandu->importer('Zotero', userID => '...');

    $importer->each(sub {
             my $item = shift;
             print "%s %s\n", $item->{_id} , $item->{title}->[0];
    });

# MODULES

- [Catmandu::Importer::Zotero](https://metacpan.org/pod/Catmandu::Importer::Zotero)

# EXAMPLES

See [https://github.com/LibreCat/Catmandu-Zotero/tree/master/example/zotero\_marc.fix](https://github.com/LibreCat/Catmandu-Zotero/tree/master/example/zotero_marc.fix) for an
use case how to transform a Zotero library into a MARCXML dump:

    $ catmandu convert Zotero --groupID <key> to MARC --type XML --fix zotero.fix 

# AUTHOR

Patrick Hochstenbach, `patrick.hochstenbach at ugent.be`

## CONTRIBUTORS

Jakob Voss, `voss at gbv.de`

# LICENSE AND COPYRIGHT

Copyright 2015 Patrick Hochstenbach

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
