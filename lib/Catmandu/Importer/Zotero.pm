package Catmandu::Importer::Zotero;

use Catmandu::Sane;
use Catmandu::Util qw(:is);
use WWW::Zotero;
use Moo;


with 'Catmandu::Importer';

has userID  => (is => 'ro');
has groupID => (is => 'ro');
has apiKey  => (is => 'ro');

# From WWW::Zotero
has sort      => (is => 'ro');
has direction => (is => 'ro');
has itemKey   => (is => 'ro');
has itemType  => (is => 'ro');
has q         => (is => 'ro');
has qmode     => (is => 'ro');
has since     => (is => 'ro');
has tag       => (is => 'ro');

has client  => (is => 'lazy');

sub _build_client {
    my ($self) = @_;
    WWW::Zotero->new(key => $self->apiKey);
}

sub generator {
    my ($self) = @_;

    my %options = ();

    $options{user}      = $self->userID if $self->userID;
    $options{group}     = $self->groupID if $self->groupID;
    $options{sort}      = $self->sort if $self->sort;
    $options{direction} = $self->direction if $self->direction;
    $options{itemKey}   = $self->itemKey if $self->itemKey;
    $options{itemType}  = $self->itemType if $self->itemType;
    $options{q}         = $self->q if $self->q();
    $options{qmode}     = $self->qmode if $self->qmode;
    $options{since}     = $self->since if $self->since;
    $options{tag}       = $self->tag if $self->tag;
    $options{include}   = 'data';
    
    $self->client->listItems(%options, generator => 1);
}

1;

__END__

=head1 NAME

Catmandu::Importer::Zotero - Import records from Zotero web

=head1 SYNOPSIS

    # From the command line
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

=head1 CONFIGURATION

See L<https://www.zotero.org/support/dev/web_api/v3/basics> for the search syntax.

=over

=item userID | groupID

Set the user or group identifier for which you want to export records

=item apiKey

Zotero API key for authenticated access.

=item sort      

dateAdded, dateModified, title, creator, type, date, publisher, 
publicationTitle, journalAbbreviation, language, accessDate, 
libraryCatalog, callNumber, rights, addedBy, numItems (default dateModified)
    
=item direction 

asc, desc
    
=item include   

bib, data

=item itemKey    

A comma-separated list of item keys. Valid only for item requests. Up to 
50 items can be specified in a single request.
    
=item itemType   

Item type search
    
=item q   

Quick search
    
=item qmode    

titleCreatorYear, everything
    
=item since   

integer
    
=item tag 

Tag search

=back

=head1 DESCRIPTION

Every Catmandu::Importer is a L<Catmandu::Iterable> all its methods are
inherited. The Catmandu::Importer::Zotero methods are not idempotent: Zotero
feeds can only be read once.

=head1 SEE ALSO

L<WWW::Zotero> ,
L<Catmandu::Importer> ,
L<Catmandu::Iterable>

=cut
