#!/usr/bin/perl -w

use Object::KeyMorpher;
use Test::More tests => 3;
use Object::Accessor;


my $obj = Object::Accessor->new(qw /CamelCase mixedCase delim_str UPPER lower/);
$obj->mixedCase(Object::Accessor->new(qw/CamelTwo mixedTwo/));
$obj->delim_str(Object::Accessor->new(qw/CamelThree mixedThree/));
$obj->mixedCase()->CamelTwo('foo');
$obj->delim_str()->CamelThree('var');

isa_ok($obj,'Object::Accessor','is an accessor');

my $camel = Object::Accessor->new(qw /CamelCase MixedCase DelimStr Upper Lower/);
$camel->MixedCase(Object::Accessor->new(qw/CamelTwo MixedTwo/));
$camel->DelimStr(Object::Accessor->new(qw/CamelThree MixedThree/));
$camel->MixedCase()->CamelTwo('foo');
$camel->DelimStr()->CamelThree('var');

my $mixed= Object::Accessor->new(qw /camelCase mixedCase delimStr upper lower/);
$mixed->mixedCase(Object::Accessor->new(qw/camelTwo mixedTwo/));
$mixed->delimStr(Object::Accessor->new(qw/camelThree mixedThree/));
$mixed->mixedCase()->camelTwo('foo');
$mixed->delimStr()->camelThree('var');

is_deeply(key_morph($obj,'camel'),$camel,'key_morph accessor camel');
is_deeply(key_morph($obj,'mixed'),$mixed,'key_morph accessor camel');

exit 0;