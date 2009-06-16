package WWW::Unfuddle;
use Moose;
use LWP::UserAgent;
use JSON;

has username => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has password => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has subdomain => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has ua => (
    is       => 'ro',
    isa      => 'LWP::UserAgent',
    lazy     => 1,
    default  => sub {
        my $self = shift;
        my $ua = LWP::UserAgent->new;
        $ua->credentials($self->_domain . ':80', 'Unfuddle API',
                         $self->username, $self->password);
        return $ua;
    },
);

sub _domain {
    my $self = shift;
    return $self->subdomain . '.unfuddle.com';
}

sub _api_url {
    my $self = shift;
    my @path = @_;
    return 'http://' . $self->_domain . '/api/v1/' . join('/', @path) . '.json';
}

sub list_projects {
    my $self = shift;
    my $request = HTTP::Request->new(GET => $self->_api_url('projects'));
    $request->header(Accept => 'application/json');
    my $response = $self->ua->request($request);
    my $projects = from_json($response->content);
    for my $project (@$projects) {
        print $project->{short_name}, "\n";
    }
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;
