
use strict;
use warnings FATAL => 'all';
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'PlaySpine',
    license             => 'Artistic_2_0',
    dist_author         => q{Kartik Thakore <kthakore@cpan.org>},
    dist_version_from   => 'lib/PlaySpine.pm',
    release_status      => 'unstable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'Moose'              => 2.000
        #'Foo::Bar::Module' => 5.0401,
    },
    add_to_cleanup     => [ 'PlaySpine-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
