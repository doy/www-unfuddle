package WWW::Unfuddle::Project;
use Moose;
use WWW::Unfuddle::Meta::Types;

has account_id => (
    is  => 'ro',
    isa => 'Int',
);

has archived => (
    is  => 'ro',
    isa => 'WWW::Unfuddle::Bool',
    coerce => 1,
);

has assignee_on_resolve => (
    is  => 'ro',
    isa => 'WWW::Unfuddle::Assignee',
);

has close_ticket_simultaneously_default => (
    is  => 'ro',
    isa => 'WWW::Unfuddle::Bool',
    coerce => 1,
);

has created_at => (
    is  => 'ro',
    isa => 'WWW::Unfuddle::DateTime',
    coerce => 1,
);

has default_ticket_report_id => (
    is  => 'ro',
    isa => 'Maybe[Int]',
);

has description => (
    is  => 'ro',
    isa => 'Str',
);

has disk_usage => (
    is  => 'ro',
    isa => 'Int',
);

has enable_time_tracking => (
    is  => 'ro',
    isa => 'WWW::Unfuddle::Bool',
    coerce => 1,
);

has id => (
    is  => 'ro',
    isa => 'Int',
);

has short_name => (
    is  => 'ro',
    isa => 'Str',
);

has theme => (
    is  => 'ro',
    isa => 'WWW::Unfuddle::ThemeColor',
);

has title => (
    is  => 'ro',
    isa => 'Str',
);

has updated_at => (
    is  => 'ro',
    isa => 'WWW::Unfuddle::DateTime',
    coerce => 1,
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
