#!/usr/bin/perl -w

use Hash::KeyMorpher;
use Test::More tests => 33;

# define strings
my $s1 = 'myVar';
my $s2 = 'MyVar';
my $s3 = 'my_var';
my $s4 = 'myBad_var';
my $s5 = 'MYVAR';
my $s6 = 'myvar';

# _split_words
is_deeply([Hash::KeyMorpher::_split_words($s1)],['my','var'],"_split_words ($s1)");
is_deeply([Hash::KeyMorpher::_split_words($s2)],['my','var'],"_split_words ($s2)");
is_deeply([Hash::KeyMorpher::_split_words($s3)],['my','var'],"_split_words ($s3)");
is_deeply([Hash::KeyMorpher::_split_words($s4)],['my','bad','var'],"_split_words ($s4)");
is_deeply([Hash::KeyMorpher::_split_words($s4)],['my','bad','var'],"_split_words ($s4)");
is_deeply([Hash::KeyMorpher::_split_words($s5)],['myvar'],"_split_words ($s5)");
is_deeply([Hash::KeyMorpher::_split_words($s6)],['myvar'],"_split_words ($s6)");

# to_camel
is(to_camel($s1),'MyVar',"to_camel ($s1)");
is(to_camel($s2),'MyVar',"to_camel ($s2)");
is(to_camel($s3),'MyVar',"to_camel ($s3)");
is(to_camel($s4),'MyBadVar',"to_camel ($s4)");
is(to_camel($s5),'Myvar',"to_camel ($s5)");
is(to_camel($s6),'Myvar',"to_camel ($s6)");

# to_mixed
is(to_mixed($s1),'myVar',"to_mixed ($s1)");
is(to_mixed($s2),'myVar',"to_mixed ($s2)");
is(to_mixed($s3),'myVar',"to_mixed ($s3)");
is(to_mixed($s4),'myBadVar',"to_mixed ($s4)");
is(to_mixed($s5),'myvar',"to_mixed ($s5)");
is(to_mixed($s6),'myvar',"to_mixed ($s6)");

# to_delim
is(to_delim($s1,'_'),'my_var',"to_mixed '_' ($s1)");
is(to_delim($s2,'_'),'my_var',"to_mixed '_' ($s2)");
is(to_delim($s3,'_'),'my_var',"to_mixed '_' ($s3)");
is(to_delim($s4,'_'),'my_bad_var',"to_mixed '_' ($s4)");
is(to_delim($s5,'_'),'myvar',"to_mixed '_' ($s4)");
is(to_delim($s6,'_'),'myvar',"to_mixed '_' ($s4)");
is(to_delim($s4),'mybadvar',"to_mixed '' ($s4)");
is(to_delim($s4,'^'),'my^bad^var',"to_mixed '^' ($s4)");

# key_morph hashes
my $h1 = { 'level_one' => { 'LevelTwo' => { 'levelThree' => { 'LEVELFOUR' => 'hello'}, 'the_array' => ['abc',1,2] } } };
my $camel = { 'LevelOne' => { 'LevelTwo' => { 'LevelThree' => { 'Levelfour' => 'hello'}, 'TheArray' => ['abc',1,2] } } };
my $mixed = { 'levelOne' => { 'levelTwo' => { 'levelThree' => { 'levelfour' => 'hello'}, 'theArray' => ['abc',1,2] } } };
my $delim = { 'level_one' => { 'level_two' => { 'level_three' => { 'levelfour' => 'hello'}, 'the_array' => ['abc',1,2] } } };
my $upper = { 'LEVELONE' => { 'LEVELTWO' => { 'LEVELTHREE' => { 'LEVELFOUR' => 'hello'}, 'THEARRAY' => ['abc',1,2] } } };
my $lower = { 'levelone' => { 'leveltwo' => { 'levelthree' => { 'levelfour' => 'hello'}, 'thearray' => ['abc',1,2] } } };

is_deeply(key_morph($h1,'camel'),$camel,'key_morph camel');
is_deeply(key_morph($h1,'mixed'),$mixed,'key_morph camel');
is_deeply(key_morph($h1,'mixed'),$mixed,'key_morph mixed');
is_deeply(key_morph($h1,'delim','_'),$delim,'key_morph delim');
is_deeply(key_morph($h1,'upper'),$upper,'key_morph upper');
is_deeply(key_morph($h1,'lower'),$lower,'key_morph lower');

exit 0;
