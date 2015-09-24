requires 'perl', 'v5.10.1';

on 'test', sub {
  requires 'Test::Simple', '1.001003';
  requires 'Test::More', '1.001003';
  requires 'Test::Exception','0.32';
};

requires 'Catmandu', '>=0.9';
requires 'WWW::Zotero', '0';

# Need recent SSL to talk to https endpoint correctly
requires 'IO::Socket::SSL', '>=1.993';
