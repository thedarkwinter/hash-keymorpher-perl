use ExtUtils::MakeMaker;

WriteMakefile(
    NAME            => 'Object::KeyMorpher',
    VERSION_FROM    => 'lib/Object/KeyMorpher.pm',
    AUTHOR          => 'Michael Holloway <michael@thedarkwinter.com>',
    PREREQ_PM       => { 'Test::More' => 0, 'Exporter' =>0 },
    dist            => { COMPRESS => 'gzip', SUFFIX => '.gz', },
);
