use Module::Build;

my $build = Module::Build->new
  (
   module_name => 'WWW::RIPE::LIRPortal',
   license => 'perl',
   requires => {
                'perl'           => '5.8.0',
                'WWW::Mechanize' => '1.02',
                'Crypt::SSLeay'  => undef,
               },
  );

$build->create_build_script;
