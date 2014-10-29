### Hash-KeyMorpher

Deeply convert Hash keynames (or strings) to different naming convesions such as CamelCase, mixedCamelCase, delim_string 

* * *

#### Usage

``` perl
use Hash::Keymorpher; # import all, or
use Hash::Keymorpher qw (key_morph to_camel to_mixed to_delim); # import specific subs

# To use the string converters:
$res = to_camel('my_string'); # MyString
$res = to_mixed('my_string'); # myString
$res = to_under('myString');  # my_string
$res = to_delim('myString','-');  # my-string

# To morph keys in a hash
# The hash is the first parameter,
# Method is the second (camel/mixed/delim/upper/lower)
# If using delim, the third parameter must be the deliminator (eg '_')
$hash = key_morph($myhash,$method);
$hash = key_morph($myhash,$method,$delim);

# e.g.
$h1 = { 'level_one' => { 'LevelTwo' => 'foo' } };
$camel = key_morph($h1,'delim','_');
# becomes { 'level_one' => { 'level_two' => 'foo' } };
```
