use strict;
use warnings;

use Module::Build;

# If you don't support 64-bit pack formats you will have a bad time and will
# not talk to Cassandra today
eval { pack( "q>", 1 ) eq "\0\0\0\0\0\0\0\1" } or
   die "OS unsupported - no 64bit integers";

my $build = Module::Build->new(
   module_name => 'Protocol::CassandraCQL',
   requires => {
      'Compress::Snappy' => 0,
      'Encode' => 0,
      'Math::BigInt' => 0,
      'IO::Socket::IP' => 0,
   },
   build_requires => {
      'Test::HexString' => 0,
      'Test::Fatal' => 0,
      'Test::More' => '0.88', # done_testing
   },
   auto_configure_requires => 0, # Don't add M::B to configure_requires
   license => 'perl',
   create_makefile_pl => 'small', # since we do active testing here
   create_license => 1,
   create_readme  => 1,
);

$build->create_build_script;
