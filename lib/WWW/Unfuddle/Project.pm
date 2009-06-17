package WWW::Unfuddle::Project;
use Moose;
use Moose::Util::TypeConstraints; # XXX

has account_id => (
    is  => 'ro',
    isa => 'Int',
);

has archived => (
    is  => 'ro',
    isa => 'Bool',
);

has assignee_on_resolve => (
    is  => 'ro',
    isa => enum(qw(reporter none nochange)),
);

has close_ticket_simultaneously_default => (
    is  => 'ro',
    isa => 'Bool',
);

has created_at => (
    is  => 'ro',
    isa => 'DateTime',
);

has default_ticket_report_id => (
    is  => 'ro',
    isa => 'Int',
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
    isa => 'Bool',
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
    isa => enum(qw(blue green grey orange purple red teal)),
);

has title => (
    is  => 'ro',
    isa => 'Str',
);

has updated_at => (
    is  => 'ro',
    isa => 'DateTime',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
