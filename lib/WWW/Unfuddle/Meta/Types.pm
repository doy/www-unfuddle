package WWW::Unfuddle::Meta::Types;
use Moose::Util::TypeConstraints;
use DateTime::Format::ISO8601;
use JSON;

class_type 'JSON::Boolean';
subtype 'WWW::Unfuddle::Bool', as 'Bool', where { !ref($_) };
coerce  'WWW::Unfuddle::Bool', from 'JSON::Boolean',
    via { $_ == JSON::true };

# 2009-06-16T22:55:06Z
class_type 'DateTime';
subtype 'WWW::Unfuddle::DateTime', as 'DateTime';
coerce  'WWW::Unfuddle::DateTime', from 'Str',
    via { DateTime::Format::ISO8601->new->parse_datetime($_) };

enum 'WWW::Unfuddle::Assignee'   => qw(reporter none nochange);
enum 'WWW::Unfuddle::ThemeColor' => qw(blue green grey orange purple red teal);

1;
